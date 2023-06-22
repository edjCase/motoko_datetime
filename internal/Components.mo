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

module Module {

    type Components = InternalTypes.Components;
    type DateComponents = InternalTypes.DateComponents;
    type DayOfWeek = InternalTypes.DayOfWeek;
    type Duration = InternalTypes.Duration;
    type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor;
    type TimeZone = InternalTypes.TimeZone;
    type Locale = InternalTypes.Locale;

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

    public func toTime(components : Components) : ?Time.Time {
        if (not isValid(components)) {
            return null;
        };
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
        ?totalNanoseconds;
    };

    public func toTextFormatted(
        components : Components,
        timeZone : TimeZone,
        locale : Locale,
        format : InternalTypes.TextFormat,
    ) : ?Text {
        if (not isValid(components)) {
            return null;
        };
        let customFormat : Text = switch (format) {
            case (#iso8601) "%Y-%m-%dT%H:%M:%S.%N%z";
            case (#custom(customFormat)) customFormat;
        };
        // TODO optimize
        var text = customFormat;
        text := Text.replace(text, #text("YYYY"), TextUtil.toTextPaddedSign(components.year, 4, false));
        text := Text.replace(text, #text("YY"), TextUtil.toTextPaddedSign(components.year % 100, 2, false));
        text := Text.replace(text, #text("Y"), TextUtil.toTextPaddedSign(components.year, 1, false));
        let quarter = components.month / 3 + 1;
        text := Text.replace(text, #text("Q"), TextUtil.toTextPadded(quarter, 1));
        let fullMonth = locale.months[components.month - 1];
        text := Text.replace(text, #text("MMMM"), fullMonth);
        let shortMonth = locale.monthsShort[components.month - 1];
        text := Text.replace(text, #text("MMM"), shortMonth);
        text := Text.replace(text, #text("MM"), TextUtil.toTextPadded(components.month, 2));
        text := Text.replace(text, #text("M"), TextUtil.toTextPadded(components.month, 1));
        let ?startOfYear = toTime({
            year = components.year;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            second = 0;
            nanosecond = 0;
        }) else Prelude.unreachable();
        let ?now = toTime(components) else Prelude.unreachable();

        let dayOfYear = Int.abs(now - startOfYear) / 24 / 60 / 60 / 1_000_000_000;
        text := Text.replace(text, #text("DDDD"), TextUtil.toTextPadded(dayOfYear, 3));
        text := Text.replace(text, #text("DDD"), TextUtil.toTextPadded(dayOfYear, 1));
        text := Text.replace(text, #text("DD"), TextUtil.toTextPadded(components.day, 2));
        text := Text.replace(text, #text("D"), TextUtil.toTextPadded(components.day, 1));
        text := Text.replace(text, #text("Do"), dayWithOrdinal);
        text := Text.replace(text, #text("X"), unixTimestamp);
        text := Text.replace(text, #text("x"), unixMsTimestamp);

        text := Text.replace(text, #text("gggg"), fullWeekYear);
        text := Text.replace(text, #text("gg"), shortWeekYear);
        text := Text.replace(text, #text("ww"), paddedWeekOfYear);
        text := Text.replace(text, #text("w"), weekOfYear);
        text := Text.replace(text, #text("e"), dayOfWeekIndex);
        text := Text.replace(text, #text("dddd"), fullDayOfWeekName);
        text := Text.replace(text, #text("ddd"), shortDayOfWeekName);
        text := Text.replace(text, #text("GGGG"), fullIsoWeekYear);
        text := Text.replace(text, #text("GG"), shortIsoWeekYear);
        text := Text.replace(text, #text("WW"), paddedIsoWeekOfYear);
        text := Text.replace(text, #text("W"), isoWeekOfYear);
        text := Text.replace(text, #text("E"), isoDayOfWeek);

        ?text;
        // var output = "";
        // var iter = Text.toIter(customFormat);
        // label l loop {
        //     switch (getNext(components, iter, timeZone)) {
        //         case (null) break l;
        //         case (?(next, newIter)) {
        //             output #= next;
        //             iter := newIter;
        //         };
        //     };
        // };
        // output;

    };

    private func getNext(components : Components, format : Iter.Iter<Char>, timeZone : TimeZone) : ?(Text, Iter.Iter<Char>) {
        let ?next = format.next() else return null;
        if (next != '%') {
            return ?(Text.fromChar(next), format);
        };
        let ?next2 = format.next() else return null;
        switch (mapValue(next2, components, timeZone)) {
            case (null) null;
            case (?v) {
                ?(v, format);
            };
        };
    };

    private func mapValue(formatChar : Char, components : Components, timeZone : TimeZone) : ?Text {
        do ? {
            // Derived from https://man7.org/linux/man-pages/man1/date.1.html
            switch (formatChar) {
                case ('a') {
                    // Weekday as region’s abbreviated name (Sun)
                    Prelude.nyi();
                };
                case ('A') {
                    // Weekday as region’s full name (Sunday)
                    Prelude.nyi();
                };
                case ('b') {
                    // Month as region’s abbreviated name (Jan)
                    Prelude.nyi();
                };
                case ('B') {
                    // Month as region’s full name (January)
                    Prelude.nyi();
                };
                case ('c') {
                    // The preferred date and time representation for the current region
                    Prelude.nyi();
                };
                case ('C') {
                    // The century number (year/100) as a 2-digit integer (20)
                    Prelude.nyi();
                };
                case ('d') {
                    // Day of the month as a decimal number (01-31)
                    TextUtil.toTextPadded(components.day, 2);
                };
                case ('D') {
                    // Equivalent to %m/%d/%y
                    let month = TextUtil.toTextPadded(components.month, 2);
                    let day = TextUtil.toTextPadded(components.day, 2);
                    let year = TextUtil.toTextPaddedSign(components.year % 100, 2, false);
                    month # "/" # day # "/" # year;
                };
                case ('e') {
                    // Day of the month as a decimal number (1-31); single digits are preceded by a blank
                    TextUtil.toTextPaddedSymb(components.day, 2, " ");
                };
                // TODO?
                // %f    026490000    The fractional seconds (in nanoseconds) since last whole second. 5
                // %.f    .026490    Similar to .%f but left-aligned. These all consume the leading dot. 5
                // %.3f    .026    Similar to .%f but left-aligned but fixed to a length of 3. 5
                // %.6f    .026490    Similar to .%f but left-aligned but fixed to a length of 6. 5
                // %.9f    .026490000    Similar to .%f but left-aligned but fixed to a length of 9. 5
                // %3f    026    Similar to %.3f but without the leading dot. 5
                // %6f    026490    Similar to %.6f but without the leading dot. 5
                // %9f    026490000    Similar to %.9f but without the leading dot. 5
                case ('F') {
                    // Equivalent to %Y-%m-%d (the ISO 8601 date format)
                    let year = TextUtil.toTextPaddedSign(components.year, 4, false);
                    let month = TextUtil.toTextPadded(components.month, 2);
                    let day = TextUtil.toTextPadded(components.day, 2);
                    year # "-" # month # "-" # day;
                };
                case ('g') {
                    // Like %G, but without the century
                    Prelude.nyi();
                };
                case ('G') {
                    // The ISO 8601 week-based year with century as a decimal number.
                    // The 4-digit year corresponding to the ISO week number (see %V). This has
                    // the same format and value as %Y, except that if the ISO week number belongs
                    // to the previous or next year, that year is used instead.
                    Prelude.nyi();
                };
                case ('h') {
                    // Equivalent to %b
                    Prelude.nyi();
                };
                case ('H') {
                    // The hour as a decimal number using a 24-hour clock (range 00 to 23)
                    TextUtil.toTextPadded(components.hour, 2);
                };
                case ('I') {
                    // The hour as a decimal number using a 12-hour clock (range 01 to 12)
                    TextUtil.toTextPadded((components.hour % 12) + 1, 2);
                };
                case ('j') {
                    // The day of the year as a decimal number (range 001 to 366)
                    Prelude.nyi();
                };
                case ('k') {
                    // The hour (24-hour clock) as a decimal number (range 0 to 23); single digits
                    // are preceded by a blank
                    TextUtil.toTextPaddedSymb(components.hour, 2, " ");
                };
                case ('l') {
                    // The hour (12-hour clock) as a decimal number (range 1 to 12); single digits
                    // are preceded by a blank
                    TextUtil.toTextPaddedSymb((components.hour % 12) + 1, 2, " ");
                };
                case ('m') {
                    // The month as a decimal number (range 01 to 12)
                    TextUtil.toTextPadded(components.month, 2);
                };
                case ('M') {
                    // The minute as a decimal number (range 00 to 59)
                    TextUtil.toTextPadded(components.minute, 2);
                };
                case ('n') {
                    // A newline character (\n)
                    "\n";
                };
                case ('N') {
                    // The nanosecond as a decimal number (range 000000000 to 999999999). The
                    // three least-significant digits are equivalent to %3f, %6f, and %9f.
                    TextUtil.toTextPadded(components.nanosecond % 1_000_000_000, 9);
                };
                case ('p') {
                    // Either "AM" or "PM" according to the given time value, or the corresponding
                    // strings for the current region. Noon is treated as "PM" and midnight as "AM".
                    Prelude.nyi();
                };
                case ('P') {
                    // Like %p but in lowercase: "am" or "pm" or a corresponding string for the current region.
                    Prelude.nyi();
                };
                case ('q') {
                    // The quarter as a decimal number (range 1 to 4)
                    if (components.month < 4) {
                        "1";
                    } else if (components.month < 7) {
                        "2";
                    } else if (components.month < 10) {
                        "3";
                    } else {
                        "4";
                    };
                };
                case ('r') {
                    // The time in a.m. or p.m. notation. In the POSIX region this is equivalent to %I:%M:%S %p.
                    Prelude.nyi();
                };
                case ('R') {
                    // The time in 24-hour notation (%H:%M)
                    let hour = TextUtil.toTextPadded(components.hour, 2);
                    let minute = TextUtil.toTextPadded(components.minute, 2);
                    hour # ":" # minute;
                };
                case ('s') {
                    // The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
                    // let seconds = Components.toTime(components) / 1_000_000_000;
                    // TextUtil.toTextPadded(seconds, 2);
                    Prelude.nyi();
                };
                case ('S') {
                    // The second as a decimal number (range 00 to 60).  (The range is up to 60 to allow for occasional leap seconds.)
                    let seconds = components.nanosecond / 1_000_000_000;
                    TextUtil.toTextPadded(seconds, 2);
                };
                case ('t') {
                    // A tab character (\t)
                    "\t";
                };
                case ('T') {
                    // The time in 24-hour notation (%H:%M:%S)
                    // let hour = TextUtil.toTextPadded(components.hour, 2);
                    // let minute = TextUtil.toTextPadded(components.minute, 2);
                    // let second = TextUtil.toTextPadded(components.second, 2);
                    // hour # ":" # minute # ":" # second;
                    Prelude.nyi();
                };
                case ('u') {
                    // The day of the week as a decimal, range 1 to 7, Monday being 1. See also %w.
                    Prelude.nyi();
                };
                case ('U') {
                    // The week number of the current year as a decimal number, range 00 to 53,
                    // starting with the first Sunday as the first day of week 01. See also %V and %W.
                    Prelude.nyi();
                };
                case ('v') {
                    // TODO this is not from strftime, but https://docs.rs/chrono/latest/chrono/format/strftime/index.html
                    //     Day-month-year format. Same as %e-%b-%Y.
                    Prelude.nyi();
                };
                case ('V') {
                    // The ISO 8601 week number (see NOTES) of the current year as a decimal number,
                    // range 01 to 53, where week 1 is the first week that has at least 4 days in the
                    // new year. See also %U and %W.
                    Prelude.nyi();
                };
                case ('w') {
                    // The day of the week as a decimal, range 0 to 6, Sunday being 0. See also %u
                    switch (dayOfWeek(components)) {
                        case (#sunday) "0";
                        case (#monday) "1";
                        case (#tuesday) "2";
                        case (#wednesday) "3";
                        case (#thursday) "4";
                        case (#friday) "5";
                        case (#saturday) "6";
                    };
                };
                case ('W') {
                    // The week number of the current year as a decimal number, range 00 to 53,
                    // starting with the first Monday as the first day of week 01.
                    Prelude.nyi();
                };
                case ('x') {
                    // The preferred date representation for the current region without the time.
                    // let year = TextUtil.toTextPaddedSign(components.year, 4, false);
                    // let month = TextUtil.toTextPadded(components.month, 2);
                    // let day = TextUtil.toTextPadded(components.day, 2);
                    // year # "-" # month # "-" # day;
                    Prelude.nyi();
                };
                case ('X') {
                    // The preferred time representation for the current region without the date.
                    // let hour = TextUtil.toTextPadded(components.hour, 2);
                    // let minute = TextUtil.toTextPadded(components.minute, 2);
                    // let second = TextUtil.toTextPadded(components.second, 2);
                    // hour # ":" # minute # ":" # second;
                    Prelude.nyi();
                };
                case ('y') {
                    // The year as a decimal number without a century (range 00 to 99).
                    TextUtil.toTextPaddedSign(components.year % 100, 2, false);
                };
                case ('Y') {
                    // The year as a decimal number including the century
                    TextUtil.toTextPaddedSign(components.year, 4, false);
                };
                case ('z') {
                    // The +hhmm or -hhmm numeric timezone (that is, the hour and minute offset from UTC).
                    // (SU) For example, "-0430" means 4 hours 30 minutes behind UTC (west of Greenwich).
                    // If tm_isdst is zero, the standard time offset is used. If tm_isdst is positive,
                    // the daylight saving time offset is used. If tm_isdst is negative, no timezone
                    // conversion is performed.

                    let offsetSeconds = InternalTimeZone.toOffsetSeconds(timeZone, components);
                    let h = offsetSeconds / 3600;
                    let m = (Int.abs(offsetSeconds) % 3600) / 60;
                    let hours = TextUtil.toTextPaddedSign(h, 2, true);
                    let minutes = TextUtil.toTextPaddedSign(m, 2, false);

                    hours # ":" # minutes;
                };
                case ('Z') {
                    // The alphabetic time zone abbreviation (e.g., EDT)
                    Prelude.nyi();
                };
                // TODO?
                // %z    +0930    Offset from the local time to UTC (with UTC being +0000).
                // %:z    +09:30    Same as %z but with a colon.
                // %::z    +09:30:00    Offset from the local time to UTC with seconds.
                // %:::z    +09    Offset from the local time to UTC without minutes.
                // %#z    +09    Parsing only: Same as %z but allows minutes to be missing or present.
                case ('+') {
                    // The date and time in 2001-07-08T00:34:60.026490+09:30 format.
                    // let year = TextUtil.toTextPaddedSign(components.year, 4, false);
                    // let month = TextUtil.toTextPadded(components.month, 2);
                    // let day = TextUtil.toTextPadded(components.day, 2);
                    // let hour = TextUtil.toTextPadded(components.hour, 2);
                    // let minute = TextUtil.toTextPadded(components.minute, 2);
                    // let second = TextUtil.toTextPadded(components.second, 2);
                    // year # "-" # month # "-" # day # " " # hour # ":" # minute # ":" # second;
                    Prelude.nyi();
                };
                case ('%') {
                    // A literal '%' character.
                    "%";
                };
                // TODO?
                // %-?    Suppresses any padding including spaces and zeroes. (e.g. %j = 012, %-j = 12)
                // %_?    Uses spaces as a padding. (e.g. %j = 012, %_j =  12)
                // %0?    Uses zeroes as a padding. (e.g. %e =  9, %0e = 09)
                case (_) {
                    return null;
                };
            };
        };
    };

    // array with leading number of days values
    private let t = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];

    public func dayOfWeek(components : DateComponents) : DayOfWeek {
        let d = components.day;
        let m = components.month;
        let y = if (m < 3) components.year else components.year - 1; // if month is less than 3 reduce year by 1

        let intValue = (y + y / 4 - y / 100 + y / 400 + t[m - 1] + d) % 7;
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

};
