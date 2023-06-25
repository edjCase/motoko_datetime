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
import TimeZone "TimeZone";
import Components "Components";

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
        format : InternalTypes.TextFormat,
    ) : Text {
        throwIfNotValid(components);

        let customFormat : Text = switch (format) {
            case (#iso8601) "%Y-%m-%dT%H:%M:%S.%N%z";
            case (#custom({ format; locale })) format;
        };

        let replacements = [
            {
                // Month
                value = "M";
                getter = func(components : Components, locale : ?Locale) : Text {
                    Nat.toText(components.month);
                };
            },
            {
                // Month with ordinal
                value = "Mo";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    l.getOrdinal(components.month);
                };
            },
            {
                // Padded Month
                value = "MM";
                getter = func(components : Components, locale : ?Locale) : Text {
                    TextUtil.toTextPadded(components.month, 2);
                };
            },
            {
                // Short Month
                value = "MMM";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    l.monthsShort[components.month - 1];
                };
            },
            {
                // Full Month
                value = "MMMM";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    l.months[components.month - 1];
                };
            },
            {
                // Quarter
                value = "Q";
                getter = func(components : Components, locale : ?Locale) : Text {
                    Nat.toText(components.month / 3 + 1);
                };
            },
            {
                // Quarter with ordinal
                value = "Qo";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    l.getOrdinal(components.month / 3 + 1);
                };
            },
            {
                // Day of Month
                value = "D";
                getter = func(components : Components, locale : ?Locale) : Text {
                    Nat.toText(components.day);
                };
            },
            {
                // Day of Month with ordinal
                value = "Do";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    l.getOrdinal(components.day);
                };
            },
            {
                // Padded Day of Month
                value = "DD";
                getter = func(components : Components, locale : ?Locale) : Text {
                    TextUtil.toTextPadded(components.day, 2);
                };
            },
            {
                // Day of Year
                value = "DDD";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    Nat.toText(dayOfYear(components, l.firstDayOfYear));
                };
            },
            {
                // Day of Year with ordinal
                value = "DDDo";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    l.getOrdinal(dayOfYear(components, l.firstDayOfYear));
                };
            },
            {
                // Padded Day of Year
                value = "DDDD";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    TextUtil.toTextPadded(dayOfYear(components, l.firstDayOfYear), 3);
                };
            },
            {
                // Day of Week
                value = "d";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let dayOfWeek = dayOfWeekIndex(components);
                    Nat.toText(dayOfWeek);
                };
            },
            {
                // Day of Week with ordinal
                value = "do";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let dayOfWeek = dayOfWeekIndex(components);
                    l.getOrdinal(dayOfWeek);
                };
            },
            {
                // Weekday Min
                value = "dd";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let dayOfWeek = dayOfWeekIndex(components);
                    l.weekdaysMin[dayOfWeek];
                };
            },
            {
                // Weekday Short
                value = "ddd";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let dayOfWeek = dayOfWeekIndex(components);
                    l.weekdaysShort[dayOfWeek];
                };
            },
            {
                // Weekday
                value = "dddd";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let dayOfWeek = dayOfWeekIndex(components);
                    l.weekdays[dayOfWeek];
                };
            },
            {
                // Day of Week (Locale)
                value = "e";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let dayOfWeek = dayOfWeekIndex(components);
                    Nat.toText(dayOfWeek + l.firstDayOfWeek);
                };
            },
            {
                // Day of Week (ISO)
                value = "E";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let dayOfWeek = dayOfWeekIndex(components);
                    Nat.toText(dayOfWeek + 1);
                };
            },
            {
                // Week of Year
                value = "w";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let weekOfYearValue = weekOfYear(components, l.firstDayOfWeek, l.firstDayOfYear);
                    Nat.toText(weekOfYearValue);
                };
            },
            {
                // Week of Year with ordinal
                value = "wo";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let weekOfYearValue = weekOfYear(components, l.firstDayOfWeek, l.firstDayOfYear);
                    l.getOrdinal(weekOfYearValue);
                };
            },
            {
                // Padded Week of Year
                value = "ww";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let weekOfYearValue = weekOfYear(components, l.firstDayOfWeek, l.firstDayOfYear);
                    TextUtil.toTextPaddedSign(weekOfYearValue, 2, false);
                };
            },
            {
                // Week of Year (ISO)
                value = "W";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let weekOfYearValue = weekOfYear(components, 1, 4);
                    Nat.toText(weekOfYearValue);
                };
            },
            {
                // Week of Year (ISO) with ordinal
                value = "Wo";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let weekOfYearValue = weekOfYear(components, 1, 4);
                    l.getOrdinal(weekOfYearValue);
                };
            },
            {
                // Padded Week of Year (ISO)
                value = "WW";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let weekOfYearValue = weekOfYear(components, 1, 4);
                    TextUtil.toTextPaddedSign(weekOfYearValue, 2, false);
                };
            },
            {
                // Year
                value = "Y";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let showPositiveSign = components.year > 9999; // Show + sign for years > 9999
                    TextUtil.toTextPaddedSign(components.year, 1, showPositiveSign);
                };
            },
            {
                // Padded Year without century
                value = "YY";
                getter = func(components : Components, locale : ?Locale) : Text {
                    TextUtil.toTextPaddedSign(components.year % 100, 2, false);
                };
            },
            {
                // Padded Year
                value = "YYYY";
                getter = func(components : Components, locale : ?Locale) : Text {
                    TextUtil.toTextPaddedSign(components.year, 4, false);
                };
            },
            {
                // Max Padded Year with sign
                value = "YYYYYY";
                getter = func(components : Components, locale : ?Locale) : Text {
                    TextUtil.toTextPaddedSign(components.year, 6, true);
                };
            },
            {
                // Era year
                value = "y";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let now = toTime(components);
                    let era = getEra(now, locale);
                    let eraYear = Int.abs(components.year);
                    Nat.toText(eraYear);
                };
            },
            {
                // Era year with ordinal
                value = "yo";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let now = toTime(components);
                    let era = getEra(now, locale);
                    let eraYear = Int.abs(components.year);
                    l.getOrdinal(eraYear);
                };
            },
            {
                // Era year with ordinal
                value = "yy";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let now = toTime(components);
                    let era = getEra(now, locale);
                    let eraYear = Int.abs(components.year);
                    l.getOrdinal(eraYear);
                };
            },
            {
                // Era
                value = "N";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let now = toTime(components);
                    let era = getEra(now, locale);
                    era.abbreviatedName;
                };
            },
            {
                // Era
                value = "NN";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let now = toTime(components);
                    let era = getEra(now, locale);
                    era.abbreviatedName;
                };
            },
            {
                // Era
                value = "NNN";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let now = toTime(components);
                    let era = getEra(now, locale);
                    era.abbreviatedName;
                };
            },
            {
                // Era Full Name
                value = "NNNN";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let now = toTime(components);
                    let era = getEra(now, locale);
                    era.fullName;
                };
            },
            {
                // Era Narrow Name
                value = "NNNNN";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let now = toTime(components);
                    let era = getEra(now, locale);
                    era.narrowName;
                };
            },
            {
                // Padded Week Year without century (Locale)
                value = "gg";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let weekYearValue = weekYear(components, l.firstDayOfYear);
                    TextUtil.toTextPaddedSign(weekYearValue % 100, 2, false);
                };
            },
            {
                // Padded Week Year (Locale)
                value = "gggg";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    let weekYearValue = weekYear(components, l.firstDayOfYear);
                    TextUtil.toTextPaddedSign(weekYearValue, 4, false);
                };
            },
            {
                // Padded Week Year without century (ISO)
                value = "GG";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let weekYearValue = weekYear(components, 4); // ISO week year starts on thursday (4)
                    TextUtil.toTextPaddedSign(weekYearValue % 100, 2, false);
                };
            },
            {
                // Padded Week Year (ISO)
                value = "GGGG";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let weekYearValue = weekYear(components, 4); // ISO week year starts on thursday (4)
                    TextUtil.toTextPaddedSign(weekYearValue, 4, false);
                };
            },
            {
                // Meridiem (UPPERCASE)
                value = "A";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    l.getMeridiem(components.hour, components.minute, true);
                };
            },
            {
                // Meridiem (lowercase)
                value = "a";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let l = requireLocale(locale);
                    l.getMeridiem(components.hour, components.minute, false);
                };
            },
            {
                // Hour (0-23)
                value = "H";
                getter = func(components : Components, locale : ?Locale) : Text {
                    Nat.toText(components.hour);
                };
            },
            {
                // Hour Padded (0-23)
                value = "HH";
                getter = func(components : Components, locale : ?Locale) : Text {
                    TextUtil.toTextPaddedSign(components.hour, 2, false);
                };
            },
            {
                // Hour (12 hour)
                value = "h";
                getter = func(components : Components, locale : ?Locale) : Text {
                    Nat.toText(components.hour % 12 + 1);
                };
            },
            {
                // Hour Padded (12 hour)
                value = "hh";
                getter = func(components : Components, locale : ?Locale) : Text {
                    TextUtil.toTextPaddedSign(components.hour % 12 + 1, 2, false);
                };
            },
            {
                // Hour (1-24)
                value = "k";
                getter = func(components : Components, locale : ?Locale) : Text {
                    Nat.toText(components.hour + 1);
                };
            },
            {
                // Hour Padded (1-24)
                value = "kk";
                getter = func(components : Components, locale : ?Locale) : Text {
                    TextUtil.toTextPaddedSign(components.hour + 1, 2, false);
                };
            },
            {
                // Minute
                value = "m";
                getter = func(components : Components, locale : ?Locale) : Text {
                    Nat.toText(components.minute);
                };
            },
            {
                // Minute Padded
                value = "mm";
                getter = func(components : Components, locale : ?Locale) : Text {
                    TextUtil.toTextPaddedSign(components.minute, 2, false);
                };
            },
            {
                // Second
                value = "s";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let second = components.nanosecond / 1_000_000_000;
                    Nat.toText(second);
                };
            },
            {
                // Second Padded
                value = "ss";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let second = components.nanosecond / 1_000_000_000;
                    TextUtil.toTextPaddedSign(second, 2, false);
                };
            },
            {
                // Fractional Second (1 digit)
                value = "S";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let fractionalSecond = Float.fromInt(components.nanosecond) / 60_000_000_000.0;
                    Float.format(#fix(1), fractionalSecond);
                };
            },
            {
                // Fractional Second (2 digits)
                value = "SS";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let fractionalSecond = Float.fromInt(components.nanosecond) / 60_000_000_000.0;
                    Float.format(#fix(2), fractionalSecond);
                };
            },
            {
                // Fractional Second (3 digits)
                value = "SSS";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let fractionalSecond = Float.fromInt(components.nanosecond) / 60_000_000_000.0;
                    Float.format(#fix(3), fractionalSecond);
                };
            },
            {
                // Fractional Second (4 digits)
                value = "SSSS";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let fractionalSecond = Float.fromInt(components.nanosecond) / 60_000_000_000.0;
                    Float.format(#fix(4), fractionalSecond);
                };
            },
            {
                // Fractional Second (5 digits)
                value = "SSSSS";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let fractionalSecond = Float.fromInt(components.nanosecond) / 60_000_000_000.0;
                    Float.format(#fix(5), fractionalSecond);
                };
            },
            {
                // Fractional Second (6 digits)
                value = "SSSSSS";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let fractionalSecond = Float.fromInt(components.nanosecond) / 60_000_000_000.0;
                    Float.format(#fix(6), fractionalSecond);
                };
            },
            {
                // Fractional Second (7 digits)
                value = "SSSSSSS";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let fractionalSecond = Float.fromInt(components.nanosecond) / 60_000_000_000.0;
                    Float.format(#fix(7), fractionalSecond);
                };
            },
            {
                // Fractional Second (8 digits)
                value = "SSSSSSSS";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let fractionalSecond = Float.fromInt(components.nanosecond) / 60_000_000_000.0;
                    Float.format(#fix(8), fractionalSecond);
                };
            },
            {
                // Time Zone Name
                value = "z";
                getter = func(components : Components, locale : ?Locale) : Text {
                    getTimeZoneInfo(components.timeZone).0;
                };
            },
            {
                // Time Zone Name
                value = "zz";
                getter = func(components : Components, locale : ?Locale) : Text {
                    getTimeZoneInfo(components.timeZone).0;
                };
            },
            {
                // Time Zone Offset
                value = "Z";
                getter = func(components : Components, locale : ?Locale) : Text {
                    getTimeZoneInfo(components.timeZone).1;
                };
            },
            {
                // Time Zone Offset, No Colon
                value = "ZZ";
                getter = func(components : Components, locale : ?Locale) : Text {
                    let offset = getTimeZoneInfo(components.timeZone).1;
                    Text.replace(offset, #char(':'), "");
                };
            },
            {
                // Unix Timestamp
                value = "X";
                getter = func(components : Components, locale : ?Locale) : Text {
                    Int.toText(now / 1_000_000_000);
                };
            },
            {
                // Unix Millisecond Timestamp
                value = "x";
                getter = func(components : Components, locale : ?Locale) : Text {
                    Int.toText(now / 1_000_000);
                };
            },
        ];

        // TODO optimize
        var text = customFormat;
        let charBuffer = Buffer.Buffer<Char>(value);
        for (replacement in replacements) {
            // TODO optimize
            let replacementValue = replacement.getter(components, locale);
            text := Text.replace(text, #text(replacement.value), replacementValue);
        };
        text;
    };

    public func getTimeZoneInfo(components : Components, timeZone : TimeZone) : (Text, Text) {
        switch (timeZone) {
            case (#fixed(#seconds(s))) {
                let offset = TimeZone.getOffsetText(s);
                (offset, offset);
            };
            case (#fixed(#hours(h))) {
                let offset = TimeZone.getOffsetText(h * 60 * 60);
                (offset, offset);
            };
            case (#dynamic(d)) {
                let name = d.getAbbr(components);
                let offset = TimeZone.getOffsetText(d.toOffsetSeconds(components));
                (name, offset);
            };
        };
    };

    public func getEra(time : Time.Time, locale : ?Locale) : Era {
        let l = requireLocale(locale);
        let eraFilter = func(e : Era) : Bool {
            let onOrAfterStart = switch (e.start) {
                case (null) true;
                case (?start) time >= start;
            };
            let beforeEnd = switch (e.end) {
                case (null) true;
                case (?end) time < end;
            };
            return onOrAfterStart and beforeEnd;
        };
        switch (Array.find<Era>(l.eras, eraFilter)) {
            case (?era) era;
            case (null) Debug.trap("No era found for time and locale. Time: " # debug_show (time) # ", Locale: " # locale.id);
        };
    };

    private func requireLocale(locale : ?Locale) : Locale {
        switch (locale) {
            case (?l) l;
            case (null) Debug.trap("Locale is required to output the specified date format");
        };
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
