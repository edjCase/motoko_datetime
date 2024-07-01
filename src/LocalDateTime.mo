/// This module provides a set of functions for working with DateTime values with timezone context.
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
import Text "mo:base/Text";
import Order "mo:base/Order";
import DateTime "DateTime";
import Types "Types";
import InternalComponents "../internal/Components";
import Components "Components";
import TimeZone "TimeZone";

module {

    public type DynamicTimeZone = Types.DynamicTimeZone;

    public type TimeZone = Types.TimeZone;

    public type Components = Types.Components;

    public type LocalDateTime = Types.LocalDateTime;

    public type TextFormat = Types.TextFormat;

    public type Duration = Types.Duration;

    public type AdvanceDayOfWeekOptions = Types.AdvanceDayOfWeekOptionsWithTime;

    type TimeZoneDescriptor = Types.TimeZoneDescriptor;

    type DayOfWeek = Types.DayOfWeek;

    type StartOfYear = Types.StartOfYear;

    type Locale = Types.Locale;

    /// Creates an instance of the `LocalDateTime` type from a `Components` and a timezone.
    /// The timezone will not change the components value, so the components will reprsent the local time rather than the UTC time.
    /// The `Components` must be valid, otherwise the function will trap.
    ///
    /// ```motoko include=import
    /// let localComponents : Components.Components = ...;
    /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
    /// let localDateTime : LocalDateTime.LocalDateTime = LocalDateTime(localComponents, timeZone);
    /// ```
    public func LocalDateTime(components : Components, localTimeZone : TimeZone) : LocalDateTime = object {
        public let timeZone = localTimeZone;

        if (not Components.isValid(components)) {
            Debug.trap("Invalid components");
        };

        /// Adds a `Duration` and returns the resulting new `LocalDateTime` value.
        /// Does not modify the current `LocalDateTime` value.
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
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
                case (#iso) (#monday, 4);
                case (#locale(l)) (l.firstDayOfWeek, l.firstDayOfYear);
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
        /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
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
        /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
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
        /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let dateTimeText : Text = dateTime.toText();
        /// ```
        public func toText() : Text {
            return toTextFormatted(#iso);
        };

        /// Formats the `DateTime` as Text value using the given format.
        ///
        /// Formats:
        /// - `#iso` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)
        /// - `#custom` - Custom format using momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let dateTimeText : Text = dateTime.toTextFormatted(#iso);
        /// ```
        public func toTextFormatted(format : DateTime.TextFormat) : Text {
            let components = toComponents();
            InternalComponents.toTextFormatted(components, timeZone, format);
        };

        /// Creates a `Components` from a `LocalDateTime` value.
        /// Components will represent the local datetime, not UTC datetime
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let components : Components.Components = datetime.toComponents();
        /// ```
        public func toComponents() : Components.Components {
            components;
        };

        /// Checks if the `LocalDateTime` is in a leap year.
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
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

        /// Converts the `LocalDateTime` to UTC `DateTime` object.
        ///
        /// ```motoko include=import
        /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
        /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        /// let utcDateTime : DateTime.DateTime = dateTime.toUtcDateTime();
        /// ```
        public func toDateTime() : DateTime.DateTime {
            DateTime.DateTime(toTime());
        };

        /// Creates a new LocalDateTime with the same time but in the given timezone.
        /// Does not modify original LocalDateTime
        ///
        /// ```motoko include=import
        /// let timeZone1 : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
        /// let dateTime1 : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
        ///
        /// let timeZone2 : TimeZone.TimeZone = #fixed(#hours(2)); // UTC+2
        /// let dateTime2 : LocalDateTime.LocalDateTime = dateTime1.withTimeZone(timeZone);
        /// ```
        public func withTimeZone(timeZone : TimeZone) : LocalDateTime {
            let time = toTime();
            fromTime(time, timeZone);
        };

        /// Advances to the specified day of the week and and returns the resulting new `LocalDateTime` value.
        /// If the `LocalDateTime` value is already on the specified day of the week, the `LocalDateTime` value is cloned and returned unchanged
        /// Will trap if the resulting components are invalid.
        ///
        /// ```motoko include=import
        /// let d : LocalDateTime = ...;
        /// let dayOfWeek : LocalDateTime.DayOfWeek = ...;
        /// let options : LocalDateTime.AdvanceDayOfWeekOptions = {
        ///     addWeekOnMatchingDay = true; // Add a week if the day of the week is the same
        ///     resetToStartOfDay = true; // Set the time value to midnight of the specified day of week
        /// };
        /// let newD : LocalDateTime = d.advanceToDayOfWeek(dayOfWeek);
        /// ```
        public func advanceToDayOfWeek(dayOfWeek : DayOfWeek, options : AdvanceDayOfWeekOptions) : LocalDateTime {
            let newDateComponents = InternalComponents.advanceToDayOfWeek(components, dayOfWeek, options);
            let newComponents = if (not options.resetToStartOfDay) {
                {
                    newDateComponents with
                    hour = components.hour;
                    minute = components.minute;
                    nanosecond = components.nanosecond;
                };
            } else {
                { newDateComponents with hour = 0; minute = 0; nanosecond = 0 };
            };
            LocalDateTime(newComponents, timeZone);
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
    /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
    /// let now : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
    /// ```
    public func now(timeZone : TimeZone) : LocalDateTime {
        return fromTime(Time.now(), timeZone);
    };

    /// Creates a `LocalDateTime` from a `DateTime.DateTime` value and a timezone.
    ///
    /// ```motoko include=import
    /// let dateTime : DateTime.DateTime = DateTime.now();
    /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
    /// let localDateTime : LocalDateTime.LocalDateTime = LocalDateTime.fromDateTime(dateTime, timeZone);
    /// ```
    public func fromDateTime(dateTime : DateTime.DateTime, timeZone : TimeZone) : LocalDateTime {
        let time = dateTime.toTime();
        fromTime(time, timeZone);
    };

    /// Creates a `LocalDateTime` from a `Time.Time` (nanoseconds since epoch) value and a timezone.
    /// (Same functionality as LocalDateTime constructor)
    /// The timezone will not change the components value, so the components will reprsent the local time rather than the UTC time.
    /// The `Components` must be valid, otherwise the function will trap.
    ///
    /// ```motoko include=import
    /// let nanoseconds : Time.Time = Time.now();
    /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
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
    /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
    /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
    /// let dateTimeText : Text = LocalDateTime.toText(dateTime);
    /// ```
    public func toText(dateTime : LocalDateTime) : Text {
        dateTime.toText();
    };

    /// Formats the `LocalDateTime` as Text value using the given format.
    ///
    /// Formats:
    /// - `#iso` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)
    /// - `#custom` - Custom format using momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
    ///
    /// ```motoko include=import
    /// let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
    /// let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
    /// let dateTimeText : Text = DateTime.toTextFormatted(datetime, #iso);
    /// ```
    public func toTextFormatted(dateTime : LocalDateTime, format : TextFormat) : Text {
        dateTime.toTextFormatted(format);
    };

    /// Parses the Text value as a `LocalDateTime` using the given format. Converts to local timezone.
    /// Returns null if the Text value is invalid.
    /// Treats the Text value as local timezone if no timezone is specified.
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
        _ : TimeZone.TimeZone,
    ) : ?LocalDateTime {
        fromTextInternal(text, format, #fixed(#seconds(0)), null);
    };

    /// Parses the Text value as a `LocalDateTime` using the given format and locale. Converts to local timezone.
    /// Returns null if the Text value is invalid.
    /// Treats the Text value as local timezone if no timezone is specified.
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
    /// let ?dateTime : ?LocalDateTime.LocalDateTime = LocalDateTime.fromTextLocalized(dateTimeText, format, locale, defaultTimeZone) else return #error("Invalid date");
    /// ```
    public func fromTextLocalized(
        text : Text,
        format : Text,
        localTimeZone : TimeZone.TimeZone,
        locale : Locale,
    ) : ?LocalDateTime {
        fromTextInternal(text, format, localTimeZone, ?locale);
    };

    private func fromTextInternal(
        text : Text,
        format : Text,
        localTimeZone : TimeZone.TimeZone,
        locale : ?Locale,
    ) : ?LocalDateTime {
        do ? {
            let { components; timeZoneDescriptor } = Components.fromText(text, format, locale)!;
            let timeZone : TimeZone = switch (timeZoneDescriptor) {
                case (#utc) TimeZone.utc();
                case (#fixed(f)) #fixed(f);
                case (#unspecified) localTimeZone;
                case (#name(n)) Debug.trap("Timezone abbreviation parsing is not supported");
            };
            LocalDateTime(components, timeZone).withTimeZone(localTimeZone);
        };
    };

};
