/// This module provides a set of functions for working with datetime component values.
///
/// Import from the base library to use this module.
/// ```motoko name=import
/// import Components "mo:datetime/Components";
/// ```

import InternalTypes "../internal/Types";
import InternalNumberUtil "../internal/NumberUtil";
import InternalComponents "../internal/Components";
import InternalTimeZone "../internal/TimeZone";
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
import Prelude "mo:base/Prelude";

module {

    public type Components = InternalTypes.Components;
    public type DateComponents = InternalTypes.DateComponents;
    public type DayOfWeek = InternalTypes.DayOfWeek;
    public type DateTime = InternalTypes.DateTime;
    public type LocalDateTime = InternalTypes.LocalDateTime;
    public type TimeZone = InternalTypes.TimeZone;
    public type Duration = InternalTypes.Duration;
    public type TextFormat = InternalTypes.TextFormat;
    public type FromTextResult = InternalTypes.FromTextResult;
    public type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor;
    public type Locale = InternalTypes.Locale;

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

    /// Gets the day of the week based on the specified components.
    /// Will trap if the components are invalid
    ///
    /// ```motoko include=import
    /// let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let dayOfWeek : Components.DayOfWeek = Components.dayOfWeek(c);
    /// ```
    public func dayOfWeek(components : DateComponents) : DayOfWeek {
        InternalComponents.dayOfWeek(components);
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
        toTextFormatted(components, timeZone, #iso8601);
    };

    /// Converts datetime components to the specified text format.
    ///
    /// Formats:
    /// - `#iso8601` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
    ///
    /// ```motoko include=import
    /// let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let text : Text = Components.toTextFormatted(c, #iso8601, TimeZone.utc());
    /// ```
    public func toTextFormatted(
        components : Components,
        timeZone : TimeZone,
        format : InternalTypes.TextFormat,
    ) : Text {
        InternalComponents.toTextFormatted(components, timeZone, format);
    };

    /// Parses a formatted datetime text into components and timezone with the specified format.
    /// Returns null if the text is not a valid formatted datetime
    /// Formats:
    /// - `#iso8601` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
    ///
    /// ```motoko include=import
    /// let ?result : ?FromTextResult = Components.fromTextFormatted("2020-01-01T00:00:00Z", #iso8601) else return #error("Invalid datetime text");
    /// ```
    public func fromTextFormatted(text : Text, format : TextFormat) : ?FromTextResult {
        InternalComponents.fromTextFormatted(text, format);
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
};
