import Time "mo:base/Time";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Prelude "mo:base/Prelude";

module {
    public type Duration = {
        #nanoseconds : Int;
        // #milliseconds : Int;
        // #seconds : Int;
        // #hours : Int;
        // #days : Int;
        // #weeks : Int;
        // #months : Int;
        // #years : Int;
    };

    public type DateTime = {
        year : Nat;
        month : Nat;
        day : Nat;
        hour : Nat;
        minute : Nat;
        nanosecond : Nat;
    };

    public type TextFormat = {
        #iso8601;
    };

    public func now() : Time.Time {
        return Time.now();
    };

    public func isValid(dateTime : DateTime) : Bool {
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

        if (dateTime.nanosecond >= 1000000000) {
            return false;
        };

        return true;
    };

    public func daysInMonth(month : Nat, isLeapYear : Bool) : Nat {
        switch (month) {
            case (2) if (isLeapYear) 29 else 28;
            case (4 or 6 or 9 or 11) 30;
            case (1 or 3 or 5 or 7 or 8 or 10 or 12) 31;
            case _ Debug.trap("Invalid month: " # Nat.toText(month));
        };
    };

    public func daysInYear(year : Nat) : Nat {
        let leapYear = isLeapYear(year);
        return if (leapYear) 366 else 365;
    };

    public func isLeapYear(year : Nat) : Bool {
        // Leap years are every 4 years, except for every 100 years, except for every 400 years.
        return (year % 4 == 0) and (
            (year % 100 != 0) or (year % 400 == 0)
        );
    };

    // public func add(dateTime : DateTime, duration : Duration) : DateTime {
    //     switch (duration) {
    //         case (#nanoseconds(nanoseconds)) {
    //             let seconds = dateTime.second + nanoseconds / 1000000000;
    //             let nanosecond = nanoseconds % 1000000000;
    //             let minutes = dateTime.minute + seconds / 60;
    //             let second = seconds % 60;
    //             let hours = dateTime.hour + minutes / 60;
    //             let minute = minutes % 60;
    //             let day = dateTime.day + hours / 24;
    //             let hour = hours % 24;

    //             return {
    //                 year = year;
    //                 month = month;
    //                 day = day;
    //                 hour = hours;
    //                 minute = minutes;
    //                 nanosecond = nanosecond;
    //             };
    //         };
    //     };
    // };

    // public func fromTime(time : Time.Time) : DateTime {
    //     let year = Year.fromTime(time);
    //     var nano = time - Year.timeSince1970(year) : Nat;

    //     var month = 0;
    //     label l while (month < 12) {
    //         month += 1;
    //         let n = DAY * Month.amountOfDays(year, month);
    //         if (nano <= n) break l;
    //         nano -= n;
    //     };

    //     var day = 0;
    //     label l while (day < Month.amountOfDays(year, month)) {
    //         day += 1;
    //         if (nano <= DAY) break l;
    //         nano -= DAY;
    //     };

    //     let hour = (nano / 60 / 60 / SECOND) % 24;
    //     nano -= hour * HOUR;
    //     let minute = (nano / 60 / SECOND) % 60;
    //     nano -= minute * MINUTE;
    //     let second = (nano / SECOND) % 60;
    //     nano -= second * SECOND;

    //     {
    //         year;
    //         month;
    //         day;
    //         hour;
    //         minute;
    //         second;
    //         nano;
    //     };
    // };

    public func toEpochNanoseconds(dateTime : DateTime) : Time.Time {
        let nanosecondsInAMinute = 60 * 1000000000;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;
        var totalNanoseconds : Int = 0;

        if (dateTime.year < 1970) {
            // For dates before the epoch, need to do the inverse
            var currentYear = 1969;
            while (currentYear > dateTime.year) {
                totalNanoseconds -= daysInYear(currentYear) * nanosecondsInADay;
                currentYear -= 1;
            };

            // Month
            let currentIsLeapYear = isLeapYear(dateTime.year);
            var currentMonth = 12;
            while (currentMonth > dateTime.month) {
                totalNanoseconds -= daysInMonth(currentMonth, currentIsLeapYear) * nanosecondsInADay;
                currentMonth -= 1;
            };
            let daysInMonthV = daysInMonth(dateTime.month, currentIsLeapYear);
            // Day
            totalNanoseconds -= (daysInMonthV - dateTime.day) * nanosecondsInADay;

            // Hour
            totalNanoseconds -= (23 - dateTime.hour) * nanosecondsInAnHour;

            // Minute
            totalNanoseconds -= (59 - dateTime.minute) * nanosecondsInAMinute;

            // Nanosecond
            totalNanoseconds -= 60_000_000_000 - dateTime.nanosecond;
        } else {

            var currentYear = 1970;
            while (currentYear < dateTime.year) {
                totalNanoseconds += daysInYear(currentYear) * nanosecondsInADay;
                currentYear += 1;
            };

            // Month
            let currentIsLeapYear = isLeapYear(dateTime.year);
            var currentMonth = 1;
            while (currentMonth < dateTime.month) {
                totalNanoseconds += daysInMonth(currentMonth, currentIsLeapYear) * nanosecondsInADay;
                currentMonth += 1;
            };

            // Day
            totalNanoseconds += (dateTime.day - 1) * nanosecondsInADay;

            // Hour
            totalNanoseconds += dateTime.hour * nanosecondsInAnHour;

            // Minute
            totalNanoseconds += dateTime.minute * nanosecondsInAMinute;

            // Nanosecond
            totalNanoseconds += dateTime.nanosecond;
        };

        return totalNanoseconds;
    };

    public func fromEpochNanoseconds(epochNanoseconds : Int) : DateTime {
        let nanosecondsInAMinute = 60 * 1000000000;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;

        let pre1970 = epochNanoseconds < 0;
        var year = if (pre1970) 1969 else 1970;
        var remainingNanoseconds : Nat = Int.abs(epochNanoseconds);

        // Remove years until cant remove any more
        label l loop {
            let daysInYearV = daysInYear(year);
            let yearInNanoseconds = daysInYearV * nanosecondsInADay;
            if (remainingNanoseconds <= yearInNanoseconds) {
                if (not pre1970 and remainingNanoseconds == yearInNanoseconds) {
                    // If exactly 1 year left, then we are on the first day of the next year
                    year += 1;
                    remainingNanoseconds := 0;
                };
                break l;
            };
            remainingNanoseconds -= yearInNanoseconds;
            if (pre1970) {
                year -= 1;
            } else {
                year += 1;
            };
        };

        // Remove months until cant remove any more
        var month = if (pre1970) 12 else 1;
        let currentIsLeapYear = isLeapYear(year);
        label l loop {
            let daysInMonthV = daysInMonth(month, currentIsLeapYear);
            let monthInNanoseconds : Nat = daysInMonthV * nanosecondsInADay;
            if (remainingNanoseconds <= monthInNanoseconds) {
                if (not pre1970 and remainingNanoseconds == monthInNanoseconds) {
                    // If exactly 1 month left, then we are on the first day of the next month
                    month += 1;
                    remainingNanoseconds := 0;
                };
                break l;
            };
            remainingNanoseconds -= monthInNanoseconds;
            if (pre1970) {
                month -= 1;
            } else {
                month += 1;
            };
        };

        let day : Nat = if (pre1970) {
            let daysInMonthV = daysInMonth(month, currentIsLeapYear);
            let days : Nat = (remainingNanoseconds / nanosecondsInADay);
            remainingNanoseconds -= days * nanosecondsInADay;
            if (remainingNanoseconds > 0) {
                daysInMonthV - days;
            } else {
                daysInMonthV - days + 1; // If exactly on the day, dont go to 'next' day
            };
        } else {
            let days = (remainingNanoseconds / nanosecondsInADay);
            remainingNanoseconds -= days * nanosecondsInADay;
            days + 1;
        };

        var hour = remainingNanoseconds / nanosecondsInAnHour;
        remainingNanoseconds %= nanosecondsInAnHour;

        let minute = remainingNanoseconds / nanosecondsInAMinute;
        remainingNanoseconds %= nanosecondsInAMinute;

        let nanosecond = remainingNanoseconds;

        return {
            year = year;
            month = month;
            day = day;
            hour = if (pre1970 and hour > 0) 23 - hour else hour;
            minute = if (pre1970 and minute > 0) 60 - minute else minute;
            nanosecond = nanosecond;
        };
    };

    public func toText(dateTime : DateTime) : Text {
        return toTextFormatted(dateTime, #iso8601);
    };

    public func toTextFormatted(dateTime : DateTime, format : TextFormat) : Text {
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

                return ?{
                    year = year;
                    month = month;
                    day = day;
                    hour = hour;
                    minute = minute;
                    nanosecond = (seconds * 1_000_000_000) + (milliseconds * 1_000_000);
                };
            };
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

    private func toTextPadded(value : Nat, length : Nat) : Text {
        var text = Nat.toText(value);
        if (text.size() < length) {
            // Pad with leading zeros
            for (a in Iter.range(0, length - text.size() - 1)) {
                text := "0" # text;
            };
        };
        return text;
    };
};
