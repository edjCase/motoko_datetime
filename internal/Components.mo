import InternalTypes "Types";
import NumberUtil "NumberUtil";
import TextUtil "TextUtil";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Int "mo:base/Int";
import InternalTimeZone "TimeZone";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Prelude "mo:base/Prelude";
import Array "mo:base/Array";
import Float "mo:base/Float";

module Module {

    type Components = InternalTypes.Components;
    type DateComponents = InternalTypes.DateComponents;
    type DayOfWeek = InternalTypes.DayOfWeek;
    type Duration = InternalTypes.Duration;
    type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor;
    type TimeZone = InternalTypes.TimeZone;
    type Locale = InternalTypes.Locale;
    type Era = InternalTypes.Era;

    public type CalculatedDuration = {
        #adder : (Components) -> Components;
        #absoluteTime : Int;
    };

    public func resolveDuration(duration : Duration) : CalculatedDuration {
        switch (duration) {
            case (#nanoseconds(nanoseconds)) {
                #absoluteTime(nanoseconds);
            };
            case (#milliseconds(milliseconds)) {
                #absoluteTime(milliseconds * 1_000_000);
            };
            case (#seconds(seconds)) {
                #absoluteTime(seconds * 1_000_000_000);
            };
            case (#minutes(minutes)) {
                #absoluteTime(minutes * 60 * 1_000_000_000);
            };
            case (#hours(hours)) {
                #absoluteTime(hours * 60 * 60 * 1_000_000_000);
            };
            case (#days(days)) {
                #absoluteTime(days * 24 * 60 * 60 * 1_000_000_000);
            };
            case (#weeks(weeks)) {
                #absoluteTime(weeks * 7 * 24 * 60 * 60 * 1_000_000_000);
            };
            case (#months(months)) {
                #adder(
                    func(components : Components) : Components {
                        // TODO validate leap stuff
                        let newMonth : Int = components.month + months;
                        let newYear : Int = components.year + newMonth / 12;
                        let newMonthInYear : Nat = Int.abs(newMonth % 12);
                        let isLeapYear : Bool = Module.isLeapYear(newYear);
                        let maxDaysInMonth : Nat = Module.daysInMonth(newMonthInYear, isLeapYear);
                        let dayIsNotInMonth = components.day > maxDaysInMonth;
                        let newDay : Nat = if (dayIsNotInMonth) {
                            // If not in the month then use the last day of the current month
                            maxDaysInMonth;
                        } else {
                            components.day;
                        };
                        {
                            components with
                            year = newYear;
                            month = newMonthInYear;
                            day = newDay;
                        };
                    }
                );
            };
            case (#years(years)) {
                #adder(
                    func(components : Components) : Components {
                        // TODO validate leap stuff
                        let newYear : Int = components.year + years;
                        {
                            year = newYear;
                            month = components.month;
                            day = components.day;
                            hour = components.hour;
                            minute = components.minute;
                            nanosecond = components.nanosecond;
                        };
                    }
                );
            };
        };
    };

    public func isValid(components : Components) : Bool {
        let leapYear = isLeapYear(components.year);

        let daysInM = daysInMonth(components.month, leapYear);

        if (components.day == 0 or components.day > daysInM) {
            return false;
        };

        if (components.hour >= 24) {
            return false;
        };

        if (components.minute >= 60) {
            return false;
        };

        if (components.nanosecond >= 60_000_000_000) {
            return false;
        };

        return true;
    };

    public func toTime(components : Components) : Time.Time {
        throwIfNotValid(components);
        let nanosecondsInAMinute = 60 * 1000000000;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;
        var totalNanoseconds : Int = 0;

        if (components.year < 1970) {
            // For dates before the epoch, need to do the inverse
            var currentYear : Int = 1969;
            while (currentYear > components.year) {
                totalNanoseconds -= daysInYear(currentYear) * nanosecondsInADay;
                currentYear -= 1;
            };

            // Month
            let currentIsLeapYear = isLeapYear(components.year);
            var currentMonth = 12;
            while (currentMonth > components.month) {
                totalNanoseconds -= daysInMonth(currentMonth, currentIsLeapYear) * nanosecondsInADay;
                currentMonth -= 1;
            };
            let daysInMonthV = daysInMonth(components.month, currentIsLeapYear);
            // Day
            totalNanoseconds -= (daysInMonthV - components.day) * nanosecondsInADay;
            // Hour
            totalNanoseconds -= (23 - components.hour) * nanosecondsInAnHour;

            // Minute
            totalNanoseconds -= (59 - components.minute) * nanosecondsInAMinute;

            // Nanosecond
            totalNanoseconds -= 60_000_000_000 - components.nanosecond;
        } else {

            var currentYear = 1970;
            while (currentYear < components.year) {
                totalNanoseconds += daysInYear(currentYear) * nanosecondsInADay;
                currentYear += 1;
            };

            // Month
            let currentIsLeapYear = isLeapYear(components.year);
            var currentMonth = 1;
            while (currentMonth < components.month) {
                totalNanoseconds += daysInMonth(currentMonth, currentIsLeapYear) * nanosecondsInADay;
                currentMonth += 1;
            };

            // Day
            totalNanoseconds += (components.day - 1) * nanosecondsInADay;

            // Hour
            totalNanoseconds += components.hour * nanosecondsInAnHour;

            // Minute
            totalNanoseconds += components.minute * nanosecondsInAMinute;

            // Nanosecond
            totalNanoseconds += components.nanosecond;
        };
        totalNanoseconds;
    };

    public func toTextFormatted(
        components : Components,
        timeZone : TimeZone,
        locale : Locale,
        format : InternalTypes.TextFormat,
    ) : Text {
        throwIfNotValid(components);

        let customFormat : Text = switch (format) {
            case (#iso8601) "%Y-%m-%dT%H:%M:%S.%N%z";
            case (#custom(customFormat)) customFormat;
        };

        // TODO optimize
        var text = customFormat;

        // Month
        text := Text.replace(text, #text("M"), Nat.toText(components.month));

        let monthWithOrdinal = locale.getOrdinal(components.month);
        text := Text.replace(text, #text("Mo"), monthWithOrdinal);

        text := Text.replace(text, #text("MM"), TextUtil.toTextPadded(components.month, 2));

        let shortMonth = locale.monthsShort[components.month - 1];
        text := Text.replace(text, #text("MMM"), shortMonth);

        let fullMonth = locale.months[components.month - 1];
        text := Text.replace(text, #text("MMMM"), fullMonth);

        // Quarter
        let quarter = components.month / 3 + 1;
        text := Text.replace(text, #text("Q"), Nat.toText(quarter));

        text := Text.replace(text, #text("Qo"), locale.getOrdinal(quarter));

        // Day of Month
        text := Text.replace(text, #text("D"), Nat.toText(components.day));

        let dayWithOrdinal = locale.getOrdinal(components.day);
        text := Text.replace(text, #text("Do"), dayWithOrdinal);

        text := Text.replace(text, #text("DD"), TextUtil.toTextPadded(components.day, 2));

        // Day of Year
        let dayOfYearValue = dayOfYear(components, locale.firstDayOfYear);
        text := Text.replace(text, #text("DDD"), Nat.toText(dayOfYearValue));

        let dayOfYearWithOrdinal = locale.getOrdinal(dayOfYearValue);
        text := Text.replace(text, #text("DDDo"), dayOfYearWithOrdinal);

        text := Text.replace(text, #text("DDDD"), TextUtil.toTextPadded(dayOfYearValue, 3));

        // Day of Week
        let dayOfWeek = dayOfWeekIndex(components);
        text := Text.replace(text, #text("d"), Nat.toText(dayOfWeek));

        let dayOfWeekWithOrdinal = locale.getOrdinal(dayOfWeek);
        text := Text.replace(text, #text("do"), dayOfWeekWithOrdinal);

        text := Text.replace(text, #text("dd"), locale.weekdaysMin[dayOfWeek]);

        text := Text.replace(text, #text("ddd"), locale.weekdaysShort[dayOfWeek]);

        text := Text.replace(text, #text("dddd"), locale.weekdays[dayOfWeek]);

        // Day of Week (Locale)
        text := Text.replace(text, #text("e"), Nat.toText(dayOfWeek + locale.firstDayOfWeek));

        // Day of Week (ISO)
        text := Text.replace(text, #text("E"), Nat.toText(dayOfWeek + 1));

        // Week of Year
        let localeWeekOfYear = weekOfYear(components, locale.firstDayOfWeek, locale.firstDayOfYear);
        text := Text.replace(text, #text("w"), Nat.toText(localeWeekOfYear));

        let localeWeekOfYearWithOrdinal = locale.getOrdinal(localeWeekOfYear);
        text := Text.replace(text, #text("wo"), localeWeekOfYearWithOrdinal);

        text := Text.replace(text, #text("ww"), TextUtil.toTextPaddedSign(localeWeekOfYear, 2, false));

        // Week of Year (ISO)
        let isoWeekOfYear = weekOfYear(components, 1, 4); // ISO week year starts on thursday (4)
        text := Text.replace(text, #text("W"), Nat.toText(isoWeekOfYear));

        let isoWeekOfYearWithOrdinal = locale.getOrdinal(isoWeekOfYear);
        text := Text.replace(text, #text("Wo"), isoWeekOfYearWithOrdinal);

        text := Text.replace(text, #text("WW"), TextUtil.toTextPaddedSign(isoWeekOfYear, 2, false));

        // Year
        text := Text.replace(text, #text("Y"), TextUtil.toTextPaddedSign(components.year, 1, components.year > 9999));

        text := Text.replace(text, #text("YY"), TextUtil.toTextPaddedSign(components.year % 100, 2, false));

        text := Text.replace(text, #text("YYYY"), TextUtil.toTextPaddedSign(components.year, 4, false));

        text := Text.replace(text, #text("YYYYYY"), TextUtil.toTextPaddedSign(components.year, 6, true));

        // Era Year
        let now = toTime(components);
        let ?era = Array.find<Era>(
            locale.eras,
            func(e) {
                let onOrAfterStart = switch (e.start) {
                    case (null) true;
                    case (?start) now >= start;
                };
                let beforeEnd = switch (e.end) {
                    case (null) true;
                    case (?end) now < end;
                };
                return onOrAfterStart and beforeEnd;
            },
        ) else Debug.trap("No era found for date and locale. Date: " # debug_show (components) # ", Locale: " # locale.id);

        let eraYear = Int.abs(components.year);

        text := Text.replace(text, #text("y"), Nat.toText(eraYear));

        text := Text.replace(text, #text("yo"), locale.getOrdinal(eraYear));

        text := Text.replace(text, #text("yy"), Nat.toText(eraYear));

        text := Text.replace(text, #text("yyy"), Nat.toText(eraYear));

        text := Text.replace(text, #text("yyyy"), Nat.toText(eraYear));

        text := Text.replace(text, #text("yyyyy"), Nat.toText(eraYear));

        // Era
        text := Text.replace(text, #text("N"), era.abbreviatedName);

        text := Text.replace(text, #text("NN"), era.abbreviatedName);

        text := Text.replace(text, #text("NNN"), era.abbreviatedName);

        text := Text.replace(text, #text("NNNN"), era.fullName);

        text := Text.replace(text, #text("NNNNN"), era.narrowName);

        // Week Year
        let localeWeekYear = weekYear(components, locale.firstDayOfYear);
        text := Text.replace(text, #text("gg"), TextUtil.toTextPaddedSign(localeWeekYear % 100, 2, false));

        text := Text.replace(text, #text("gggg"), TextUtil.toTextPaddedSign(localeWeekYear, 4, false));

        // Week Year (ISO)
        let isoWeekYear = weekYear(components, 4); // ISO week year starts on thursday (4)
        text := Text.replace(text, #text("GG"), TextUtil.toTextPaddedSign(isoWeekYear % 100, 2, false));

        text := Text.replace(text, #text("GGGG"), TextUtil.toTextPaddedSign(isoWeekYear, 4, false));

        // AM/PM
        text := Text.replace(text, #text("A"), locale.getMeridiem(components.hour, components.minute, true));

        text := Text.replace(text, #text("a"), locale.getMeridiem(components.hour, components.minute, false));

        // Hour
        text := Text.replace(text, #text("H"), Nat.toText(components.hour));

        text := Text.replace(text, #text("HH"), TextUtil.toTextPaddedSign(components.hour, 2, false));

        text := Text.replace(text, #text("h"), Nat.toText(components.hour % 12 + 1));

        text := Text.replace(text, #text("hh"), TextUtil.toTextPaddedSign(components.hour % 12 + 1, 2, false));

        text := Text.replace(text, #text("k"), Nat.toText(components.hour + 1));

        text := Text.replace(text, #text("kk"), TextUtil.toTextPaddedSign(components.hour + 1, 2, false));

        // Minute
        text := Text.replace(text, #text("m"), Nat.toText(components.minute));

        text := Text.replace(text, #text("mm"), TextUtil.toTextPaddedSign(components.minute, 2, false));

        // Second
        let second = components.nanosecond / 1_000_000_000;
        text := Text.replace(text, #text("s"), Nat.toText(second));

        text := Text.replace(text, #text("ss"), TextUtil.toTextPaddedSign(second, 2, false));

        // Fractional Second
        let fractionalSecond = Float.fromInt(components.nanosecond) / 60_000_000_000.0;
        text := Text.replace(text, #text("S"), Float.format(#fix(1), fractionalSecond));

        text := Text.replace(text, #text("SS"), Float.format(#fix(2), fractionalSecond));

        text := Text.replace(text, #text("SSS"), Float.format(#fix(3), fractionalSecond));

        text := Text.replace(text, #text("SSSS"), Float.format(#fix(4), fractionalSecond));

        text := Text.replace(text, #text("SSSSS"), Float.format(#fix(5), fractionalSecond));

        text := Text.replace(text, #text("SSSSSS"), Float.format(#fix(6), fractionalSecond));

        text := Text.replace(text, #text("SSSSSSS"), Float.format(#fix(7), fractionalSecond));

        text := Text.replace(text, #text("SSSSSSSS"), Float.format(#fix(8), fractionalSecond));

        text := Text.replace(text, #text("SSSSSSSSS"), Float.format(#fix(9), fractionalSecond));

        // Time Zone
        text := Text.replace(text, #text("z"), timeZone.abbreviatedName);

        text := Text.replace(text, #text("zz"), timeZone.abbreviatedName);

        text := Text.replace(text, #text("Z"), timeZone.getOffset());

        text := Text.replace(text, #text("ZZ"), timeZone.getOffset("noColon"));

        // Unix Timestamp
        let unixTimestamp = Int.toText(now / 1_000_000_000);
        text := Text.replace(text, #text("X"), unixTimestamp);

        // Unix Millisecond Timestamp
        let unixMsTimestamp = Int.toText(now / 1_000_000);
        text := Text.replace(text, #text("x"), unixMsTimestamp);

        text;
    };

    public func dayOfWeek(components : DateComponents) : DayOfWeek {
        let intValue = dayOfWeekIndex(components);
        switch (intValue) {
            case (0) #sunday;
            case (1) #monday;
            case (2) #tuesday;
            case (3) #wednesday;
            case (4) #thursday;
            case (5) #friday;
            case (6) #saturday;
            case _ Prelude.unreachable();
        };
    };

    public func throwIfNotValid(components : Components) : () {
        if (not isValid(components)) {
            Debug.trap("Invalid datetime components: " # debug_show (components));
        };
    };

    // array with leading number of days values
    private let monthLeadingValues = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];

    public func dayOfWeekIndex(components : DateComponents) : Nat {
        let d = components.day;
        let m = components.month;
        let y = if (m < 3) components.year else components.year - 1; // if month is less than 3 reduce year by 1

        let t = monthLeadingValues[m - 1];
        let v : Int = if (components.year >= 1582) {
            // Gregorian calendar rules
            (y + y / 4 - y / 100 + y / 400 + t + d);
        } else {
            // Julian calendar rules
            (y + y / 4 + t + d);
        };
        return Int.abs(v) % 7;
    };

    public func daysInYear(year : Int) : Nat {
        let leapYear = isLeapYear(year);
        return if (leapYear) 366 else 365;
    };

    public func isLeapYear(year : Int) : Bool {
        // Leap years are every 4 years, except for every 100 years, except for every 400 years.
        return (year % 4 == 0) and (
            (year % 100 != 0) or (year % 400 == 0)
        );
    };

    public func daysInMonth(month : Nat, isLeapYear : Bool) : Nat {
        switch (month) {
            case (2) if (isLeapYear) 29 else 28;
            case (4 or 6 or 9 or 11) 30;
            case (1 or 3 or 5 or 7 or 8 or 10 or 12) 31;
            case _ Debug.trap("Invalid month: " # Nat.toText(month));
        };
    };

    public func weekYear(date : DateComponents, firstDayOfYear : Nat) : Int {
        if (firstDayOfYear < 1 or firstDayOfYear > 7) {
            Debug.trap("First day must be between 1 and 7. Value: " # Nat.toText(firstDayOfYear));
        };
        // Calculate the day of the year for the given date
        let startOfYear = {
            year = date.year;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            nanosecond = 0;
        };
        let dateTime = { date with hour = 0; minute = 0; nanosecond = 0 };
        let dayOfYear = timeBetween(startOfYear, dateTime) / 24 / 60 / 60 / 1_000_000_000;

        // Calculate the day of the week for the given date (0 = Monday, 6 = Sunday)
        let dayOfWeek = dayOfWeekIndex(date);

        // Check if the date falls in the first week of the year
        let firstDayOfYearIndex : Nat = firstDayOfYear - 1;
        let inFirstWeek = dayOfYear < firstDayOfYear and dayOfWeek >= firstDayOfYearIndex;

        // Check if the date falls in the last week of the previous year
        let lastDayOfYear : Nat = 365 - (7 - firstDayOfYear);
        let inLastWeekOfPrevYear = dayOfYear >= lastDayOfYear and dayOfWeek < firstDayOfYearIndex;

        // Return the correct week year
        if (inFirstWeek) {
            return date.year;
        } else if (inLastWeekOfPrevYear) {
            return date.year - 1;
        } else {
            return date.year;
        };
    };

    public func weekOfYear(components : DateComponents, firstDayOfWeek : Nat, firstDayOfYear : Nat) : Nat {
        let dayOfYearValue = dayOfYear(components, firstDayOfYear);

        // Calculate the week number
        var weekNumber : Nat = (dayOfYearValue / 7) + 1;

        // If the first day of the year was before the `firstDayOfYear`, add 1 to the week number
        if (firstDayOfWeek < firstDayOfYear) {
            weekNumber += 1;
        };

        return weekNumber;

    };

    public func dayOfYear(date : DateComponents, firstDayOfYear : Nat) : Nat {
        let startOfYear = {
            year = date.year;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            second = 0;
            nanosecond = 0;
        };
        let dateTime = { date with hour = 0; minute = 0; nanosecond = 0 };
        let time = timeBetween(startOfYear, dateTime);
        Int.abs(time) / 24 / 60 / 60 / 1_000_000_000;
    };

    public func timeBetween(start : Components, end : Components) : Int {
        let startTime = toTime(start);
        let endTime = toTime(end);
        return endTime - startTime;
    };

};
