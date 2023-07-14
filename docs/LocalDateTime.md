# LocalDateTime
This module provides a set of functions for working with DateTime values with timezone context.

Import from the base library to use this module.
```motoko name=import
import LocalDateTime "mo:datetime/LocalDateTime";
import Components "mo:datetime/Components";
import Time "mo:base/Time";
```

## Type `DynamicTimeZone`
``` motoko no-repl
type DynamicTimeZone = InternalTypes.DynamicTimeZone
```


## Type `TimeZone`
``` motoko no-repl
type TimeZone = InternalTypes.TimeZone
```


## Type `Components`
``` motoko no-repl
type Components = InternalTypes.Components
```


## Type `LocalDateTime`
``` motoko no-repl
type LocalDateTime = InternalTypes.LocalDateTime
```


## Type `TextFormat`
``` motoko no-repl
type TextFormat = InternalTypes.TextFormat
```


## Type `Duration`
``` motoko no-repl
type Duration = InternalTypes.Duration
```


## Function `LocalDateTime`
``` motoko no-repl
func LocalDateTime(components : Components, timeZone : TimeZone) : LocalDateTime
```

Creates an instance of the `LocalDateTime` type from a `Components` and a timezone.
The timezone will not change the components value, so the components will reprsent the local time rather than the UTC time.
The `Components` must be valid, otherwise the function will trap.

```motoko include=import
let localComponents : Components.Components = ...;
let timeZone : TimeZone.TimeZone = #fixed(#hours(3))); // UTC+3
let localDateTime : LocalDateTime.LocalDateTime = LocalDateTime(localComponents, timeZone);
```

## Function `equal`
``` motoko no-repl
func equal(a : LocalDateTime, b : LocalDateTime) : Bool
```

Checks the equality of two `LocalDateTime` values.

```motoko include=import
let a : LocalDateTime.LocalDateTime = ...;
let b : LocalDateTime.LocalDateTime = ...;
let equal : Bool = LocalDateTime.equal(a, b);
```

## Function `compare`
``` motoko no-repl
func compare(a : LocalDateTime, b : LocalDateTime) : Order.Order
```

Compares two `LocalDateTime` values and returns their order.

```motoko include=import
let a : LocalDateTime.LocalDateTime = ...;
let b : LocalDateTime.LocalDateTime = ...;
let order : Order.Order = DateTime.compare(a, b);
```

## Function `now`
``` motoko no-repl
func now(timeZone : TimeZone) : LocalDateTime
```

Creates a `LocalDateTime` for the current time

```motoko include=import
let timeZone : TimeZone.TimeZone = #fixed(#hours(3))); // UTC+3
let now : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
```

## Function `fromTime`
``` motoko no-repl
func fromTime(nanoseconds : Time.Time, timeZone : TimeZone) : LocalDateTime
```

Creates a `LocalDateTime` from a `Time.Time` (nanoseconds since epoch) value and a timezone.
(Same functionality as LocalDateTime constructor)
The timezone will not change the components value, so the components will reprsent the local time rather than the UTC time.
The `Components` must be valid, otherwise the function will trap.

```motoko include=import
let nanoseconds : Time.Time = Time.now();
let timeZone : TimeZone.TimeZone = #fixed(#hours(3))); // UTC+3
let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.fromTime(nanoseconds, timeZone);
```

## Function `fromComponents`
``` motoko no-repl
func fromComponents(components : Components, timeZone : TimeZone) : ?LocalDateTime
```

Creates a `LocalDateTime` from a `Components` value and a timezone.
Returns null if the `Components` value is invalid.

```motoko include=import
let components : Components.Components = ...;
let ?dateTime : ?DateTime.DateTime = DateTime.fromComponents(components) else return #error("Invalid date");
```

## Function `toText`
``` motoko no-repl
func toText(dateTime : LocalDateTime) : Text
```

Formats the `LocalDateTime` as Text value using the ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)

```motoko include=import
let timeZone : TimeZone.TimeZone = #fixed(#hours(3))); // UTC+3
let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
let dateTimeText : Text = LocalDateTime.toText(dateTime);
```

## Function `toTextFormatted`
``` motoko no-repl
func toTextFormatted(dateTime : LocalDateTime, format : TextFormat) : Text
```

Formats the `LocalDateTime` as Text value using the given format.

Formats:
- `#iso` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)
- `#custom` - Custom format using momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)

```motoko include=import
let timeZone : TimeZone.TimeZone = #fixed(#hours(3))); // UTC+3
let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
let dateTimeText : Text = DateTime.toTextFormatted(datetime, #iso);
```

## Function `fromTextFormatted`
``` motoko no-repl
func fromTextFormatted(text : Text, format : Text, locale : ?Locale, timeZoneNameParser : (Text) -> ?TimeZone.TimeZone, defaultTimeZone : TimeZone.TimeZone) : ?LocalDateTime
```

Parses the Text value as a `LocalDateTime` using the given format.
Returns null if the Text value is invalid.
Uses the default time zone if no timezone is specified in the text.
Format uses momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
Locale is only required for formats with locale specific tokens (e.g. month names).
Will trap if locale is null and the format contains locale specific tokens.

```motoko include=import
let date = "2020-01-01T00:00:00";
let format = "YYYY-MM-DDTHH:mm:ss";
let locale = null; // TODO
let timeZoneNameParser = null; // TODO
let defaultTimeZone = #fixed(#hours(3))); // UTC+3
let ?dateTime : ?DateTime.DateTime = DateTime.fromTextFormatted(dateTimeText, format, locale, timeZoneParser) else return #error("Invalid date");
```
