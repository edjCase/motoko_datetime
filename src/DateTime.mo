/// This module provides a set of functions for working with DateTime values.
///
/// Import from the base library to use this module.
/// ```motoko name=import
/// import DateTime "mo:datetime/DateTime";
/// import Components "mo:datetime/Components";
/// import Time "mo:base/Time";
/// ```

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
import InternalTimeZone "../internal/TimeZone";
import Components "Components";
import TimeZone "TimeZone";

module D {

    public type Duration = InternalTypes.Duration;
    public type TextFormat = InternalTypes.TextFormat;
    public type DateTime = InternalTypes.DateTime;
    type Components = InternalTypes.Components;

    /// Creates an instance of the `DateTime` type from a `Time.Time` value.
    ///
    /// ```motoko include=import
    /// let nowTime : Time.Time = Time.now();
    /// let nowDateTime : DateTime.DateTime = DateTime(time);
    /// ```
    public func DateTime(time : Time.Time) : DateTime = object {
        var componentsCache : ?Components = null;

        /// Adds a `Duration` and returns the resulting new `DateTime` value.
        /// Does not modify the current `DateTime` value.
        ///
        /// ```motoko include=import
        /// let now : DateTime.DateTime = DateTime.now();
        /// let fourDays : DateTime.Duration = #days(4);
        /// let fourDaysFromNow : DateTime.DateTime = now.add(fourDays);
        /// ```
        public func add(duration : Duration) : DateTime {
            switch (InternalComponents.resolveDuration(duration)) {
                case (#absoluteTime(newTime)) {
                    DateTime(toTime() + newTime);
                };
                case (#adder(adder)) {
                    let components = toComponents();
                    let newComponents = adder(components);
                    fromComponents(newComponents);
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

        // TODO rename
        /// Calculates the time difference between this `DateTime` and another `DateTime` value.
        /// Will return a negative value if the other `DateTime` is in the future compared with this `DateTime` value.
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let otherDateTime : DateTime.DateTime = DateTime.fromText("2021-01-01T00:00:00.000000000Z");
        /// let timeBetween : Time.Time = dateTime.timeBetween(otherDateTime);
        /// ```
        public func timeBetween(other : DateTime) : Time.Time {
            let otherTime = other.toTime();
            return time - otherTime;
        };

        /// Creates a `Time.Time` (nanoseconds since epoch) value from a `DateTime` value.
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let nanoseconds : Time.Time = dateTime.toTime();
        /// ```
        public func toTime() : Time.Time {
            return time;
        };

        /// Formats the `DateTime` as Text value using the ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let dateTimeText : Text = dateTime.toText();
        /// ```
        public func toText() : Text {
            return toTextFormatted(#iso8601);
        };

        /// Formats the `DateTime` as Text value using the given format.
        ///
        /// Formats:
        /// - `#iso8601` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let dateTimeText : Text = dateTime.toTextFormatted(#iso8601);
        /// ```
        public func toTextFormatted(format : TextFormat) : Text {
            let components : Components = toComponents();
            InternalComponents.toTextFormatted(components, #fixed(#seconds(0)), format);
        };

        /// Creates a `Components` from a `DateTime` value.
        ///
        /// ```motoko include=import
        /// let datetime : DateTime.DateTime = DateTime.now();
        /// let components : Components.Components = datetime.toComponents();
        /// ```
        public func toComponents() : Components {
            switch (componentsCache) {
                case (?components) components;
                case (null) {
                    let components = Components.fromTime(time);
                    componentsCache := ?components;
                    components;
                };
            };
        };

        /// Checks if the `DateTime` is in a leap year.
        ///
        /// ```motoko include=import
        /// let datetime : DateTime.DateTime = DateTime.now();
        /// let isInLeapYear : Bool = datetime.isInLeapYear();
        /// ```
        public func isInLeapYear() : Bool {
            let year = toComponents().year;
            InternalComponents.isLeapYear(year);
        };

        /// Compares this `DateTime` with another `DateTime` value.
        ///
        /// ```motoko include=import
        /// let a : DateTime.DateTime = ...;
        /// let b : DateTime.DateTime = ...;
        /// let order : Order.Order = a.compare(b);
        /// ```
        public func compare(other : DateTime) : Order.Order {
            Int.compare(time, other.toTime());
        };

        /// Checks the equality of this `DateTime` with another `DateTime` value.
        ///
        /// ```motoko include=import
        /// let a : DateTime.DateTime = ...;
        /// let b : DateTime.DateTime = ...;
        /// let areEqual : Bool = a.equal(b);
        /// ```
        public func equal(other : DateTime) : Bool {
            return time == other.toTime();
        };
    };

    /// Checks the equality of two `DateTime` values.
    ///
    /// ```motoko include=import
    /// let a : DateTime.DateTime = ...;
    /// let b : DateTime.DateTime = ...;
    /// let equal : Bool = DateTime.equal(a, b);
    /// ```
    public func equal(a : DateTime, b : DateTime) : Bool {
        return a.equal(b);
    };

    /// Compares two `DateTime` values and returns their order.
    ///
    /// ```motoko include=import
    /// let a : DateTime.DateTime = ...;
    /// let b : DateTime.DateTime = ...;
    /// let order : Order.Order = DateTime.compare(a, b);
    /// ```
    public func compare(a : DateTime, b : DateTime) : Order.Order {
        Int.compare(a.toTime(), b.toTime());
    };

    /// Creates a `DateTime` for the current time
    ///
    /// ```motoko include=import
    /// let now : DateTime.DateTime = DateTime.now();
    /// ```
    public func now() : DateTime {
        return fromTime(Time.now());
    };

    /// Creates a `DateTime` from a `Time.Time` (nanoseconds since epoch) value.
    /// (Same functionality as DateTime constructor)
    ///
    /// ```motoko include=import
    /// let nanoseconds : Time.Time = Time.now();
    /// let dateTime : DateTime.DateTime = DateTime.fromTime(nanoseconds);
    /// ```
    public func fromTime(nanoseconds : Time.Time) : DateTime {
        DateTime(nanoseconds);
    };

    /// Creates a `DateTime` from a `Components` value.
    /// Returns null if the `Components` value is invalid.
    ///
    /// ```motoko include=import
    /// let components : Components.Components = ...;
    /// let ?dateTime : ?DateTime.DateTime = DateTime.fromComponents(components) else return #error("Invalid date");
    /// ```
    public func fromComponents(components : Components) : DateTime {
        let totalNanoseconds = Components.toTime(components);
        DateTime(totalNanoseconds);
    };

    /// Formats the `DateTime` as Text value using the ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
    ///
    /// ```motoko include=import
    /// let dateTime : DateTime.DateTime = DateTime.now();
    /// let dateTimeText : Text = DateTime.toText(dateTime);
    /// ```
    public func toText(dateTime : DateTime) : Text {
        dateTime.toText();
    };

    /// Formats the `DateTime` as Text value using the given format.
    ///
    /// Formats:
    /// - `#iso8601` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
    ///
    /// ```motoko include=import
    /// let dateTime : DateTime.DateTime = DateTime.now();
    /// let dateTimeText : Text = DateTime.toTextFormatted(datetime, #iso8601);
    /// ```
    public func toTextFormatted(dateTime : DateTime, format : TextFormat) : Text {
        dateTime.toTextFormatted(format);
    };

    /// Parses the Text value as a `DateTime` using the given format.
    /// Returns null if the Text value is invalid.
    /// Treats the Text value as UTC if no timezone is specified.
    ///
    /// Formats:
    /// - `#iso8601` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
    ///
    /// ```motoko include=import
    /// let dateTimeText : Text = "2021-01-01T00:00:00.000000000Z";
    /// let ?dateTime : ?DateTime.DateTime = DateTime.fromTextFormatted(dateTimeText, #iso8601) else return #error("Invalid date");
    /// ```
    public func fromTextFormatted(text : Text, format : TextFormat) : ?DateTime {

        do ? {
            let { components; timeZoneDescriptor } : Components.FromTextResult = Components.fromTextFormatted(text, format)!;
            let offset : ?Time.Time = switch (timeZoneDescriptor) {
                case (#utc) null;
                case (#unspecified) null;
                case (#fixed(f)) ?TimeZone.toFixedOffsetSeconds(f);
                case (#name(n)) null; // TODO
            };
            switch (offset) {
                case (null) {
                    fromComponents(components);
                };
                case (?offsetSeconds) {
                    let localTime = Components.toTime(components);
                    let utcTime = localTime - (offsetSeconds * 1_000_000_000);
                    DateTime(utcTime);
                };
            };
        };
    };
};
