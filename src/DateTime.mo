import Time "mo:base/Time";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

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

    public func now() : Time.Time {
        return Time.now();
    };

    public func isValid(dateTime : DateTime) : Bool {
        // Leap years are every 4 years, except for every 100 years, except for every 400 years.
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

    public func daysInYear(year : Nat) : Time.Time {
        let leapYear = isLeapYear(year);
        return if (leapYear) 366 else 365;
    };

    public func isLeapYear(year : Nat) : Bool {
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

    // public func toText(dt : Time.Time) : Text {
    //     let (year, month, day) = Time.toGregorianDate(ts);
    //     let (hour, minute, second) = Time.toClock(ts);
    //     let ms = Time.toNanos(ts) / 1000000 % 1000;

    //     Format.format(
    //         "{:04}-{:02}-{:02}T{:02}:{:02}:{:02}.{:03}Z",
    //         [year, month, day, hour, minute, second, ms],
    //     );
    // };
};
