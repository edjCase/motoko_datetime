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
    public type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor;

    public type FromTextResult = {
        components : Components;
        timeZoneDescriptor : TimeZoneDescriptor;
    };

    /// Returns the the epoch (1970-01-01T00:00:00Z) in component form
    ///
    /// ```motoko include=import
    /// let epoch : Components.Components = Components.epoch();
    /// ```
    public func epoch() : Components {
        {
            year = 1970;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            nanosecond = 0;
        };
    };

    /// Compares two components, returning the order between them.
    /// Will return null if either of the components are invalid
    ///
    /// ```motoko include=import
    /// let c1 : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let c2 : Components.Components = {year = 2020; month = 2; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let ?order : ?Order.Order = Components.compare(c1, c2) else return #error("One or both components are invalid");
    /// ```
    public func compare(c1 : Components, c2 : Components) : ?Order.Order {
        do ? {
            let t1 = toTime(c1)!;
            let t2 = toTime(c2)!;
            Int.compare(t1, t2);
        };
    };

    /// Compares two components, returning the order between them.
    /// Will trap if either of the components are invalid
    ///
    /// ```motoko include=import
    /// let c1 : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let c2 : Components.Components = {year = 2020; month = 2; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let order : Order.Order = Components.compareOrTrap(c1, c2);
    /// ```
    public func compareOrTrap(c1 : Components, c2 : Components) : Order.Order {
        switch (compare(c1, c2)) {
            case (null) Debug.trap("One or both components are invalid");
            case (?o) o;
        };
    };

    /// Converts the components to the equivalent UTC time in nanoseconds since the epoch.
    /// Will return null if the components are invalid
    ///
    /// ```motoko include=import
    /// let c : Components.Components = {year = 2020; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0};
    /// let ?order : ?Time.Time = Components.toTime(c) else return #error("Components are invalid");
    /// ```
    public func toTime(components : Components) : ?Time.Time {
        InternalComponents.toTime(components);
    };

    /// Converts the UTC time in nanoseconds since the epoch to the equivalent components.
    ///
    /// ```motoko include=import
    /// let components : Components.Components = Components.fromTime(123467890);
    /// ```
    public func fromTime(nanoseconds : Int) : Components {
        addTime(epoch(), nanoseconds);
    };

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
        switch (format) {
            case (#iso8601) fromTextISO8601(text);
            case (#custom(customFormat)) fromTextCustomFormat(text, customFormat);
        };
    };

    private func fromTextCustomFormat(text : Text, customFormat : Text) : ?FromTextResult {
        // TODO
        Prelude.nyi();
    };

    private func fromTextISO8601(text : Text) : ?FromTextResult {
        let iter = Text.toIter(text);
        let ?year = InternalTextUtil.parseNat(iter, 4) else return null;

        if (iter.next() != ?'-') return null;

        let ?month = InternalTextUtil.parseNat(iter, 2) else return null;

        if (iter.next() != ?'-') return null;

        let ?day = InternalTextUtil.parseNat(iter, 2) else return null;

        if (iter.next() != ?'T') return null;

        let ?hour = InternalTextUtil.parseNat(iter, 2) else return null;

        if (iter.next() != ?':') return null;

        let ?minute = InternalTextUtil.parseNat(iter, 2) else return null;

        if (iter.next() != ?':') return null;

        let ?seconds = InternalTextUtil.parseNat(iter, 2) else return null;

        let (nanoseconds : Nat, timezone : ?Text) = switch (iter.next()) {
            case (?'.') {
                let ?ns = InternalTextUtil.parseNat(iter, 9) else return null;
                let tz = InternalTextUtil.readTillEnd(iter, null);
                (ns, tz);
            };
            case (?tzChar) {
                let tz = InternalTextUtil.readTillEnd(iter, ?tzChar);
                (0, tz);
            };
            case (null)(0, null);
        };
        let timeZoneDescriptor : TimeZoneDescriptor = switch (timezone) {
            case (null) #unspecified;
            case (?tz) {
                let ?desc = InternalTimeZone.parseDescriptor(tz) else return null;
                desc;
            };
        };
        let components = {
            year = year;
            month = month;
            day = day;
            hour = hour;
            minute = minute;
            nanosecond = (seconds * 1_000_000_000) + nanoseconds;
        };
        return ?{
            components = components;
            timeZoneDescriptor = timeZoneDescriptor;
        };
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
        if (not isValid(components)) {
            return Debug.trap("Invalid components: " # debug_show (components));
        };
        if (nanoseconds < 0) {
            subtractTime(components, Int.abs(nanoseconds));
        } else if (nanoseconds > 0) {
            addTimeNat(components, Int.abs(nanoseconds));
        } else {
            return components;
        };
    };

    private func subtractTime(components : Components, nanoseconds : Nat) : Components {
        let nanosecondsInAMinute = 60 * 1000000000;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;

        var remainingNanoseconds : Nat = nanoseconds;

        var remainingDays : Nat = remainingNanoseconds / nanosecondsInADay;

        let date = subtractDays(components, remainingDays);
        var newComponents = {
            components with
            year = date.year;
            month = date.month;
            day = date.day;
        };

        remainingNanoseconds -= remainingDays * nanosecondsInADay;

        let removeHours = remainingNanoseconds / nanosecondsInAnHour;
        remainingNanoseconds %= nanosecondsInAnHour;

        newComponents := subtractHours(newComponents, removeHours);

        let removeMinutes = remainingNanoseconds / nanosecondsInAMinute;
        remainingNanoseconds %= nanosecondsInAMinute;

        newComponents := subtractMinutes(newComponents, removeMinutes);

        subtractNanoseconds(newComponents, remainingNanoseconds);
    };

    private func subtractNanoseconds(components : Components, removeNanoseconds : Nat) : Components {
        if (removeNanoseconds == 0) {
            return components;
        };

        var year = components.year;
        var month = components.month;
        var day = components.day;
        var hour = components.hour;
        var minute = components.minute;
        // TODO remove redundancy with this method and subtractHours
        let nanosecond : Nat = if (removeNanoseconds > components.nanosecond) {
            if (minute == 0) {
                if (hour == 0) {
                    if (day == 1) {
                        if (month == 1) {
                            year -= 1;
                            month := 12;
                        } else {
                            month -= 1;
                        };
                        day := InternalComponents.daysInMonth(month, InternalComponents.isLeapYear(year));
                    } else {
                        day -= 1;
                    };
                    hour := 23;
                } else {
                    hour -= 1;
                };
                minute := 59 - (minute - components.minute);
            } else {
                minute := components.minute - 1;
            };
            60_000_000_000 - (removeNanoseconds - components.nanosecond);
        } else {
            components.nanosecond - removeNanoseconds;
        };
        {
            year = year;
            month = month;
            day = day;
            hour = hour;
            minute = minute;
            nanosecond = nanosecond;
        };
    };

    private func subtractMinutes(components : Components, removeMinutes : Nat) : Components {
        if (removeMinutes == 0) {
            return components;
        };

        var year = components.year;
        var month = components.month;
        var day = components.day;
        var hour = components.hour;
        // TODO remove redundancy with this method and subtractHours
        let minute : Nat = if (removeMinutes > components.minute) {
            if (hour == 0) {
                if (day == 1) {
                    if (month == 1) {
                        year -= 1;
                        month := 12;
                    } else {
                        month -= 1;
                    };
                    day := InternalComponents.daysInMonth(month, InternalComponents.isLeapYear(year));
                } else {
                    day -= 1;
                };
                hour := 23;
            } else {
                hour -= 1;
            };
            60 - (removeMinutes - components.minute);
        } else {
            components.minute - removeMinutes;
        };
        {
            year = year;
            month = month;
            day = day;
            hour = hour;
            minute = minute;
            nanosecond = components.nanosecond;
        };
    };

    private func subtractHours(components : Components, removeHours : Nat) : Components {
        if (removeHours == 0) {
            return components;
        };
        var year = components.year;
        var month = components.month;
        var day = components.day;
        let hour : Nat = if (removeHours > components.hour) {
            if (day == 1) {
                if (month == 1) {
                    year -= 1;
                    month := 12;
                } else {
                    month -= 1;
                };
                day := InternalComponents.daysInMonth(month, InternalComponents.isLeapYear(year));
            } else {
                day -= 1;
            };
            24 - (removeHours - components.hour);
        } else {
            components.hour - removeHours;
        };
        {
            year = year;
            month = month;
            day = day;
            hour = hour;
            minute = components.minute;
            nanosecond = components.nanosecond;
        };
    };

    private func subtractDays(components : DateComponents, days : Nat) : DateComponents {
        if (days == 0) {
            return components;
        };
        var remainingDays : Nat = days;
        var year : Int = components.year;
        var month : Nat = components.month;
        var day : Nat = components.day;

        let beforeLeapDay = month < 2 or (month == 2 and day < 29);

        // Subtract years from total days
        label l loop {
            let newYear = year - 1;
            let daysInYear = if (beforeLeapDay) {
                InternalComponents.daysInYear(newYear);
            } else {
                InternalComponents.daysInYear(newYear + 1);
            };
            if (remainingDays < InternalComponents.daysInYear(newYear)) {
                break l;
            };
            if (remainingDays < daysInYear) {
                break l;
            };
            remainingDays -= daysInYear;
            year := newYear;
        };

        // Subtract months from total days
        label l loop {
            var newYear : Int = year;
            var newMonth : Nat = month - 1;
            if (newMonth == 0) {
                newMonth := 12;
                newYear := newYear - 1;
            };
            let isLeapYear = InternalComponents.isLeapYear(newYear);
            let daysInMonth = InternalComponents.daysInMonth(newMonth, isLeapYear);
            if (remainingDays < daysInMonth) {
                break l;
            };
            remainingDays -= daysInMonth;
            month := newMonth;
            year := newYear;
        };

        // Subtract days from total days
        while (remainingDays > 0) {
            var newYear : Int = year;
            var newMonth : Nat = month;
            var newDay : Nat = day;

            if (newDay == 1) {
                if (newMonth == 1) {
                    newMonth := 12;
                    newYear := newYear - 1;
                } else {
                    newMonth := newMonth - 1;
                };
                let isLeapYear = InternalComponents.isLeapYear(newYear);
                newDay := InternalComponents.daysInMonth(newMonth, isLeapYear);
            } else {
                newDay := newDay - 1;
            };
            remainingDays -= 1;
            year := newYear;
            month := newMonth;
            day := newDay;
        };

        // Fix potential overflow of days in a month
        let daysInMonth = InternalComponents.daysInMonth(month, InternalComponents.isLeapYear(year));
        if (day > daysInMonth) {
            let diff : Nat = day - daysInMonth;
            day := diff;
            month := month + 1;
        };

        {
            year = year;
            month = month;
            day = day;
        };
    };

    private func addTimeNat(startDateTime : Components, nanoseconds : Nat) : Components {
        let nanosecondsInASecond = 1000000000;
        let nanosecondsInAMinute = 60 * nanosecondsInASecond;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;

        var year : Int = startDateTime.year;
        var remainingNanoseconds : Nat = nanoseconds;

        // Remove years until cant remove any more
        label l loop {
            let daysInYearV = InternalComponents.daysInYear(year);
            let yearInNanoseconds = daysInYearV * nanosecondsInADay;
            if (remainingNanoseconds <= yearInNanoseconds) {
                if (remainingNanoseconds == yearInNanoseconds) {
                    // If exactly 1 year left, then we are on the first day of the next year
                    year += 1;
                    remainingNanoseconds := 0;
                };
                break l;
            };
            remainingNanoseconds -= yearInNanoseconds;
            year += 1;
        };

        // Remove months until cant remove any more
        var month : Nat = startDateTime.month;
        let currentIsLeapYear = InternalComponents.isLeapYear(year);
        label l loop {
            let daysInMonthV = InternalComponents.daysInMonth(month, currentIsLeapYear);
            let monthInNanoseconds : Nat = daysInMonthV * nanosecondsInADay;
            if (remainingNanoseconds <= monthInNanoseconds) {
                if (remainingNanoseconds == monthInNanoseconds) {
                    // If exactly 1 month left, then we are on the first day of the next month
                    month += 1;
                    remainingNanoseconds := 0;
                };
                break l;
            };
            remainingNanoseconds -= monthInNanoseconds;
            month += 1;
        };

        let days = (remainingNanoseconds / nanosecondsInADay);
        remainingNanoseconds -= days * nanosecondsInADay;
        var day : Nat = startDateTime.day + days;

        let hours = remainingNanoseconds / nanosecondsInAnHour;
        remainingNanoseconds %= nanosecondsInAnHour;
        var hour : Nat = startDateTime.hour + hours;

        let minutes = remainingNanoseconds / nanosecondsInAMinute;
        remainingNanoseconds %= nanosecondsInAMinute;

        var minute : Nat = startDateTime.minute + minutes;

        var nanosecond : Nat = startDateTime.nanosecond + remainingNanoseconds;

        if (nanosecond >= nanosecondsInAMinute) {
            nanosecond -= nanosecondsInAMinute;
            minute += 1;
        };

        if (minute >= 60) {
            minute -= 60;
            hour += 1;
        };
        if (hour >= 24) {
            hour -= 24;
            day += 1;
        };
        let daysInMonth = InternalComponents.daysInMonth(month, InternalComponents.isLeapYear(year));
        if (day > daysInMonth) {
            day -= daysInMonth;
            month += 1;
        };
        if (month > 12) {
            month -= 12;
            year += 1;
        };

        return {
            year = year;
            month = month;
            day = day;
            hour = hour;
            minute = minute;
            nanosecond = nanosecond;
        };
    };
};
