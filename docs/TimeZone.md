# TimeZone

This module provides a set of functions for working with TimeZone values.

Import from the base library to use this module.

```motoko name=import
import TimeZone "mo:datetime/TimeZone";
import Components "mo:datetime/Components";
```

## Type `TimeZone`

```motoko no-repl
type TimeZone = Types.TimeZone
```

## Type `FixedTimeZone`

```motoko no-repl
type FixedTimeZone = Types.FixedTimeZone
```

## Type `Offset`

```motoko no-repl
type Offset = Types.FixedTimeZone
```

## Type `TimeZoneDescriptor`

```motoko no-repl
type TimeZoneDescriptor = Types.TimeZoneDescriptor
```

## Function `utc`

```motoko no-repl
func utc() : TimeZone
```

Helper function to create a UTC timezone (fixed at UTC+0)

```motoko include=import
let timeZone : TimeZone.TimeZone = TimeZone.utc();
```

## Function `withFixedOffset`

```motoko no-repl
func withFixedOffset(offset : Offset) : TimeZone
```

Helper function to create a timezone with a fixed offset like UTC+3

```motoko include=import
let timeZone : TimeZone.TimeZone = TimeZone.withFixedOffset(#hours(3)); // UTC+3
```

## Function `toOffsetSeconds`

```motoko no-repl
func toOffsetSeconds(timeZone : TimeZone, components : Components) : Int
```

Gets the UTC offset in seconds for the specified components and time zone.
The components are used if the timezone is dynamic. This is due to the timezone offset
being dependent on the date (daylight savings, changes to timezone offset, etc...).

```motoko include=import
let timeZone : TimeZone.TimeZone = ...;
let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
let offsetSeconds : Int = TimeZone.getOffsetSeconds(timeZone, c);
```

## Function `toFixedOffsetSeconds`

```motoko no-repl
func toFixedOffsetSeconds(fixedTimeZone : FixedTimeZone) : Int
```

Gets the UTC offset in seconds for the specified fixed time zone.

```motoko include=import
let timeZone : TimeZone.TimeZone = #fixed(#hours(1));
let offsetSeconds : Int = TimeZone.getFixedOffsetSeconds(timeZone);
```
