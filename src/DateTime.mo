import Time "mo:base/Time";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Prelude "mo:base/Prelude";
import Order "mo:base/Order";

module D {

    public type Duration = {
        #nanoseconds : Int;
        #milliseconds : Int;
        #seconds : Int;
        #hours : Int;
        #days : Int;
        #weeks : Int;
        #months : Int;
        #years : Int;
    };

    public type Components = {
        year : Int;
        month : Nat;
        day : Nat;
        hour : Nat;
        minute : Nat;
        nanosecond : Nat;
    };

    public type TextFormat = {
        #iso8601;
    };

    public class DateTime(nanoseconds : ?Int) {
        let time = switch (nanoseconds) {
            case (?nanoseconds) nanoseconds;
            case (_) Time.now();
        };
        var componentsCache : ?Components = null;

        public func equal(other : DateTime) : Bool {
            return time == other.toTime();
        };

        public func add(duration : Duration) : DateTime {
            switch (duration) {
                case (#nanoseconds(nanoseconds)) {
                    DateTime(?(time + nanoseconds));
                };
                case (#milliseconds(milliseconds)) {
                    DateTime(?(time + milliseconds * 1_000_000));
                };
                case (#seconds(seconds)) {
                    DateTime(?(time + seconds * 1_000_000_000));
                };
                case (#hours(hours)) {
                    DateTime(?(time + hours * 60 * 60 * 1_000_000_000));
                };
                case (#days(days)) {
                    DateTime(?(time + days * 24 * 60 * 60 * 1_000_000_000));
                };
                case (#weeks(weeks)) {
                    DateTime(?(time + weeks * 7 * 24 * 60 * 60 * 1_000_000_000));
                };
                case (#months(months)) {
                    let components = toComponents();
                    let newMonth : Int = components.month + months;
                    let newYear : Int = components.year + newMonth / 12;
                    let newMonthInYear : Nat = Int.abs(newMonth % 12);
                    let newDay = components.day;
                    let newHour = components.hour;
                    let newMinute = components.minute;
                    let newNanosecond = components.nanosecond;
                    let newComponents : Components = {
                        year = newYear;
                        month = newMonthInYear;
                        day = newDay;
                        hour = newHour;
                        minute = newMinute;
                        nanosecond = newNanosecond;
                    };
                    let ?newDateTime = fromComponents(newComponents) else Prelude.unreachable();
                    newDateTime;
                };
                case (#years(years)) {
                    let components : Components = toComponents();
                    let newYear : Int = components.year + years;
                    let newComponents = {
                        year = newYear;
                        month = components.month;
                        day = components.day;
                        hour = components.hour;
                        minute = components.minute;
                        nanosecond = components.nanosecond;
                    };
                    let ?newDateTime = fromComponents(newComponents) else Prelude.unreachable();
                    newDateTime;
                };
            };
        };

        // TODO
        // public func getIsoWeek() : Nat {
        //     let components = toComponents();
        //     let year = components.year;
        //     let month = components.month;
        //     let day = components.day;
        //     let a : Nat = (14 - month) / 12; // Calculate the "a" value used in the ISO week calculation
        //     let intY : Int = year + 4800 - a; // Calculate the "intY" value used in the ISO week calculation
        //     let y : Nat = if (intY < 0) {
        //         // Check if the year is negative
        //         Debug.trap("Unable to calculate ISO week for dates before 0001-01-01") // If the year is negative, trap with an error message
        //     } else {
        //         Int.abs(intY); // If the year is not negative, take the absolute value
        //     };
        //     let m : Nat = month + 12 * a - 3; // Calculate the "m" value used in the ISO week calculation
        //     let daysIn400Years : Nat = 146097; // Define the number of days in a 400-year cycle
        //     let daysIn100Years : Nat = 36524; // Define the number of days in a 100-year cycle
        //     let daysIn4Years : Nat = 1461; // Define the number of days in a 4-year cycle
        //     // Calculate the Julian day number from the Gregorian calendar. Simplifies the calculations to just have day units
        //     let jdn : Nat = (1461 * (y + 4800 + (m - 14) / 12)) / 4 // Calculate the Julian day number from the Gregorian calendar
        //     + (367 * (m - 2 - 12 * ((m - 14) / 12))) / 12 - (3 * ((y + 4900 + (m - 14) / 12) / 100)) / 4 + day - 32075;
        //     let d4 : Nat = (jdn + 31741 - (jdn % 7)) // Calculate the number of days since the start of the 4-year cycle that contains the current date
        //     % daysIn400Years % daysIn100Years % daysIn4Years; // Take the remainder when divided by the number of days in a 400-year cycle, then by the number of days in a 100-year cycle, then by the number of days in a 4-year cycle
        //     let l : Nat = d4 / 1460; // Calculate the number of complete 4-year cycles since the start of the 4-year cycle that contains the current date
        //     let d1 : Nat = ((d4 - l) % 365) + l; // Calculate the number of days since the start of the year that contains the current date
        //     let week : Nat = d1 / 7 + 1; // Calculate the ISO week number
        //     week;
        // };

        // public func getWeekOfYear() : Nat {
        //     let components = toComponents();
        //     let ?firstDayOfYear = DateTime.fromComponents({
        //         year = components.year;
        //         month = 1;
        //         day = 1;
        //     }) else Prelude.unreachable();
        //     let daysSinceMonday = (firstDayOfYear.toComponents().weekday - 1 + (toComponents().day - 1)) % 7;
        //     let weekOfYear = (toComponents().day + daysSinceMonday - 1) / 7 + 1;
        //     return weekOfYear;
        // };

        // public func getWeekOfMonth() : Nat {
        //     let components = toComponents();
        //     let ?firstDayOfMonth = DateTime.fromComponents({
        //         year = components.year;
        //         month = components.month;
        //         day = 1;
        //     }) else Prelude.unreachable();

        //     let let daysSinceMonday = (firstDayOfMonth.toComponents().weekday - 1 + (toComponents().day - 1)) % 7;
        //     let weekOfMonth = (toComponents().day + daysSinceMonday - 1) / 7 + 1;
        //     return weekOfMonth;
        // };

        public func nanosecondsSince(other : DateTime) : Int {
            let otherTime = other.toTime();
            return time - otherTime;
        };

        public func toTime() : Time.Time {
            return time;
        };

        public func toText() : Text {
            return toTextFormatted(#iso8601);
        };

        public func toTextFormatted(format : TextFormat) : Text {
            let dateTime : Components = toComponents();
            switch (format) {
                case (#iso8601) {
                    let seconds = dateTime.nanosecond / 1_000_000_000;
                    let milliseconds : Nat = (dateTime.nanosecond - (seconds * 1_000_000_000)) / 1_000_000;
                    toTextPadded(dateTime.year, 4)
                    # "-" #
                    toTextPadded(dateTime.month, 2)
                    # "-" #
                    toTextPadded(dateTime.day, 2)
                    # "T" #
                    toTextPadded(dateTime.hour, 2)
                    # ":" #
                    toTextPadded(dateTime.minute, 2)
                    # ":" #
                    toTextPadded(seconds, 2)
                    # "." #
                    toTextPadded(milliseconds, 3)
                    # "Z";
                };
            };
        };

        public func toComponents() : Components {
            switch (componentsCache) {
                case (?components) components;
                case (null) {
                    let epoch = {
                        year = 1970;
                        month = 1;
                        day = 1;
                        hour = 0;
                        minute = 0;
                        nanosecond = 0;
                    };
                    let components = addTime(epoch, time);
                    componentsCache := ?components;
                    components;
                };
            };
        };

        public func isLeapYear() : Bool {
            let year = toComponents().year;
            D.isLeapYear(year);
        };

        public func compare(other : DateTime) : Order.Order {
            Int.compare(time, other.toTime());
        };
    };

    public func equal(a : DateTime, b : DateTime) : Bool {
        return a.equal(b);
    };

    public func daysInMonth(month : Nat, isLeapYear : Bool) : Nat {
        switch (month) {
            case (2) if (isLeapYear) 29 else 28;
            case (4 or 6 or 9 or 11) 30;
            case (1 or 3 or 5 or 7 or 8 or 10 or 12) 31;
            case _ Debug.trap("Invalid month: " # Nat.toText(month));
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

    public func now() : DateTime {
        return fromTime(Time.now());
    };

    public func fromTime(nanoseconds : Time.Time) : DateTime {
        DateTime(?nanoseconds);
    };

    public func fromComponents(components : Components) : ?DateTime {
        let totalNanoseconds = timeFromComponents(components);
        return ?DateTime(totalNanoseconds);
    };

    public func timeFromComponents(components : Components) : ?Time.Time {
        if (not isValid(components)) {
            return null;
        };
        let nanosecondsInAMinute = 60 * 1000000000;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;
        var totalNanoseconds : Int = 0;

        if (components.year < 1970) {
            // For dates before the epoch, need to do the inverse
            var currentYear = 1969;
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

    public func toText(dateTime : DateTime) : Text {
        dateTime.toText();
    };

    public func toTextFormatted(dateTime : DateTime, format : TextFormat) : Text {
        dateTime.toTextFormatted(format);
    };

    public func fromTextFormatted(text : Text, format : TextFormat) : ?DateTime {
        switch (format) {
            case (#iso8601) {
                let iter = Text.toIter(text);
                let ?year = parseNat(iter, 4) else return null;

                if (iter.next() != ?'-') return null;

                let ?month = parseNat(iter, 2) else return null;

                if (iter.next() != ?'-') return null;

                let ?day = parseNat(iter, 2) else return null;

                if (iter.next() != ?'T') return null;

                let ?hour = parseNat(iter, 2) else return null;

                if (iter.next() != ?':') return null;

                let ?minute = parseNat(iter, 2) else return null;

                if (iter.next() != ?':') return null;

                let ?seconds = parseNat(iter, 2) else return null;

                let (milliseconds : Nat, timezone : ?Text) = switch (iter.next()) {
                    case (?'.') {
                        let ?ms = parseNat(iter, 3) else return null;
                        let tz = readTillEnd(iter, null);
                        (ms, tz);
                    };
                    case (?tzChar) {
                        let tz = readTillEnd(iter, ?tzChar);
                        (0, tz);
                    };
                    case (null)(0, null);
                };
                // TODO toupper
                switch (timezone) {
                    case (?"Z" or null) {
                        // No change
                    };
                    case (?tz) {
                        // TODO timezone
                        Prelude.nyi();
                    };
                };

                return fromComponents({
                    year = year;
                    month = month;
                    day = day;
                    hour = hour;
                    minute = minute;
                    nanosecond = (seconds * 1_000_000_000) + (milliseconds * 1_000_000);
                });
            };
        };
    };

    public func isValid(dateTime : Components) : Bool {
        let leapYear = isLeapYear(dateTime.year);

        let daysInM = daysInMonth(dateTime.month, leapYear);

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
            let daysInYearV = daysInYear(year);
            let yearInNanoseconds = daysInYearV * nanosecondsInADay;
            if (remainingNanoseconds <= yearInNanoseconds) {
                break l;
            };
            remainingNanoseconds -= yearInNanoseconds;
            year -= 1;
        };
        var month : Nat = wrapInt(startDateTime.month - 1, 1, 12);
        let currentIsLeapYear = isLeapYear(year);
        label l loop {
            let daysInMonthV = daysInMonth(month, currentIsLeapYear);
            let monthInNanoseconds : Nat = daysInMonthV * nanosecondsInADay;
            if (remainingNanoseconds <= monthInNanoseconds) {
                break l;
            };
            remainingNanoseconds -= monthInNanoseconds;
            month := wrapInt(month - 1, 1, 12);
        };

        let daysInMonthV = daysInMonth(month, currentIsLeapYear);
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
            let daysInYearV = daysInYear(year);
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
        let currentIsLeapYear = isLeapYear(year);
        label l loop {
            let daysInMonthV = daysInMonth(month, currentIsLeapYear);
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

    private func wrapInt(value : Int, min : Nat, max : Nat) : Nat {
        if (value < min) {
            let difference : Nat = Int.abs(min - value);
            return max - (difference - 1);
        } else if (value > max) {
            let difference : Nat = Int.abs(value - max);
            return min + (difference + 1);
        } else {
            return Int.abs(value);
        };
    };

    private func readTillEnd(iter : Iter.Iter<Char>, startChar : ?Char) : ?Text {
        var text : Text = switch (startChar) {
            case (null) "";
            case (?char) Text.fromChar(char);
        };
        label l loop {
            let ?char = iter.next() else break l;
            text #= Text.fromChar(char);
        };
        return if (text == "") null else ?text;
    };

    private func parseNat(iter : Iter.Iter<Char>, length : Nat) : ?Nat {
        var value : Text = "";
        for (a in Iter.range(0, length - 1)) {
            let ?char = iter.next() else return null;
            value #= Text.fromChar(char);
        };
        return Nat.fromText(value);
    };

    private func toTextPadded(value : Int, length : Nat) : Text {
        let isNegative = value < 0;
        let natValue = Int.abs(value);
        var text = Nat.toText(natValue);
        if (text.size() < length) {
            // Pad with leading zeros
            for (a in Iter.range(0, length - text.size() - 1)) {
                text := "0" # text;
            };
        };
        if (isNegative) {
            "-" # text;
        } else {
            text;
        };
    };
};
