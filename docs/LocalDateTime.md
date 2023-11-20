# LocalDateTime

This module provides a set of functions for working with DateTime values with timezone context.

Import from the base library to use this module.

```motoko name=import
import LocalDateTime "mo:datetime/LocalDateTime";
import Components "mo:datetime/Components";
import Time "mo:base/Time";
```

## Type `DynamicTimeZone`

```motoko no-repl
type DynamicTimeZone = Types.DynamicTimeZone
```

## Type `TimeZone`

```motoko no-repl
type TimeZone = Types.TimeZone
```

## Type `Components`

```motoko no-repl
type Components = Types.Components
```

## Type `LocalDateTime`

```motoko no-repl
type LocalDateTime = Types.LocalDateTime
```

## Type `TextFormat`

```motoko no-repl
type TextFormat = Types.TextFormat
```

## Type `Duration`

```motoko no-repl
type Duration = Types.Duration
```

## Function `LocalDateTime`

```motoko no-repl
func LocalDateTime(components : Components, localTimeZone : TimeZone) : LocalDateTime
```

Creates an instance of the `LocalDateTime` type from a `Components` and a timezone.
The timezone will not change the components value, so the components will reprsent the local time rather than the UTC time.
The `Components` must be valid, otherwise the function will trap.

```motoko include=import
let localComponents : Components.Components = ...;
let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
let localDateTime : LocalDateTime.LocalDateTime = LocalDateTime(localComponents, timeZone);
```

## Function `equal`

```motoko no-repl
func equal(a : LocalDateTime, b : LocalDateTime) : Bool
```

Checks the equality of two `LocalDateTime` values.

```motoko include=import
let a : LocalDateTime.LocalDateTime = ...;
let b : LocalDateTime.LocalDateTime = ...;
let equal : Bool = LocalDateTime.equal(a, b);
```

## Function `compare`

```motoko no-repl
func compare(a : LocalDateTime, b : LocalDateTime) : Order.Order
```

Compares two `LocalDateTime` values and returns their order.

```motoko include=import
let a : LocalDateTime.LocalDateTime = ...;
let b : LocalDateTime.LocalDateTime = ...;
let order : Order.Order = DateTime.compare(a, b);
```

## Function `now`

```motoko no-repl
func now(timeZone : TimeZone) : LocalDateTime
```

Creates a `LocalDateTime` for the current time

```motoko include=import
let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
let now : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
```

## Function `fromDateTime`

```motoko no-repl
func fromDateTime(dateTime : DateTime.DateTime, timeZone : TimeZone) : LocalDateTime
```

Creates a `LocalDateTime` from a `DateTime.DateTime` value and a timezone.

```motoko include=import
let dateTime : DateTime.DateTime = DateTime.now();
let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
let localDateTime : LocalDateTime.LocalDateTime = LocalDateTime.fromDateTime(dateTime, timeZone);
```

## Function `fromTime`

```motoko no-repl
func fromTime(nanoseconds : Time.Time, timeZone : TimeZone) : LocalDateTime
```

Creates a `LocalDateTime` from a `Time.Time` (nanoseconds since epoch) value and a timezone.
(Same functionality as LocalDateTime constructor)
The timezone will not change the components value, so the components will reprsent the local time rather than the UTC time.
The `Components` must be valid, otherwise the function will trap.

```motoko include=import
let nanoseconds : Time.Time = Time.now();
let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.fromTime(nanoseconds, timeZone);
```

## Function `fromComponents`

```motoko no-repl
func fromComponents(components : Components, timeZone : TimeZone) : ?LocalDateTime
```

Creates a `LocalDateTime` from a `Components` value and a timezone.
Returns null if the `Components` value is invalid.

```motoko include=import
let components : Components.Components = ...;
let ?dateTime : ?DateTime.DateTime = DateTime.fromComponents(components) else return #error("Invalid date");
```

## Function `toText`

```motoko no-repl
func toText(dateTime : LocalDateTime) : Text
```

Formats the `LocalDateTime` as Text value using the ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)

```motoko include=import
let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
let dateTimeText : Text = LocalDateTime.toText(dateTime);
```

## Function `toTextFormatted`

```motoko no-repl
func toTextFormatted(dateTime : LocalDateTime, format : TextFormat) : Text
```

Formats the `LocalDateTime` as Text value using the given format.

Formats:

- `#iso` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000+03:00`)
- `#custom` - Custom format using momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)

```motoko include=import
let timeZone : TimeZone.TimeZone = #fixed(#hours(3)); // UTC+3
let dateTime : LocalDateTime.LocalDateTime = LocalDateTime.now(timeZone);
let dateTimeText : Text = DateTime.toTextFormatted(datetime, #iso);
```

## Function `fromText`

```motoko no-repl
func fromText(text : Text, format : Text, localTimeZone : TimeZone.TimeZone) : ?LocalDateTime
```

Parses the Text value as a `LocalDateTime` using the given format. Converts to local timezone.
Returns null if the Text value is invalid.
Treats the Text value as local timezone if no timezone is specified.
Format uses momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
Will trap if locale is null and the format contains locale specific tokens.
Note: If you need to parse a localized date, use `DateTime.fromTextLocalized` instead.

```motoko include=import
let date = "2020-01-01T00:00:00Z";
let format = "YYYY-MM-DDTHH:mm:ssZ";
let ?dateTime : ?DateTime.DateTime = DateTime.fromText(dateTimeText, format) else return #error("Invalid date");
```

## Function `fromTextLocalized`

```motoko no-repl
func fromTextLocalized(text : Text, format : Text, localTimeZone : TimeZone.TimeZone, locale : Locale) : ?LocalDateTime
```

Parses the Text value as a `LocalDateTime` using the given format and locale. Converts to local timezone.
Returns null if the Text value is invalid.
Treats the Text value as local timezone if no timezone is specified.
Format uses momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
Locale is only required for formats with locale specific tokens (e.g. month names).
Will trap if locale is null and the format contains locale specific tokens.
Will trap if timezone abbreviation is used (e.g. PST), only use offset (e.g. -08:00)

```motoko include=import
import EN "../iana/locales/EN";
import AmericaTimeZones "../iana/timezones/America";
let date = "Sun, Mar 9, 2008";
let format = "ddd, MMM D, YYYY";
let localTimeZone = AmericaTimeZones.Los_Angeles.data;
let locale = EN.locale;
let ?dateTime : ?LocalDateTime.LocalDateTime = LocalDateTime.fromTextLocalized(dateTimeText, format, locale, defaultTimeZone) else return #error("Invalid date");
```

## Function `fromTextInternal`

```motoko no-repl
func fromTextInternal(text : Text, format : Text, localTimeZone : TimeZone.TimeZone, locale : ?Locale) : ?LocalDateTime
```
