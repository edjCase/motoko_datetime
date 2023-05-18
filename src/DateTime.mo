import Time "mo:base/Time";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Prelude "mo:base/Prelude";
import Order "mo:base/Order";
import InternalTypes "../internal/Types";
import InternalTextUtil "../internal/TextUtil";
import InternalComponents "../internal/Components";
import Components "Components";

module D {

    public type Duration = InternalTypes.Duration;
    public type TextFormat = InternalTypes.TextFormat;
    public type DateTime = InternalTypes.DateTime;
    public type Components = InternalTypes.Components;

    public func DateTime(time : Int) : DateTime = object {
        var componentsCache : ?Components = null;

        public func equal(other : DateTime) : Bool {
            return time == other.toTime();
        };

        public func add(duration : Duration) : DateTime {
            switch(InternalComponents.resolveDuration(duration)) {
                case (#absoluteTime(newTime)) {
                    DateTime(newTime);
                };
                case (#adder(adder)) {
                    // Convert the current datetime components to
                    let components = toComponents();
                    let newComponents = adder(components);
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
            let components : Components = toComponents();
            InternalComponents.toTextFormatted(components, format, "Z");
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
                    let components = Components.addTime(epoch, time);
                    componentsCache := ?components;
                    components;
                };
            };
        };

        public func isLeapYear() : Bool {
            let year = toComponents().year;
            InternalComponents.isLeapYear(year);
        };

        public func compare(other : DateTime) : Order.Order {
            Int.compare(time, other.toTime());
        };
    };

    public func equal(a : DateTime, b : DateTime) : Bool {
        return a.equal(b);
    };
    public func now() : DateTime {
        return fromTime(Time.now());
    };

    public func fromTime(nanoseconds : Time.Time) : DateTime {
        DateTime(nanoseconds);
    };

    public func fromComponents(components : Components) : ?DateTime {
        do ? {
            let totalNanoseconds = Components.toTime(components)!;
            DateTime(totalNanoseconds);
        };
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

};
