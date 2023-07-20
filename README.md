# Funding

This library was originally incentivized by ICDevs. You can view more about the bounty on the forum or website. The bounty was funded by The ICDevs.org commuity and the award paid to @Gekctek. If you use this library and gain value from it, please consider a donation to ICDevs.

# Overview

This is a library that handles DateTime creation, modification, parsing, and formatting.

See full [API documentation here](./docs/index.md)

# Package installation

## MOPS

### CLI

Run `mops install datetime`

### Or manually:

Modify the `mops.toml` file to add:

```
[dependencies]
datetime = "{version}"
```

where `{version}` is the version number you want to use

See detailed MOPS documentation [here](https://mops.one/docs/install)

# Quickstart

## Types Overview

- `DateTime` - A type that represents a UTC date and time. Has no context of local timezones (just UTC) and should be used as the default type unless timezones are required.
- `LocalDateTime` - A type that represents a local date and time. Has context of local timezone and is more complicated than `DateTime`.
- `Components` - A more general concept of a date and time. Does not have context of timezones and is not an 'instance in time' like `DateTime` and `LocalDateTime`. It is useful for storing of date and time information and can be used to construct `DateTime` and `LocalDateTime` types.
- `TimeZone` - A type that represents either a fixed offset (e.g. UTC+3) or a named IANA timezone (e.g. America/New_York).
- `IanaTimeZone` - An implementation of `TimeZone` that represents a named IANA timezone.

## From Time

```motoko
import DateTime "mo:datetime/DateTime";
let time = 123_456_789_000_000; // Nano seconds since epoch
let date = DateTime(time);
```

## From Text

```motoko
import DateTime "mo:datetime/DateTime";
let text = "2020-02-01T00:00:00Z;
let format = "YYYY-MM-DDTHH:mm:ssZ";
let ?date = DateTime.fromText(text, format) else return #error("Failed to parse datetime");
```

## From Components

```motoko

import DateTime "mo:datetime/DateTime";
let components = {
  year = 2020;
  month = 2;
  day = 1;
  hour = 0;
  minute = 0;
  nanosecond = 0;
};
let date = DateTime.fromComponents(components);
```

## Manipulation

```motoko
import DateTime "mo:datetime/DateTime";
let date = DateTime.now();
// Can chain multiple calls together
date.add(#seconds(-1)).add(#minutes(2)).add(#hours(-3)).add(#days(4)).add(#months(-5)).add(#years(6));
```

## TimeZone

### Fixed

```motoko
let fixedTimeZone = #fixed(#hours(-7));
```

### Dynamic/IANA

Location based timezones that change with daylights savings

```motoko
// For specific timezones, can just reference directly
// NOTE: This method is preferred as it is more efficient as it only loads the timezone data for the specific timezone

import AmericaTimeZones "../iana/timezones/America";
let pstTimeZone = IanaTimeZone(AmericaTimeZones.Los_Angeles.data);
```

OR

```motoko
// For timezone lookup
// NOTE: This method requires loading in all the timezones and will cause a larger canister size

import TimeZoneFinder "../iana/TimeZoneFinder";
let timeZone = TimeZoneFinder.find("America/Los_Angeles");
```

## LocalDateTime

```motoko
import LocalDateTime "mo:datetime/LocalDateTime";
let components = {
  year = 2020;
  month = 2;
  day = 1;
  hour = 0;
  minute = 0;
  nanosecond = 0;
};
let timeZone = #fixed(#hours(-7));
LocalDateTime(components, timeZone);
```

# First time setup

To build the library, the `MOPS` library must be installed. It is used to pull down packages and running tests.

MOPS install instructions: https://mops.one/docs/install

# Testing

To run tests, use the `make test` command or run manually with `mops test`.
The tests use MOPS test framework
