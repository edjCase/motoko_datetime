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
import Text "mo:base/Text";
import Order "mo:base/Order";
import Types "Types";
import InternalComponents "../internal/Components";
import Components "Components";
import TimeZone "TimeZone";

module D {
    public type Duration = Types.Duration;
    public type TextFormat = Types.TextFormat;
    public type DateTime = Types.DateTime;
    type Components = Types.Components;
    type DayOfWeek = Types.DayOfWeek;
    type Locale = Types.Locale;
    public type AdvanceDayOfWeekOptions = Types.AdvanceDayOfWeekOptionsWithTime;

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
                case (#relative(converter)) {
                    let components = toComponents();
                    let newComponents = converter(components);
                    fromComponents(newComponents);
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
            let components = toComponents();
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
        public func weekYear() : Int {
            let components = toComponents();
            InternalComponents.weekYear(components, #monday, 4);
        };

        /// Gets the ISO week of year for the `DateTime` value.
        /// A value of 0 means that the week is part of the previous year.
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let weekOfYear : Nat.Nat = dateTime.weekOfYear();
        /// ```
        public func weekOfYear() : Nat {
            let components = toComponents();
            InternalComponents.weekOfYear(components, #monday, 4);
        };

        /// Gets the day of the week for the `DateTime` value.
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let dayOfWeek : DayOfWeek.DayOfWeek = dateTime.dayOfWeek();
        /// ```
        public func dayOfWeek() : DayOfWeek {
            let components = toComponents();
            InternalComponents.dayOfWeek(components);
        };

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
            return toTextFormatted(#iso);
        };

        /// Formats the `DateTime` as Text value using the given format.
        ///
        /// Formats:
        /// - `#iso` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
        /// - `#custom` - Custom format using momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
        ///
        /// ```motoko include=import
        /// let dateTime : DateTime.DateTime = DateTime.now();
        /// let dateTimeText : Text = dateTime.toTextFormatted(#iso);
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

        /// Advances to the specified day of the week and and returns the resulting new `DateTime` value.
        /// If the `DateTime` value is already on the specified day of the week, the `DateTime` value is cloned and returned unchanged
        /// If keepSameTime is true, the time of the `DateTime` value is preserved, otherwise the time is set to midnight.
        /// Will trap if the resulting components are invalid.
        ///
        /// ```motoko include=import
        /// let d : DateTime = ...;
        /// let dayOfWeek : DateTime.DayOfWeek = ...;
        /// let options : DateTime.AdvanceDayOfWeekOptions = {
        ///     addWeekOnMatchingDay = true; // Add a week if the day of the week is the same
        ///     resetToStartOfDay = true; // Set the time value to midnight of the specified day of week
        /// };
        /// let newD : DateTime = d.advanceToDayOfWeek(dayOfWeek);
        /// ```
        public func advanceToDayOfWeek(dayOfWeek : DayOfWeek, options : AdvanceDayOfWeekOptions) : DateTime {
            let components = toComponents();
            let newDateComponents = InternalComponents.advanceToDayOfWeek(components, dayOfWeek, options);
            let newComponents = if (not options.resetToStartOfDay) {
                {
                    newDateComponents with
                    hour = components.hour;
                    minute = components.minute;
                    nanosecond = components.nanosecond;
                };
            } else {
                {
                    newDateComponents with
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
            };
            fromComponents(newComponents);
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
    /// - `#iso` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
    /// - `#custom` - Custom format using momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
    ///
    /// ```motoko include=import
    /// let dateTime : DateTime.DateTime = DateTime.now();
    /// let dateTimeText : Text = DateTime.toTextFormatted(datetime, #iso);
    /// ```
    public func toTextAdvanced(dateTime : DateTime, format : TextFormat) : Text {
        dateTime.toTextFormatted(format);
    };

    /// Parses the Text value as a `DateTime` using the given format. Converts to UTC from parsed timezone offset.
    /// Returns null if the Text value is invalid.
    /// Treats the Text value as UTC if no timezone is specified.
    /// Format uses momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
    /// Will trap if locale is null and the format contains locale specific tokens.
    /// Note: If you need to parse a localized date, use `DateTime.fromTextLocalized` instead.
    ///
    /// ```motoko include=import
    /// let date = "2020-01-01T00:00:00Z";
    /// let format = "YYYY-MM-DDTHH:mm:ssZ";
    /// let ?dateTime : ?DateTime.DateTime = DateTime.fromText(dateTimeText, format) else return #error("Invalid date");
    /// ```
    public func fromText(
        text : Text,
        format : Text,
    ) : ?DateTime {
        fromTextInternal(text, format, null, #fixed(#seconds(0)));
    };

    /// Parses the Text value as a `DateTime` using the given format and locale. Converts to UTC from parsed timezone offset.
    /// Returns null if the Text value is invalid.
    /// Treats the Text value as local timezone if no timezone is specified..
    /// Format uses momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
    /// Locale is only required for formats with locale specific tokens (e.g. month names).
    /// Will trap if locale is null and the format contains locale specific tokens.
    /// Will trap if timezone abbreviation is used (e.g. PST), only use offset (e.g. -08:00)
    ///
    /// ```motoko include=import
    /// import EN "../iana/locales/EN";
    /// import AmericaTimeZones "../iana/timezones/America";
    /// let date = "Sun, Mar 9, 2008";
    /// let format = "ddd, MMM D, YYYY";
    /// let localTimeZone = AmericaTimeZones.Los_Angeles.data;
    /// let locale = EN.locale;
    /// let ?dateTime : ?DateTime.DateTime = DateTime.fromTextLocalized(dateTimeText, format, locale, defaultTimeZone) else return #error("Invalid date");
    /// ```
    public func fromTextLocalized(
        text : Text,
        format : Text,
        locale : Locale,
        localTimeZone : TimeZone.TimeZone,
    ) : ?DateTime {
        fromTextInternal(text, format, ?locale, localTimeZone);
    };

    private func fromTextInternal(
        text : Text,
        format : Text,
        locale : ?Locale,
        localTimeZone : TimeZone.TimeZone,
    ) : ?DateTime {

        do ? {
            let { components; timeZoneDescriptor } : Components.FromTextResult = Components.fromText(text, format, locale)!;
            let offset : ?Time.Time = switch (timeZoneDescriptor) {
                case (#utc) null;
                case (#unspecified) ?TimeZone.toOffsetSeconds(localTimeZone, components);
                case (#fixed(f)) ?TimeZone.toFixedOffsetSeconds(f);
                case (#name(n)) Debug.trap("Timezone abbreviation parsing is not supported");
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
