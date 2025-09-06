/// This module provides a set of functions for working with TimeZone values.
///
/// Import from the base library to use this module.
/// ```motoko name=import
/// import TimeZone "mo:datetime/TimeZone";
/// import Components "mo:datetime/Components";
/// ```

import Types "Types";
import InternalTimeZone "../internal/TimeZone";
import Int "mo:core@1/Int";
import Text "mo:core@1/Text";
import Nat "mo:core@1/Nat";
import Debug "mo:core@1/Debug";
import Components "../internal/Components";
module {

  public type TimeZone = Types.TimeZone;
  public type FixedTimeZone = Types.FixedTimeZone;
  public type Offset = Types.FixedTimeZone;
  public type TimeZoneDescriptor = Types.TimeZoneDescriptor;
  type Components = Types.Components;

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
  /// being dependent on the date (daylight savings, changes to timezone offset, etc...).
  ///
  /// ```motoko include=import
  /// let timeZone : TimeZone.TimeZone = ...;
  /// let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
  /// let offsetSeconds : Int = TimeZone.getOffsetSeconds(timeZone, c);
  /// ```
  public func toOffsetSeconds(timeZone : TimeZone, components : Components) : Int {
    InternalTimeZone.toOffsetSeconds(timeZone, components);
  };

  /// Gets the UTC offset in seconds for the specified fixed time zone.
  ///
  /// ```motoko include=import
  /// let timeZone : TimeZone.TimeZone = #fixed(#hours(1));
  /// let offsetSeconds : Int = TimeZone.getFixedOffsetSeconds(timeZone);
  /// ```
  public func toFixedOffsetSeconds(fixedTimeZone : FixedTimeZone) : Int {
    InternalTimeZone.toFixedOffsetSeconds(fixedTimeZone);
  };
};
