/// This module provides a set of functions for working with datetime component values.
///
/// Import from the base library to use this module.
/// ```motoko name=import
/// import Components "mo:datetime/Components";
/// ```

import Types "Types";
import InternalComponents "../internal/Components";
import Time "mo:base/Time";
import Text "mo:base/Text";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Components "../internal/Components";
import Order "mo:base/Order";

module {

    public type Components = Types.Components;
    public type DateComponents = Types.DateComponents;
    public type DayOfWeek = Types.DayOfWeek;
    public type DateTime = Types.DateTime;
    public type LocalDateTime = Types.LocalDateTime;
    public type TimeZone = Types.TimeZone;
    public type Duration = Types.Duration;
    public type TextFormat = Types.TextFormat;
    public type FromTextResult = Types.FromTextResult;
    public type TimeZoneDescriptor = Types.TimeZoneDescriptor;
    public type Locale = Types.Locale;
    public type AdvanceDayOfWeekOptions = Types.AdvanceDayOfWeekOptions;

    /// Returns the the epoch (1970-01-01T00:00:00Z) in component form
    ///
    /// ```motoko include=import
    /// let epoch : Components.Components = Components.epoch;
    /// ```
    public let epoch : Components = InternalComponents.epoch;

    /// Compares two components, returning the order between them.
    /// Will trap if either of the components are invalid
    ///
    /// ```motoko include=import
    /// let c1 : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let c2 : Components.Components = {year = 2020; month = 2; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let ?order : ?Order.Order = Components.compare(c1, c2) else return #error("One or both components are invalid");
    /// ```
    public func compare(c1 : Components, c2 : Components) : Order.Order {
        let t1 = toTime(c1);
        let t2 = toTime(c2);
        Int.compare(t1, t2);
    };

    /// Converts the components to the equivalent UTC time in nanoseconds since the epoch.
    /// Will return null if the components are invalid
    ///
    /// ```motoko include=import
    /// let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let ?order : ?Time.Time = Components.toTime(c) else return #error("Components are invalid");
    /// ```
    public func toTime(components : Components) : Time.Time {
        InternalComponents.toTime(components);
    };

    /// Converts the UTC time in nanoseconds since the epoch to the equivalent components.
    ///
    /// ```motoko include=import
    /// let components : Components.Components = Components.fromTime(123467890);
    /// ```
    public func fromTime(nanoseconds : Int) : Components {
        InternalComponents.fromTime(nanoseconds);
    };

    /// Gets the week year based on the specified components and when the year starts
    /// Will trap if the components are invalid
    /// Note: This is not the same as the calendar year or week of year
    ///
    /// ```motoko include=import
    /// let c : Components.DateComponents = {year = 2020; month = 1; day = 1;};
    /// let weekYear : Int = Components.weekYear(c, #monday, 4);
    /// ```
    public func weekYear(components : DateComponents, firstDayOfWeek : DayOfWeek, firstDayOfYear : Nat) : Int {
        InternalComponents.weekYear(components, firstDayOfWeek, firstDayOfYear);
    };

    /// Gets the week of year based on the specified components and when the year starts
    /// Will trap if the components are invalid
    ///
    /// ```motoko include=import
    /// let c : Components.DateComponents = {year = 2020; month = 1; day = 1;};
    /// let weekOfYear : Nat = Components.weekOfYear(c, #monday, 4);
    /// ```
    public func weekOfYear(components : DateComponents, firstDayOfWeek : DayOfWeek, firstDayOfYear : Nat) : Nat {
        InternalComponents.weekOfYear(components, firstDayOfWeek, firstDayOfYear);
    };

    /// Gets the day of the week based on the specified components.
    /// Will trap if the components are invalid
    ///
    /// ```motoko include=import
    /// let c : Components.DateComponents = {year = 2020; month = 1; day = 1;};
    /// let dayOfWeek : Components.DayOfWeek = Components.dayOfWeek(c);
    /// ```
    public func dayOfWeek(components : DateComponents) : DayOfWeek {
        InternalComponents.dayOfWeek(components);
    };

    /// Gets the day of the year based on the specified components.
    /// Will trap if the components are invalid
    ///
    /// ```motoko include=import
    /// let c : Components.DateComponents = {year = 2020; month = 1; day = 1;};
    /// let dayOfYear : Nat = Components.dayOfYear(c);
    /// ```
    public func dayOfYear(components : DateComponents) : Nat {
        InternalComponents.dayOfYear(components);
    };

    /// Checks if the specified components are valid.
    /// Checks that the day is valid for the month and year, and that the time is valid.
    /// Returns true if the components are valid, false otherwise.
    ///
    /// ```motoko include=import
    /// let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let isValid : Bool = Components.isValid(c);
    /// ```
    public func isValid(components : Components) : Bool {
        InternalComponents.isValid(components);
    };

    /// Converts datetime components to text in ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
    ///
    /// ```motoko include=import
    /// let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let text : Text = Components.toText(c, TimeZone.utc());
    /// ```
    public func toText(components : Components, timeZone : TimeZone) : Text {
        toTextFormatted(components, timeZone, #iso);
    };

    /// Converts datetime components to the specified text format.
    ///
    /// Formats:
    /// - `#iso` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
    /// - `#custom` - Custom format using momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
    ///
    /// ```motoko include=import
    /// let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let text : Text = Components.toTextFormatted(c, #iso, TimeZone.utc());
    /// ```
    public func toTextFormatted(
        components : Components,
        timeZone : TimeZone,
        format : Types.TextFormat,
    ) : Text {
        InternalComponents.toTextFormatted(components, timeZone, format);
    };

    /// Parses a formatted datetime text into components and timezone with the specified format.
    /// Returns null if the text is not a valid formatted datetime
    /// Locale is only required for formats with locale specific tokens (e.g. month names).
    /// Will throw an exception if locale is null and the format contains locale specific tokens.
    ///
    /// ```motoko include=import
    /// import EN "../iana/locales/EN";
    /// let date = "2020-01-01T00:00:00Z";
    /// let format = "YYYY-MM-DDTHH:mm:ssZ";
    /// let locale = EN.locale; // Optional (only needed if contains locale specific tokens)
    /// let ?result : ?FromTextResult = Components.fromText(date, format, ?locale) else return #error("Invalid datetime text");
    /// ```
    public func fromText(text : Text, format : Text, locale : ?Locale) : ?FromTextResult {
        InternalComponents.fromText(text, format, locale);
    };

    /// Adds a `Duration` to the specified components and returns the resulting new components value.
    ///
    /// ```motoko include=import
    /// let c : Components = ...;
    /// let duration : DateTime.Duration = ...;
    /// let newC : Components = Components.add(c, duration);
    /// ```
    public func add(components : Components, duration : Duration) : Components {
        InternalComponents.add(components, duration);
    };

    /// Adds the specified nanoseconds to the components and returns the resulting components.
    /// Will trap if the resulting components are invalid.
    ///
    /// ```motoko include=import
    /// let c : Components = ...;
    /// let timeToAdd : Time.Time = ...;
    /// let newC : Components = Components.addTime(c, timeToAdd);
    /// ```
    public func addTime(components : Components, nanoseconds : Time.Time) : Components {
        InternalComponents.addTime(components, nanoseconds);
    };

    /// Advances to the specified day of the week and returns the resulting date components.
    /// If the date components are already on the specified day of the week, the date components are cloned and returned unchanged
    /// Will trap if the resulting components are invalid.
    ///
    /// ```motoko include=import
    /// let c : DateComponents = ...;
    /// let dayOfWeek : DateTime.DayOfWeek = ...;
    /// let options : DateTime.AdvanceDayOfWeekOptions = {
    ///     addWeekOnMatchingDay = true; // Add a week if the day of the week is the same
    /// };
    /// let newC : DateComponents = Components.advanceToDayOfWeek(c, dayOfWeek, options);
    /// ```
    public func advanceToDayOfWeek(components : DateComponents, dayOfWeek : DayOfWeek, options : AdvanceDayOfWeekOptions) : DateComponents {
        InternalComponents.advanceToDayOfWeek(components, dayOfWeek, options);
    };
};
