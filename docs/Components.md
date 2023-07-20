# Components
This module provides a set of functions for working with datetime component values.

Import from the base library to use this module.
```motoko name=import
import Components "mo:datetime/Components";
```

## Type `Components`
``` motoko no-repl
type Components = InternalTypes.Components
```


## Type `DateComponents`
``` motoko no-repl
type DateComponents = InternalTypes.DateComponents
```


## Type `DayOfWeek`
``` motoko no-repl
type DayOfWeek = InternalTypes.DayOfWeek
```


## Type `DateTime`
``` motoko no-repl
type DateTime = InternalTypes.DateTime
```


## Type `LocalDateTime`
``` motoko no-repl
type LocalDateTime = InternalTypes.LocalDateTime
```


## Type `TimeZone`
``` motoko no-repl
type TimeZone = InternalTypes.TimeZone
```


## Type `Duration`
``` motoko no-repl
type Duration = InternalTypes.Duration
```


## Type `TextFormat`
``` motoko no-repl
type TextFormat = InternalTypes.TextFormat
```


## Type `FromTextResult`
``` motoko no-repl
type FromTextResult = InternalTypes.FromTextResult
```


## Type `TimeZoneDescriptor`
``` motoko no-repl
type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor
```


## Type `Locale`
``` motoko no-repl
type Locale = InternalTypes.Locale
```


## Value `epoch`
``` motoko no-repl
let epoch : Components
```

Returns the the epoch (1970-01-01T00:00:00Z) in component form

```motoko include=import
let epoch : Components.Components = Components.epoch;
```

## Function `compare`
``` motoko no-repl
func compare(c1 : Components, c2 : Components) : Order.Order
```

Compares two components, returning the order between them.
Will trap if either of the components are invalid

```motoko include=import
let c1 : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
let c2 : Components.Components = {year = 2020; month = 2; day = 1; hour = 0; minute = 0; nanosecond = 0};
let ?order : ?Order.Order = Components.compare(c1, c2) else return #error("One or both components are invalid");
```

## Function `toTime`
``` motoko no-repl
func toTime(components : Components) : Time.Time
```

Converts the components to the equivalent UTC time in nanoseconds since the epoch.
Will return null if the components are invalid

```motoko include=import
let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
let ?order : ?Time.Time = Components.toTime(c) else return #error("Components are invalid");
```

## Function `fromTime`
``` motoko no-repl
func fromTime(nanoseconds : Int) : Components
```

Converts the UTC time in nanoseconds since the epoch to the equivalent components.

```motoko include=import
let components : Components.Components = Components.fromTime(123467890);
```

## Function `weekYear`
``` motoko no-repl
func weekYear(components : DateComponents, firstDayOfWeek : DayOfWeek, firstDayOfYear : Nat) : Int
```

Gets the week year based on the specified components and when the year starts
Will trap if the components are invalid
Note: This is not the same as the calendar year or week of year

```motoko include=import
let c : Components.DateComponents = {year = 2020; month = 1; day = 1;};
let weekYear : Int = Components.weekYear(c, #monday, 4);
```

## Function `weekOfYear`
``` motoko no-repl
func weekOfYear(components : DateComponents, firstDayOfWeek : DayOfWeek, firstDayOfYear : Nat) : Nat
```

Gets the week of year based on the specified components and when the year starts
Will trap if the components are invalid

```motoko include=import
let c : Components.DateComponents = {year = 2020; month = 1; day = 1;};
let weekOfYear : Nat = Components.weekOfYear(c, #monday, 4);
```

## Function `dayOfWeek`
``` motoko no-repl
func dayOfWeek(components : DateComponents) : DayOfWeek
```

Gets the day of the week based on the specified components.
Will trap if the components are invalid

```motoko include=import
let c : Components.DateComponents = {year = 2020; month = 1; day = 1;};
let dayOfWeek : Components.DayOfWeek = Components.dayOfWeek(c);
```

## Function `dayOfYear`
``` motoko no-repl
func dayOfYear(components : DateComponents) : Nat
```

Gets the day of the year based on the specified components.
Will trap if the components are invalid

```motoko include=import
let c : Components.DateComponents = {year = 2020; month = 1; day = 1;};
let dayOfYear : Nat = Components.dayOfYear(c);
```

## Function `isValid`
``` motoko no-repl
func isValid(components : Components) : Bool
```

Checks if the specified components are valid.
Checks that the day is valid for the month and year, and that the time is valid.
Returns true if the components are valid, false otherwise.

```motoko include=import
let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
let isValid : Bool = Components.isValid(c);
```

## Function `toText`
``` motoko no-repl
func toText(components : Components, timeZone : TimeZone) : Text
```

Converts datetime components to text in ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)

```motoko include=import
let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
let text : Text = Components.toText(c, TimeZone.utc());
```

## Function `toTextFormatted`
``` motoko no-repl
func toTextFormatted(components : Components, timeZone : TimeZone, format : InternalTypes.TextFormat) : Text
```

Converts datetime components to the specified text format.

Formats:
- `#iso` - ISO 8601 format (e.g. `2021-01-01T00:00:00.000000000Z`)
- `#custom` - Custom format using momentjs format (e.g. `YYYY-MM-DDTHH:mm:ssZ`)

```motoko include=import
let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
let text : Text = Components.toTextFormatted(c, #iso, TimeZone.utc());
```

## Function `fromText`
``` motoko no-repl
func fromText(text : Text, format : Text, locale : ?Locale) : ?FromTextResult
```

Parses a formatted datetime text into components and timezone with the specified format.
Returns null if the text is not a valid formatted datetime
Locale is only required for formats with locale specific tokens (e.g. month names).
Will throw an exception if locale is null and the format contains locale specific tokens.

```motoko include=import
import EN "../iana/locales/EN";
let date = "2020-01-01T00:00:00Z";
let format = "YYYY-MM-DDTHH:mm:ssZ";
let locale = EN.locale; // Optional (only needed if contains locale specific tokens)
let ?result : ?FromTextResult = Components.fromText(date, format, ?locale) else return #error("Invalid datetime text");
```

## Function `addTime`
``` motoko no-repl
func addTime(components : Components, nanoseconds : Time.Time) : Components
```

Adds the specified nanoseconds to the components and returns the resulting components.
Will trap if the resulting components are invalid.

```motoko include=import
let c : Components = ...;
let timeToAdd : Time.Time = ...;
let newC : Components = Components.addTime(c, timeToAdd);
```
