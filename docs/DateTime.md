# DateTime
This module provides a set of functions for working with DateTime values.

Import from the base library to use this module.
```motoko name=import
import DateTime "mo:datetime/DateTime";
import Components "mo:datetime/Components";
import Time "mo:base/Time";
```

## Type `Duration`
``` motoko no-repl
type Duration = InternalTypes.Duration
```


## Type `TextFormat`
``` motoko no-repl
type TextFormat = InternalTypes.TextFormat
```


## Type `DateTime`
``` motoko no-repl
type DateTime = InternalTypes.DateTime
```


## Function `DateTime`
``` motoko no-repl
func DateTime(time : Time.Time) : DateTime
```

Creates an instance of the `DateTime` type from a `Time.Time` value.

```motoko include=import
let nowTime : Time.Time = Time.now();
let nowDateTime : DateTime.DateTime = DateTime(time);
```

## Function `equal`
``` motoko no-repl
func equal(a : DateTime, b : DateTime) : Bool
```

Checks the equality of two `DateTime` values.

```motoko include=import
let a : DateTime.DateTime = ...;
let b : DateTime.DateTime = ...;
let equal : Bool = DateTime.equal(a, b);
```

## Function `compare`
``` motoko no-repl
func compare(a : DateTime, b : DateTime) : Order.Order
```

Compares two `DateTime` values and returns their order.

```motoko include=import
let a : DateTime.DateTime = ...;
let b : DateTime.DateTime = ...;
let order : Order.Order = DateTime.compare(a, b);
```

## Function `now`
``` motoko no-repl
func now() : DateTime
```

Creates a `DateTime` for the current time

```motoko include=import
let now : DateTime.DateTime = DateTime.now();
```

## Function `fromTime`
``` motoko no-repl
func fromTime(nanoseconds : Time.Time) : DateTime
```

Creates a `DateTime` from a `Time.Time` (nanoseconds since epoch) value.
(Same functionality as DateTime constructor)

```motoko include=import
let nanoseconds : Time.Time = Time.now();
let dateTime : DateTime.DateTime = DateTime.fromTime(nanoseconds);
```

## Function `fromComponents`
``` motoko no-repl
func fromComponents(components : Components) : DateTime
```

Creates a `DateTime` from a `Components` value.
Returns null if the `Components` value is invalid.

```motoko include=import
let components : Components.Components = ...;
let ?dateTime : ?DateTime.DateTime = DateTime.fromComponents(components) else return #error("Invalid date");
```

## Function `toText`
``` motoko no-repl
func toText(dateTime : DateTime) : Text
```

Formats the `DateTime` as Text value using the ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)

```motoko include=import
let dateTime : DateTime.DateTime = DateTime.now();
let dateTimeText : Text = DateTime.toText(dateTime);
```

## Function `toTextAdvanced`
``` motoko no-repl
func toTextAdvanced(dateTime : DateTime, format : TextFormat) : Text
```

Formats the `DateTime` as Text value using the given format.

Formats:
- `#iso` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
- `#custom` - Custom format using momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)

```motoko include=import
let dateTime : DateTime.DateTime = DateTime.now();
let dateTimeText : Text = DateTime.toTextFormatted(datetime, #iso);
```

## Function `fromText`
``` motoko no-repl
func fromText(text : Text, format : Text) : ?DateTime
```

Parses the Text value as a `DateTime` using the given format. Converts to UTC from parsed timezone offset.
Returns null if the Text value is invalid.
Treats the Text value as UTC if no timezone is specified.
Format uses momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)
Will trap if locale is null and the format contains locale specific tokens.
Note: If you need to parse a localized date, use `DateTime.fromTextLocalized` instead.

```motoko include=import
let date = "2020-01-01T00:00:00Z";
let format = "YYYY-MM-DDTHH:mm:ssZ";
let ?dateTime : ?DateTime.DateTime = DateTime.fromText(dateTimeText, format) else return #error("Invalid date");
```

## Function `fromTextLocalized`
``` motoko no-repl
func fromTextLocalized(text : Text, format : Text, locale : Locale, localTimeZone : TimeZone.TimeZone) : ?DateTime
```

Parses the Text value as a `DateTime` using the given format and locale. Converts to UTC from parsed timezone offset.
Returns null if the Text value is invalid.
Treats the Text value as local timezone if no timezone is specified..
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
let ?dateTime : ?DateTime.DateTime = DateTime.fromTextLocalized(dateTimeText, format, locale, defaultTimeZone) else return #error("Invalid date");
```
