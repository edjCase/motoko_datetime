/// This module provides a set of functions for working with TimeZone values.
///
/// Import from the base library to use this module.
/// ```motoko name=import
/// import TimeZone "mo:datetime/TimeZone";
/// import Components "mo:datetime/Components";
/// ```


import InternalTypes "../internal/Types";
import InternalTimeZone "../internal/TimeZone";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
module {

    public type TimeZone = InternalTypes.TimeZone;
    public type FixedTimeZone = InternalTypes.FixedTimeZone;
    public type Offset = InternalTypes.FixedTimeZone;
    type Components = InternalTypes.Components;
    
    
    /// Helper function to create a UTC timezone (fixed at UTC+0)
    ///
    /// ```motoko include=import
    /// let timeZone : TimeZone.TimeZone = TimeZone.utc();
    /// ```
    public func utc() : TimeZone {
        return #fixed(#seconds(0));
    };
    
    /// Helper function to create a timezone with a fixed offset like UTC+3
    ///
    /// ```motoko include=import
    /// let timeZone : TimeZone.TimeZone = TimeZone.withFixedOffset(#hours(3)); // UTC+3
    /// ```
    public func withFixedOffset(offset : Offset) : TimeZone {
        return #fixed(offset);
    };
    
    /// Gets the UTC offset in seconds for the specified components and time zone.
    /// The components are used if the timezone is dynamic. This is due to the timezone offset
    /// being dependent on the date (daylight savings, changes to locale offset, etc...).
    ///
    /// ```motoko include=import
    /// let timeZone : TimeZone.TimeZone = ...;
    /// let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let offsetSeconds : Int = TimeZone.getOffsetSeconds(timeZone, c);
    /// ```
    public func getOffsetSeconds(timeZone : TimeZone, components : Components) : Int {
        switch (timeZone) {
            case (#fixed(f)) {
                getFixedOffsetSeconds(f);
            };
            case (#dynamic(d)) {
                d.getOffsetSeconds(components);
            };
        };
    };

    /// Gets the UTC offset in seconds for the specified fixed time zone.
    ///
    /// ```motoko include=import
    /// let timeZone : TimeZone.TimeZone = #fixed(#hoursAndMinutes(1, 0));
    /// let offsetSeconds : Int = TimeZone.getFixedOffsetSeconds(timeZone);
    /// ```
    public func getFixedOffsetSeconds(fixedTimeZone: FixedTimeZone) : Int {
        InternalTimeZone.getFixedOffsetSeconds(fixedTimeZone);
    };
};
