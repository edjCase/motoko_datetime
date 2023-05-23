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
import Components "../internal/Components";
import Order "mo:base/Order";

module {

    public type Components = InternalTypes.Components;
    public type DateTime = InternalTypes.DateTime;
    public type LocalDateTime = InternalTypes.LocalDateTime;
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
        };
    };
    
    public func compare(c1 : Components, c2 : Components) : Order.Order {
        switch(Int.compare(c1.year, c2.year)){
            case (#greater) #greater;
            case (#less) #less;
            case (#equal) {
                switch (Int.compare(c1.month, c2.month)) {
                    case (#greater) #greater;
                    case (#less) #less;                    
                    case (#equal) Int.compare(c1.day, c2.day);
                };
            }
        };
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

    public func addTime(components : Components, nanoseconds : Time.Time) : Components {
        if (not isValid(components)) {
            return Debug.trap("Invalid components: " # debug_show (components));
        };
        if (nanoseconds < 0) {
            subtractNanoseconds(components, Int.abs(nanoseconds));
        } else if (nanoseconds > 0) {
            addNanoseconds(components, Int.abs(nanoseconds));
        } else {
            return components;
        };
    };

    private func subtractNanoseconds(components : Components, nanoseconds : Nat) : Components {
        let nanosecondsInAMinute = 60 * 1000000000;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;

        var remainingNanoseconds : Nat = nanoseconds;

        var remainingDays : Nat = remainingNanoseconds / nanosecondsInADay;

        let date = subtractDays(components, remainingDays);
        var newComponents = {
            components with
            year = date.year;
            month = date.month;
            day = date.day;
        };

        remainingNanoseconds -= remainingDays * nanosecondsInADay;

        let removeHours = remainingNanoseconds / nanosecondsInAnHour;
        remainingNanoseconds %= nanosecondsInAnHour;

        newComponents := subtractHours(newComponents, removeHours);

        let removeMinutes = remainingNanoseconds / nanosecondsInAMinute;
        remainingNanoseconds %= nanosecondsInAMinute;

        newComponents := subtractMinutes(newComponents, removeMinutes);

        let nanosecond = remainingNanoseconds;

        return {newComponents with nanosecond=nanosecond};
    };

    type DateComponents = {
        year : Int;
        month : Nat;
        day : Nat;
    };

    private func subtractMinutes(components : Components, removeMinutes : Nat) : Components {
        if (removeMinutes == 0) {
            return components;
        };
        Debug.print("Components: " # debug_show (components));
        Debug.print("subtractMinutes: " # debug_show (removeMinutes));

        var year = components.year;
        var month = components.month;
        var day = components.day;
        var hour = components.hour;
        // TODO remove redundancy with this method and subtractHours
        let minute : Nat = if (removeMinutes >= components.minute) {
            if (hour == 0) {
                if (day == 1) {
                    if (month == 1) {
                        year -= 1;
                        month := 12;
                    } else {
                        month -= 1;
                    };
                    day := InternalComponents.daysInMonth(month, InternalComponents.isLeapYear(year));
                } else {
                    day -= 1;
                };
                hour := 23;
            } else {
                hour -= 1;
            };            
            59 - (removeMinutes - components.minute);
        } else {
            components.minute - removeMinutes;
        };
        {
            year = year;
            month = month;
            day = day;
            hour = hour;
            minute = minute;
            nanosecond = components.nanosecond;
        }
    };

    private func subtractHours(components : Components, removeHours : Nat) : Components {
        if (removeHours == 0) {
            return components;
        };
        var year = components.year;
        var month = components.month;
        var day = components.day;
        let hour : Nat = if (removeHours > components.hour) {
            if (day == 1) {
                if (month == 1) {
                    year -= 1;
                    month := 12;
                } else {
                    month -= 1;
                };
                day := InternalComponents.daysInMonth(month, InternalComponents.isLeapYear(year));
            } else {
                day -= 1;
            };
            24 - (removeHours - components.hour);
        } else {
            components.hour - removeHours;
        };
        {
            year = year;
            month = month;
            day = day;
            hour = hour;
            minute = components.minute;
            nanosecond = components.nanosecond;
        }
    };

    private func subtractDays(components : DateComponents, days : Nat) : DateComponents {
        if (days == 0) {
            return components;
        };
        var remainingDays : Nat = days;
        var year : Int = components.year;
        var month : Nat = components.month;
        var day : Nat = components.day;

        let beforeLeapDay = month < 2 or (month == 2 and day < 29);

        // Subtract years from total days
        label l loop {
            let newYear = year - 1;
            let daysInYear = if (beforeLeapDay) {
                InternalComponents.daysInYear(newYear);
            } else {
                InternalComponents.daysInYear(newYear + 1) ;
            };
            if (remainingDays < InternalComponents.daysInYear(newYear)) {
                break l;
            };
            if (remainingDays < daysInYear) {
                break l;
            };
            remainingDays -= daysInYear;
            year := newYear;
        };


        // Subtract months from total days
        label l loop {
            var newYear : Int = year;
            var newMonth : Nat = month - 1;
            if (newMonth == 0) {
                newMonth := 12;
                newYear := newYear - 1;
            };
            let isLeapYear = InternalComponents.isLeapYear(newYear);
            let daysInMonth = InternalComponents.daysInMonth(newMonth, isLeapYear);
            if (remainingDays < daysInMonth) {
                break l;
            };
            remainingDays -= daysInMonth;
            month := newMonth;
            year := newYear;
        };

        // Subtract days from total days
        while (remainingDays > 0) {
            var newYear : Int = year;
            var newMonth : Nat = month;
            var newDay : Nat = day;

            if (newDay == 1) {
                if (newMonth == 1) {
                    newMonth := 12;
                    newYear := newYear - 1;
                } else {
                    newMonth := newMonth - 1;
                };
                let isLeapYear = InternalComponents.isLeapYear(newYear);
                newDay := InternalComponents.daysInMonth(newMonth, isLeapYear);
            } else {
                newDay := newDay - 1;
            };
            remainingDays -= 1;
            year := newYear;
            month := newMonth;
            day := newDay;
        };

        // Fix potential overflow of days in a month
        let daysInMonth = InternalComponents.daysInMonth(month, InternalComponents.isLeapYear(year));
        if (day > daysInMonth) {
            let diff : Nat = day - daysInMonth;
            day := diff;
            month := month + 1;
        };

        {
            year = year;
            month = month;
            day = day;
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
        var day : Nat = startDateTime.day + days;

        let hours = remainingNanoseconds / nanosecondsInAnHour;
        remainingNanoseconds %= nanosecondsInAnHour;
        var hour : Nat = startDateTime.hour + hours;

        let minutes = remainingNanoseconds / nanosecondsInAMinute;
        remainingNanoseconds %= nanosecondsInAMinute;
        var minute : Nat = startDateTime.minute + minutes;
        if(minute >= 60) {
            minute -= 60;
            hour += 1;
        };
        if(hour >= 24) {
            hour -= 24;
            day += 1;
        };
        let daysInMonth = InternalComponents.daysInMonth(month, InternalComponents.isLeapYear(year));
        if(day > daysInMonth)
        {
            day -= daysInMonth;
            month += 1;
        };
        if(month > 12)
        {
            month -= 12;
            year += 1;
        };

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
};
