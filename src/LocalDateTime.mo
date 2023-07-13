/// This module provides a set of functions for working with DateTime values with timezone/region context.
///
/// Import from the base library to use this module.
/// ```motoko name=import
/// import LocalDateTime "mo:datetime/LocalDateTime";
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
import DateTime "DateTime";
import InternalTypes "../internal/Types";
import InternalTextUtil "../internal/TextUtil";
import InternalNumberUtil "../internal/NumberUtil";
import InternalComponents "../internal/Components";
import InternalTimeZone "../internal/TimeZone";
import Components "Components";
import TimeZone "TimeZone";

module {

    public type DynamicTimeZone = InternalTypes.DynamicTimeZone;

    public type TimeZone = InternalTypes.TimeZone;

    public type Components = InternalTypes.Components;

    public type LocalDateTime = InternalTypes.LocalDateTime;

    public type TextFormat = InternalTypes.TextFormat;

    public type Duration = InternalTypes.Duration;

    type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor;

    type DayOfWeek = InternalTypes.DayOfWeek;

    type StartOfYear = InternalTypes.StartOfYear;

    /// Creates an instance of the `LocalDateTime` type from a `Components` and a timezone.
    /// The timezone will not change the components value, so the components will reprsent the local time rather than the UTC time.
    /// The `Components` must be valid, otherwise the function will trap.
    ///
    /// ```motoko include=import
    /// let localComponents : Components.Components = ...;
    /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
    /// let localDateTime : LocalDateTime.LocalDateTime = LocalDateTime(localComponents, timeZone);
    /// ```
    public func LocalDateTime(components : Components, timeZone : TimeZone) : LocalDateTime = object {
        if (not Components.isValid(components)) {
            Debug.trap("Invalid components");
        };

        /// Adds a `Duration` and returns the resulting new `LocalDateTime` value.
        /// Does not modify the current `LocalDateTime` value.
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
        /// let now : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let fourDays : LocalDateTime.Duration = #days(4);
        /// let fourDaysFromNow : LocalDateTime.LocalDateTime = now.add(fourDays);
        /// ```
        public func add(duration : DateTime.Duration) : LocalDateTime {
            switch (InternalComponents.resolveDuration(duration)) {
                case (#absoluteTime(nanoseconds)) {
                    let newComponents = Components.addTime(components, nanoseconds);
                    LocalDateTime(newComponents, timeZone);
                };
                case (#relative(converter)) {
                    // Convert the current datetime components to
                    let newComponents = converter(components);
                    LocalDateTime(newComponents, timeZone);
                };
            };
        };

        /// Gets the day of year for the `DateTime` value.
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let dayOfYear : Nat.Nat = dateTime.dayOfYear();
        /// ```
        public func dayOfYear() : Nat {
            InternalComponents.dayOfYear(components);
        };

        /// Gets the ISO week year for the `DateTime` value.
        /// Will trap if the components are invalid
        /// Note: This is not the same as the calendar year or week of year
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let weekYear : Int.Int = dateTime.weekYear();
        /// ```
        public func weekYear(startOfYear : StartOfYear) : Int {
            let (firstDayOfWeek, firstDayOfYear) = getStartOfYear(startOfYear);
            let components = toComponents();
            InternalComponents.weekYear(components, firstDayOfWeek, firstDayOfYear);
        };

        /// Gets the week of year for the `DateTime` value.
        /// A value of 0 means that the week is part of the previous year.
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let weekOfYear : Nat.Nat = dateTime.weekOfYear();
        /// ```
        public func weekOfYear(startOfYear : StartOfYear) : Nat {
            let (firstDayOfWeek, firstDayOfYear) = getStartOfYear(startOfYear);
            InternalComponents.weekOfYear(components, firstDayOfWeek, firstDayOfYear);
        };

        private func getStartOfYear(startOfYear : StartOfYear) : (DayOfWeek, Nat) {
            switch (startOfYear) {
                case (#iso)(#monday, 4);
                case (#locale(l))(l.firstDayOfWeek, l.firstDayOfYear);
            };
        };

        /// Gets the day of the week for the `DateTime` value.
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let dayOfWeek : DayOfWeek.DayOfWeek = dateTime.dayOfWeek();
        /// ```
        public func dayOfWeek() : DayOfWeek {
            InternalComponents.dayOfWeek(components);
        };

        /// Calculates the time difference between this `LocalDateTime` and another `LocalDateTime` value.
        /// Will return a negative value if the other value is in the future compared with this value.
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let otherDateTime : LocalDateTime.LocalDateTime = LocalDateTime.fromText("2021-01-01T00:00:00.000000000+03:00");
        /// let timeBetween : Time.Time = dateTime.timeBetween(otherDateTime);
        /// ```
        public func timeBetween(other : LocalDateTime) : Time.Time {
            let otherTime = other.toTime();
            return toTime() - otherTime;
        };

        /// Creates a `Time.Time` (nanoseconds since epoch) value from a `LocalDateTime` value.
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let nanoseconds : Time.Time = dateTime.toTime();
        /// ```
        public func toTime() : Time.Time {
            let offset = TimeZone.toOffsetSeconds(timeZone, components);
            let newComponents = Components.addTime(components, -offset * 1_000_000_000);
            Components.toTime(newComponents);
        };

        /// Formats the `LocalDateTime` as Text value using the ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let dateTimeText : Text = dateTime.toText();
        /// ```
        public func toText() : Text {
            return toTextFormatted(#iso8601);
        };

        /// Formats the `DateTime` as Text value using the given format.
        ///
        /// Formats:
        /// - `#iso8601` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let dateTimeText : Text = dateTime.toTextFormatted(#iso8601);
        /// ```
        public func toTextFormatted(format : DateTime.TextFormat) : Text {
            let components = toComponents();
            InternalComponents.toTextFormatted(components, timeZone, format);
        };

        /// Creates a `Components` from a `LocalDateTime` value.
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let components : Components.Components = datetime.toComponents();
        /// ```
        public func toComponents() : Components.Components {
            components;
        };

        /// Checks if the `LocalDateTime` is in a leap year.
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let isInLeapYear : Bool = datetime.isInLeapYear();
        /// ```
        public func isInLeapYear() : Bool {
            let year = toComponents().year;
            InternalComponents.isLeapYear(year);
        };

        /// Compares this `LocalDateTime` with another `LocalDateTime` value.
        ///
        /// ```motoko include=import
        /// let a : LocalDateTime.LocalDateTime = ...;
        /// let b : LocalDateTime.LocalDateTime = ...;
        /// let order : Order.Order = a.compare(b);
        /// ```
        public func compare(other : LocalDateTime) : Order.Order {
            Int.compare(toTime(), other.toTime());
        };

        /// Checks the equality of this `LocalDateTime` with another `LocalDateTime` value.
        ///
        /// ```motoko include=import
        /// let a : LocalDateTime.LocalDateTime = ...;
        /// let b : LocalDateTime.LocalDateTime = ...;
        /// let areEqual : Bool = a.equal(b);
        /// ```
        public func equal(other : LocalDateTime) : Bool {
            return compare(other) == #equal;
        };

        public func toUtcDateTime() : DateTime.DateTime {
            DateTime.DateTime(toTime());
        };

        public func getTimeZone() : TimeZone.TimeZone {
            timeZone;
        };
    };

    /// Checks the equality of two `LocalDateTime` values.
    ///
    /// ```motoko include=import
    /// let a : LocalDateTime.LocalDateTime = ...;
    /// let b : LocalDateTime.LocalDateTime = ...;
    /// let equal : Bool = LocalDateTime.equal(a, b);
    /// ```
    public func equal(a : LocalDateTime, b : LocalDateTime) : Bool {
        return a.equal(b);
    };

    /// Compares two `LocalDateTime` values and returns their order.
    ///
    /// ```motoko include=import
    /// let a : LocalDateTime.LocalDateTime = ...;
    /// let b : LocalDateTime.LocalDateTime = ...;
    /// let order : Order.Order = DateTime.compare(a, b);
    /// ```
    public func compare(a : LocalDateTime, b : LocalDateTime) : Order.Order {
        Int.compare(a.toTime(), b.toTime());
    };

    /// Creates a `LocalDateTime` for the current time
    ///
    /// ```motoko include=import
    /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
    /// let now : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
    /// ```
    public func now(timeZone : TimeZone) : LocalDateTime {
        return fromTime(Time.now(), timeZone);
    };

    /// Creates a `LocalDateTime` from a `Time.Time` (nanoseconds since epoch) value and a timezone.
    /// (Same functionality as LocalDateTime constructor)
    /// The timezone will not change the components value, so the components will reprsent the local time rather than the UTC time.
    /// The `Components` must be valid, otherwise the function will trap.
    ///
    /// ```motoko include=import
    /// let nanoseconds : Time.Time = Time.now();
    /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
    /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.fromTime(nanoseconds, timeZone);
    /// ```
    public func fromTime(nanoseconds : Time.Time, timeZone : TimeZone) : LocalDateTime {
        let utcComponents = Components.fromTime(nanoseconds);
        let offset = TimeZone.toOffsetSeconds(timeZone, utcComponents);
        let localizedComponents = Components.addTime(utcComponents, offset * 1_000_000_000);
        LocalDateTime(localizedComponents, timeZone);
    };

    /// Creates a `LocalDateTime` from a `Components` value and a timezone.
    /// Returns null if the `Components` value is invalid.
    ///
    /// ```motoko include=import
    /// let components : Components.Components = ...;
    /// let ?dateTime : ?DateTime.DateTime = DateTime.fromComponents(components) else return #error("Invalid date");
    /// ```
    public func fromComponents(components : Components, timeZone : TimeZone) : ?LocalDateTime {
        if (not Components.isValid(components)) {
            return null;
        };
        ?LocalDateTime(components, timeZone);
    };

    /// Formats the `LocalDateTime` as Text value using the ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)
    ///
    /// ```motoko include=import
    /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
    /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
    /// let dateTimeText : Text = LocalDateTime.toText(dateTime);
    /// ```
    public func toText(dateTime : LocalDateTime) : Text {
        dateTime.toText();
    };

    /// Formats the `LocalDateTime` as Text value using the given format.
    ///
    /// Formats:
    /// - `#iso8601` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)
    ///
    /// ```motoko include=import
    /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(3, 0))); // UTC+3
    /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
    /// let dateTimeText : Text = DateTime.toTextFormatted(datetime, #iso8601);
    /// ```
    public func toTextFormatted(dateTime : LocalDateTime, format : TextFormat) : Text {
        dateTime.toTextFormatted(format);
    };

    /// Parses the Text value as a `LocalDateTime` using the given format.
    /// Returns null if the Text value is invalid.
    /// Treats the Text value as UTC if no timezone is specified.
    ///
    /// Formats:
    /// - `#iso8601` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)
    ///
    /// ```motoko include=import
    /// let dateTimeText : Text = "2021-01-01T00:00:00.000000000+03:00";
    /// let ?dateTime : ?DateTime.DateTime = DateTime.fromTextFormatted(dateTimeText, #iso8601) else return #error("Invalid date");
    /// ```
    public func fromTextFormatted(text : Text, format : TextFormat) : ?LocalDateTime {
        do ? {
            let result = Components.fromTextFormatted(text, format)!;
            let timeZone : TimeZone = switch (result.timeZoneDescriptor) {
                case (#utc) TimeZone.utc();
                case (#fixed(f)) #fixed(f);
                case (#unspecified) TimeZone.utc(); // TODO is this the best way to handle it?
                case (#name(n)) TimeZone.utc(); // TODO fix
            };
            LocalDateTime(result.components, timeZone);
        };
    };

};
