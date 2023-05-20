import InternalTypes "../internal/Types";
import InternalNumberUtil "../internal/NumberUtil";
import InternalComponents "../internal/Components";
import Time "mo:base/Time";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import NumberUtil "../internal/NumberUtil";
import InternalTextUtil "../internal/TextUtil";
import Debug "mo:base/Debug";

module {

    public type Components = InternalTypes.Components;
    public type DateTime = InternalTypes.DateTime;
    public type DateTimeWithTZ = InternalTypes.DateTimeWithTZ;
    public type TimeZone = InternalTypes.TimeZone;
    public type Duration = InternalTypes.Duration;
    public type TextFormat = InternalTypes.TextFormat;

    public func epoch() : Components {
        {
            year = 1970;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            nanosecond = 0;
        }
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
            Debug.print("components.year: " # debug_show components.year);
            while (currentYear > components.year) {
                totalNanoseconds -= InternalComponents.daysInYear(currentYear) * nanosecondsInADay;
                currentYear -= 1;
            };

            // Month
            let currentIsLeapYear = InternalComponents.isLeapYear(components.year);
            var currentMonth = 12;
            while (currentMonth > components.month) {
                totalNanoseconds -= InternalComponents.daysInMonth(currentMonth, currentIsLeapYear) * nanosecondsInADay;
                currentMonth -= 1;
            };
            let daysInMonthV = InternalComponents.daysInMonth(components.month, currentIsLeapYear);
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
                totalNanoseconds += InternalComponents.daysInYear(currentYear) * nanosecondsInADay;
                currentYear += 1;
            };

            // Month
            let currentIsLeapYear = InternalComponents.isLeapYear(components.year);
            var currentMonth = 1;
            while (currentMonth < components.month) {
                totalNanoseconds += InternalComponents.daysInMonth(currentMonth, currentIsLeapYear) * nanosecondsInADay;
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

    public func fromTime(nanoseconds : Int) : Components {
        addTime(epoch(), nanoseconds);
    };
    
    public func isValid(dateTime : Components) : Bool {
        let leapYear = InternalComponents.isLeapYear(dateTime.year);

        let daysInM = InternalComponents.daysInMonth(dateTime.month, leapYear);

        if (dateTime.day == 0 or dateTime.day > daysInM) {
            return false;
        };

        if (dateTime.hour >= 24) {
            return false;
        };

        if (dateTime.minute >= 60) {
            return false;
        };

        if (dateTime.nanosecond >= 60_000_000_000) {
            return false;
        };

        return true;
    };

    public func getOffsetSeconds(components : Components, timeZone : TimeZone) : Int {
        switch (timeZone) {
            case (#fixed(f)) {
                switch (f) {
                    case (#seconds(s)) s;
                    case (#hoursAndMinutes(h, m)) h * 3600 + m * 60;
                };
            };
            case (#dynamic(d)) {
                d.getOffsetSeconds(components);
            };
        };
    };

    public type FromTextResult = {
        components : Components;
        timeZoneDescriptor : ?Text;
    };


    public func fromTextFormatted(text : Text, format : TextFormat) : ?FromTextResult {
        switch (format) {
            case (#iso8601) {
                let iter = Text.toIter(text);
                let ?year = InternalTextUtil.parseNat(iter, 4) else return null;

                if (iter.next() != ?'-') return null;

                let ?month = InternalTextUtil.parseNat(iter, 2) else return null;

                if (iter.next() != ?'-') return null;

                let ?day = InternalTextUtil.parseNat(iter, 2) else return null;

                if (iter.next() != ?'T') return null;

                let ?hour = InternalTextUtil.parseNat(iter, 2) else return null;

                if (iter.next() != ?':') return null;

                let ?minute = InternalTextUtil.parseNat(iter, 2) else return null;

                if (iter.next() != ?':') return null;

                let ?seconds = InternalTextUtil.parseNat(iter, 2) else return null;

                let (milliseconds : Nat, timezone : ?Text) = switch (iter.next()) {
                    case (?'.') {
                        let ?ms = InternalTextUtil.parseNat(iter, 3) else return null;
                        let tz = InternalTextUtil.readTillEnd(iter, null);
                        (ms, tz);
                    };
                    case (?tzChar) {
                        let tz = InternalTextUtil.readTillEnd(iter, ?tzChar);
                        (0, tz);
                    };
                    case (null)(0, null);
                };
                let components = {
                    year = year;
                    month = month;
                    day = day;
                    hour = hour;
                    minute = minute;
                    nanosecond = (seconds * 1_000_000_000) + (milliseconds * 1_000_000);
                };
                return ?{
                    components = components;
                    timeZoneDescriptor = timezone;
                };
            };
        };
    };

    
    public func addTime(startDateTime : Components, nanoseconds : Time.Time) : Components {
        if (nanoseconds < 0) {
            subtractNanoseconds(startDateTime, Int.abs(nanoseconds));
        } else if (nanoseconds > 0) {
            addNanoseconds(startDateTime, Int.abs(nanoseconds));
        } else {
            return startDateTime;
        };
    };

    private func subtractNanoseconds(startDateTime : Components, nanoseconds : Nat) : Components {
        let nanosecondsInAMinute = 60 * 1000000000;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;

        var year : Int = startDateTime.year - 1;
        var remainingNanoseconds : Nat = nanoseconds;

        // Remove years until cant remove any more
        label l loop {
            let daysInYearV = InternalComponents.daysInYear(year);
            let yearInNanoseconds = daysInYearV * nanosecondsInADay;
            if (remainingNanoseconds <= yearInNanoseconds) {
                break l;
            };
            remainingNanoseconds -= yearInNanoseconds;
            year -= 1;
        };
        var month : Nat = NumberUtil.wrapInt(startDateTime.month - 1, 1, 12);
        let currentIsLeapYear = InternalComponents.isLeapYear(year);
        label l loop {
            let daysInMonthV = InternalComponents.daysInMonth(month, currentIsLeapYear);
            let monthInNanoseconds : Nat = daysInMonthV * nanosecondsInADay;
            if (remainingNanoseconds <= monthInNanoseconds) {
                break l;
            };
            remainingNanoseconds -= monthInNanoseconds;
            month := NumberUtil.wrapInt(month - 1, 1, 12);
        };

        let daysInMonthV = InternalComponents.daysInMonth(month, currentIsLeapYear);
        let days : Nat = (remainingNanoseconds / nanosecondsInADay);
        remainingNanoseconds -= days * nanosecondsInADay;
        let day : Nat = if (remainingNanoseconds > 0) {
            daysInMonthV - days;
        } else {
            daysInMonthV - days + 1; // If exactly on the day, dont go to 'next' day
        };

        let hour = remainingNanoseconds / nanosecondsInAnHour;
        remainingNanoseconds %= nanosecondsInAnHour;

        let minute = remainingNanoseconds / nanosecondsInAMinute;
        remainingNanoseconds %= nanosecondsInAMinute;

        let nanosecond = remainingNanoseconds;

        return {
            year = year;
            month = month;
            day = day;
            hour = if (hour > 0) 23 - hour else hour;
            minute = if (minute > 0) 60 - minute else minute;
            nanosecond = nanosecond;
        };
    };

    private func addNanoseconds(startDateTime : Components, nanoseconds : Nat) : Components {
        let nanosecondsInAMinute = 60 * 1000000000;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;

        var year : Int = startDateTime.year;
        var remainingNanoseconds : Nat = nanoseconds;

        // Remove years until cant remove any more
        label l loop {
            let daysInYearV = InternalComponents.daysInYear(year);
            let yearInNanoseconds = daysInYearV * nanosecondsInADay;
            if (remainingNanoseconds <= yearInNanoseconds) {
                if (remainingNanoseconds == yearInNanoseconds) {
                    // If exactly 1 year left, then we are on the first day of the next year
                    year += 1;
                    remainingNanoseconds := 0;
                };
                break l;
            };
            remainingNanoseconds -= yearInNanoseconds;
            year += 1;
        };

        // Remove months until cant remove any more
        var month : Nat = startDateTime.month;
        let currentIsLeapYear = InternalComponents.isLeapYear(year);
        label l loop {
            let daysInMonthV = InternalComponents.daysInMonth(month, currentIsLeapYear);
            let monthInNanoseconds : Nat = daysInMonthV * nanosecondsInADay;
            if (remainingNanoseconds <= monthInNanoseconds) {
                if (remainingNanoseconds == monthInNanoseconds) {
                    // If exactly 1 month left, then we are on the first day of the next month
                    month += 1;
                    remainingNanoseconds := 0;
                };
                break l;
            };
            remainingNanoseconds -= monthInNanoseconds;
            month += 1;
        };

        let days = (remainingNanoseconds / nanosecondsInADay);
        remainingNanoseconds -= days * nanosecondsInADay;
        let day : Nat = days + 1;

        let hour = remainingNanoseconds / nanosecondsInAnHour;
        remainingNanoseconds %= nanosecondsInAnHour;

        let minute = remainingNanoseconds / nanosecondsInAMinute;
        remainingNanoseconds %= nanosecondsInAMinute;

        let nanosecond = remainingNanoseconds;

        return {
            year = year;
            month = month;
            day = day;
            hour = hour;
            minute = minute;
            nanosecond = nanosecond;
        };
    };
}