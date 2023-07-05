import InternalTypes "Types";
import NumberUtil "NumberUtil";
import TextUtil "TextUtil";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Int "mo:base/Int";
import InternalTimeZone "TimeZone";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Prelude "mo:base/Prelude";
import Array "mo:base/Array";
import Float "mo:base/Float";
import Buffer "mo:base/Buffer";
import TimeZone "TimeZone";
import Bool "mo:base/Bool";
import Char "mo:base/Char";
import Nat32 "mo:base/Nat32";

module Module {

    type Components = InternalTypes.Components;
    type DateComponents = InternalTypes.DateComponents;
    type DayOfWeek = InternalTypes.DayOfWeek;
    type Duration = InternalTypes.Duration;
    type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor;
    type TimeZone = InternalTypes.TimeZone;
    type Locale = InternalTypes.Locale;
    type Era = InternalTypes.Era;
    type TextFormat = InternalTypes.TextFormat;
    type FromTextResult = InternalTypes.FromTextResult;

    public type CalculatedDuration = {
        #adder : (Components) -> Components;
        #absoluteTime : Int;
    };

    type ExtractResult = {
        remainingText : Text;
        value : {
            #year : Nat;
            #quarter : Nat;
            #month : Nat;
            #dayOfYear : Nat;
            #dayOfMonth : Nat;
            #dayOfWeek : Nat;
            #weekOfYear : Nat;
            #hour : Nat;
            #minute : Nat;
            #nanosecond : Nat;
            #timeZoneDescriptor : TimeZoneDescriptor;
            #time : Time.Time;
        };
    };

    type TokenInfo = {
        value : Text;
        getter : (components : Components, timeZone : TimeZone, locale : ?Locale) -> Text;
        extract : (text : Text, components : Components, locale : ?Locale) -> ?ExtractResult;
    };

    type TokenOrText = {
        #text : Text;
        #token : TokenInfo;
    };

    public let epoch = {
        year = 1970;
        month = 1;
        day = 1;
        hour = 0;
        minute = 0;
        nanosecond = 0;
    };

    public func resolveDuration(duration : Duration) : CalculatedDuration {
        switch (duration) {
            case (#nanoseconds(nanoseconds)) {
                #absoluteTime(nanoseconds);
            };
            case (#milliseconds(milliseconds)) {
                #absoluteTime(milliseconds * 1_000_000);
            };
            case (#seconds(seconds)) {
                #absoluteTime(seconds * 1_000_000_000);
            };
            case (#minutes(minutes)) {
                #absoluteTime(minutes * 60 * 1_000_000_000);
            };
            case (#hours(hours)) {
                #absoluteTime(hours * 60 * 60 * 1_000_000_000);
            };
            case (#days(days)) {
                #absoluteTime(days * 24 * 60 * 60 * 1_000_000_000);
            };
            case (#weeks(weeks)) {
                #absoluteTime(weeks * 7 * 24 * 60 * 60 * 1_000_000_000);
            };
            case (#months(months)) {
                #adder(
                    func(components : Components) : Components {
                        // TODO validate leap stuff
                        let newMonth : Int = components.month + months;
                        let newYear : Int = components.year + newMonth / 12;
                        let newMonthInYear : Nat = Int.abs(newMonth % 12);
                        let isLeapYear : Bool = Module.isLeapYear(newYear);
                        let maxDaysInMonth : Nat = Module.daysInMonth(newMonthInYear, isLeapYear);
                        let dayIsNotInMonth = components.day > maxDaysInMonth;
                        let newDay : Nat = if (dayIsNotInMonth) {
                            // If not in the month then use the last day of the current month
                            maxDaysInMonth;
                        } else {
                            components.day;
                        };
                        {
                            components with
                            year = newYear;
                            month = newMonthInYear;
                            day = newDay;
                        };
                    }
                );
            };
            case (#years(years)) {
                #adder(
                    func(components : Components) : Components {
                        // TODO validate leap stuff
                        let newYear : Int = components.year + years;
                        {
                            year = newYear;
                            month = components.month;
                            day = components.day;
                            hour = components.hour;
                            minute = components.minute;
                            nanosecond = components.nanosecond;
                        };
                    }
                );
            };
        };
    };

    public func isValid(components : Components) : Bool {
        let leapYear = isLeapYear(components.year);

        let daysInM = daysInMonth(components.month, leapYear);

        if (components.day == 0 or components.day > daysInM) {
            return false;
        };

        if (components.hour >= 24) {
            return false;
        };

        if (components.minute >= 60) {
            return false;
        };

        if (components.nanosecond >= 60_000_000_000) {
            return false;
        };

        return true;
    };

    public func toTime(components : Components) : Time.Time {
        throwIfNotValid(components);
        let nanosecondsInAMinute = 60 * 1000000000;
        let nanosecondsInAnHour = 60 * nanosecondsInAMinute;
        let nanosecondsInADay = 24 * nanosecondsInAnHour;
        var totalNanoseconds : Int = 0;

        if (components.year < 1970) {
            // For dates before the epoch, need to do the inverse
            var currentYear : Int = 1969;
            while (currentYear > components.year) {
                totalNanoseconds -= daysInYear(currentYear) * nanosecondsInADay;
                currentYear -= 1;
            };

            // Month
            let currentIsLeapYear = isLeapYear(components.year);
            var currentMonth = 12;
            while (currentMonth > components.month) {
                totalNanoseconds -= daysInMonth(currentMonth, currentIsLeapYear) * nanosecondsInADay;
                currentMonth -= 1;
            };
            let daysInMonthV = daysInMonth(components.month, currentIsLeapYear);
            // Day
            totalNanoseconds -= (daysInMonthV - components.day) * nanosecondsInADay;
            // Hour
            totalNanoseconds -= (23 - components.hour) * nanosecondsInAnHour;

            // Minute
            totalNanoseconds -= (59 - components.minute) * nanosecondsInAMinute;

            // Nanosecond
            totalNanoseconds -= 60_000_000_000 - components.nanosecond;
        } else {

            var currentYear = 1970;
            while (currentYear < components.year) {
                totalNanoseconds += daysInYear(currentYear) * nanosecondsInADay;
                currentYear += 1;
            };

            // Month
            let currentIsLeapYear = isLeapYear(components.year);
            var currentMonth = 1;
            while (currentMonth < components.month) {
                totalNanoseconds += daysInMonth(currentMonth, currentIsLeapYear) * nanosecondsInADay;
                currentMonth += 1;
            };

            // Day
            totalNanoseconds += (components.day - 1) * nanosecondsInADay;

            // Hour
            totalNanoseconds += components.hour * nanosecondsInAnHour;

            // Minute
            totalNanoseconds += components.minute * nanosecondsInAMinute;

            // Nanosecond
            totalNanoseconds += components.nanosecond;
        };
        totalNanoseconds;
    };

    public func toTextFormatted(
        components : Components,
        timeZone : TimeZone,
        format : TextFormat,
    ) : Text {
        throwIfNotValid(components);

        let customFormat : Text = switch (format) {
            case (#iso8601) {
                let isUtc = switch (timeZone) {
                    case (#fixed(#seconds(s))) s == 0;
                    case (#fixed(#hours(h))) h == 0;
                    case (#dynamic(d)) d.toOffsetSeconds(components) == 0;
                };
                "YYYY-MM-DDTHH:mm:ss.SSSSSSSSS" # (if (not isUtc) "Z" else "[Z]");
            };
            case (#custom({ format; locale })) format;
        };

        let locale : ?Locale = switch (format) {
            case (#iso8601) null;
            case (#custom({ format; locale })) ?locale;
        };
        let tokens = parseFormatText(customFormat);

        var text = "";
        for (token in tokens.vals()) {
            text #= switch (token) {
                case (#text(t)) t;
                case (#token(t)) t.getter(components, timeZone, locale);
            };
        };
        text;
    };

    public func fromTextFormatted(text : Text, format : TextFormat) : ?FromTextResult {
        let (formatText, locale) : (Text, ?Locale) = switch (format) {
            case (#iso8601)("YYYY-MM-DDTHH:mm:ss.SSSSSSSSSZ", null);
            case (#custom({ format; locale }))(format, ?locale);
        };
        var components : Components = {
            year = 0;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            second = 0;
            nanosecond = 0;
        };

        var timeZoneDescriptor : TimeZoneDescriptor = #unspecified;

        var currentText = text;
        let tokens : Buffer.Buffer<TokenOrText> = parseFormatText(formatText);
        for (token in tokens.vals()) {
            switch (token) {
                case (#text(t)) {
                    // skip
                };
                case (#token(tokenInfo)) {
                    let ?result = tokenInfo.extract(currentText, components, locale) else return null;
                    currentText := result.remainingText;
                    switch (result.value) {
                        case (#year(y)) components := {
                            components with year = y
                        };
                        case (#quarter(q)) {
                            // Skip, not enough information
                        };
                        case (#month(m)) components := {
                            components with month = m
                        };
                        case (#hour(h)) components := {
                            components with hour = h
                        };
                        case (#minute(m)) components := {
                            components with minute = m
                        };
                        case (#nanosecond(s)) components := {
                            components with nanosecond = s;
                        };
                        case (#dayOfYear(d)) {
                            // TODO
                        };
                        case (#dayOfMonth(d)) components := {
                            components with day = d
                        };
                        case (#dayOfWeek(d)) {
                            // Skip, not enough information
                        };
                        case (#time(t)) components := fromTime(t);
                        case (#weekOfYear(w)) {
                            // Skip, not enough information
                        };
                        case (#timeZoneDescriptor(tzd)) timeZoneDescriptor := tzd;
                    };
                };
            };
        };
        ?{
            components;
            timeZoneDescriptor;
        };
    };

    public func fromTime(nanoseconds : Int) : Components {
        addTime(epoch, nanoseconds);
    };

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
                        day := daysInMonth(month, isLeapYear(year));
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
                    day := daysInMonth(month, isLeapYear(year));
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
                day := daysInMonth(month, isLeapYear(year));
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
            let daysInYearValue = if (beforeLeapDay) {
                daysInYear(newYear);
            } else {
                daysInYear(newYear + 1);
            };
            if (remainingDays < daysInYearValue) {
                break l;
            };
            remainingDays -= daysInYearValue;
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
            let isLeapYearValue = isLeapYear(newYear);
            let daysInMonthValue = daysInMonth(newMonth, isLeapYearValue);
            if (remainingDays < daysInMonthValue) {
                break l;
            };
            remainingDays -= daysInMonthValue;
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
                let isLeapYearValue = isLeapYear(newYear);
                newDay := daysInMonth(newMonth, isLeapYearValue);
            } else {
                newDay := newDay - 1;
            };
            remainingDays -= 1;
            year := newYear;
            month := newMonth;
            day := newDay;
        };

        // Fix potential overflow of days in a month
        let daysInMonthValue = daysInMonth(month, isLeapYear(year));
        if (day > daysInMonthValue) {
            let diff : Nat = day - daysInMonthValue;
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
            let daysInYearV = daysInYear(year);
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
        let currentIsLeapYear = isLeapYear(year);
        label l loop {
            let daysInMonthV = daysInMonth(month, currentIsLeapYear);
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
        let daysInMonthValue = daysInMonth(month, isLeapYear(year));
        if (day > daysInMonthValue) {
            day -= daysInMonthValue;
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

    private func parseFormatText(format : Text) : Buffer.Buffer<TokenOrText> {
        var startIndex = 0;
        var length = 1;
        let tokenBuffer = Buffer.Buffer<TokenOrText>(10);
        var bracketDepth = 0;
        var tokenMatches = tokens;
        let formatBuffer : Buffer.Buffer<Char> = Buffer.fromIter(Text.toIter(format));

        let appendTextAndReset = func(buffer : Buffer.Buffer<Char>, skipLastChar : Bool) {
            if (skipLastChar) {
                if (buffer.size() > 1) {
                    // If left over text, append it
                    let size : Nat = buffer.size() - 1;
                    let text = Text.fromIter(Buffer.subBuffer(buffer, 0, size).vals());
                    tokenBuffer.add(#text(text));
                };
            } else {
                let text = Text.fromIter(buffer.vals());
                tokenBuffer.add(#text(text));
            };
            startIndex += length;
            length := 1;
        };

        let matchAppendAndReset = func(exact : Bool) {
            if (length == 0) {
                return;
            };
            let buffer : Buffer.Buffer<Char> = Buffer.subBuffer(formatBuffer, startIndex, length);
            let value : Text = Text.fromIter(buffer.vals());
            let filterFunc = if (exact) {
                func(token : TokenInfo) : Bool {
                    value == token.value;
                };
            } else {
                func(token : TokenInfo) : Bool {
                    Text.startsWith(token.value, #text(value));
                };
            };
            // Filter matches down by starts with
            let fitleredTokens = Array.filter(tokenMatches, filterFunc);
            switch (fitleredTokens.size()) {
                case (0) {
                    // If not matches, then try to find an exact match with last value
                    if (length > 1) {
                        length -= 1;
                        matchAppendAndReset(true);
                        return;
                    };
                    // No matches, so just append the text
                    tokenBuffer.add(#text(value));
                    startIndex += length;
                    length := 1;
                    tokenMatches := tokens;
                };
                case (1) {
                    // Exactly one match, so append the replacement value
                    let token = fitleredTokens.get(0);
                    tokenBuffer.add(#token(token));
                    startIndex += length;
                    length := 1;
                    tokenMatches := tokens;
                };
                case (_) {
                    // Multiple matches, so keep going
                    length += 1;
                    tokenMatches := fitleredTokens;
                };
            };
        };

        label l loop {
            if (length + startIndex > formatBuffer.size()) {
                // We've reached the end of the string
                length -= 1;
                matchAppendAndReset(true);
                break l;
            };

            let subBuffer : Buffer.Buffer<Char> = Buffer.subBuffer(formatBuffer, startIndex, length);
            let nextChar = Buffer.last(subBuffer);

            switch (nextChar) {
                case ('[') {
                    bracketDepth += 1;
                    if (bracketDepth == 1) {
                        appendTextAndReset(subBuffer, true);
                        continue l;
                    };
                };
                case (']') {
                    bracketDepth -= 1;
                    if (bracketDepth == 0) {
                        appendTextAndReset(subBuffer, true);
                        continue l;
                    };
                };
                case (_) {
                    // No bracket change
                };
            };
            if (bracketDepth > 0) {
                // If in a bracket, just append the text
                appendTextAndReset(subBuffer, false);
                continue l;
            };
            matchAppendAndReset(false);
        };
        tokenBuffer;
    };

    public func getTimeZoneInfo(components : Components, timeZone : TimeZone) : (Text, Text) {
        switch (timeZone) {
            case (#fixed(#seconds(s))) {
                let offset = TimeZone.getOffsetText(s);
                (offset, offset);
            };
            case (#fixed(#hours(h))) {
                let offset = TimeZone.getOffsetText(h * 60 * 60);
                (offset, offset);
            };
            case (#dynamic(d)) {
                let name = d.getAbbr(components);
                let offset = TimeZone.getOffsetText(d.toOffsetSeconds(components));
                (name, offset);
            };
        };
    };

    public func dayOfWeek(components : DateComponents) : DayOfWeek {
        let intValue = dayOfWeekIndex(components);
        switch (intValue) {
            case (0) #sunday;
            case (1) #monday;
            case (2) #tuesday;
            case (3) #wednesday;
            case (4) #thursday;
            case (5) #friday;
            case (6) #saturday;
            case _ Prelude.unreachable();
        };
    };

    public func throwIfNotValid(components : Components) : () {
        if (not isValid(components)) {
            Debug.trap("Invalid datetime components: " # debug_show (components));
        };
    };

    // array with leading number of days values
    private let monthLeadingValues = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];

    public func dayOfWeekIndex(components : DateComponents) : Nat {
        let d = components.day;
        let m = components.month;
        let y = if (m < 3) components.year else components.year - 1; // if month is less than 3 reduce year by 1

        let t = monthLeadingValues[m - 1];
        let v : Int = if (components.year >= 1582) {
            // Gregorian calendar rules
            (y + y / 4 - y / 100 + y / 400 + t + d);
        } else {
            // Julian calendar rules
            (y + y / 4 + t + d);
        };
        return Int.abs(v) % 7;
    };

    public func daysInYear(year : Int) : Nat {
        let leapYear = isLeapYear(year);
        return if (leapYear) 366 else 365;
    };

    public func isLeapYear(year : Int) : Bool {
        // Leap years are every 4 years, except for every 100 years, except for every 400 years.
        return (year % 4 == 0) and (
            (year % 100 != 0) or (year % 400 == 0)
        );
    };

    public func daysInMonth(month : Nat, isLeapYear : Bool) : Nat {
        switch (month) {
            case (2) if (isLeapYear) 29 else 28;
            case (4 or 6 or 9 or 11) 30;
            case (1 or 3 or 5 or 7 or 8 or 10 or 12) 31;
            case _ Debug.trap("Invalid month: " # Nat.toText(month));
        };
    };

    public func weekYear(date : DateComponents, firstDayOfYear : Nat) : Int {
        if (firstDayOfYear < 1 or firstDayOfYear > 7) {
            Debug.trap("First day must be between 1 and 7. Value: " # Nat.toText(firstDayOfYear));
        };
        // Calculate the day of the year for the given date
        let startOfYear = {
            year = date.year;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            nanosecond = 0;
        };
        let dateTime = { date with hour = 0; minute = 0; nanosecond = 0 };
        let dayOfYear = timeBetween(startOfYear, dateTime) / 24 / 60 / 60 / 1_000_000_000;

        // Calculate the day of the week for the given date (0 = Monday, 6 = Sunday)
        let dayOfWeek = dayOfWeekIndex(date);

        // Check if the date falls in the first week of the year
        let firstDayOfYearIndex : Nat = firstDayOfYear - 1;
        let inFirstWeek = dayOfYear < firstDayOfYear and dayOfWeek >= firstDayOfYearIndex;

        // Check if the date falls in the last week of the previous year
        let lastDayOfYear : Nat = 365 - (7 - firstDayOfYear);
        let inLastWeekOfPrevYear = dayOfYear >= lastDayOfYear and dayOfWeek < firstDayOfYearIndex;

        // Return the correct week year
        if (inFirstWeek) {
            return date.year;
        } else if (inLastWeekOfPrevYear) {
            return date.year - 1;
        } else {
            return date.year;
        };
    };

    public func weekOfYear(components : DateComponents, firstDayOfWeek : Nat, firstDayOfYear : Nat) : Nat {
        let dayOfYearValue = dayOfYear(components, firstDayOfYear);

        // Calculate the week number
        var weekNumber : Nat = (dayOfYearValue / 7) + 1;

        // If the first day of the year was before the `firstDayOfYear`, add 1 to the week number
        if (firstDayOfWeek < firstDayOfYear) {
            weekNumber += 1;
        };

        return weekNumber;

    };

    public func dayOfYear(date : DateComponents, firstDayOfYear : Nat) : Nat {
        let startOfYear = {
            year = date.year;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            second = 0;
            nanosecond = 0;
        };
        let dateTime = { date with hour = 0; minute = 0; nanosecond = 0 };
        let time = timeBetween(startOfYear, dateTime);
        Int.abs(time) / 24 / 60 / 60 / 1_000_000_000;
    };

    public func timeBetween(start : Components, end : Components) : Int {
        let startTime = toTime(start);
        let endTime = toTime(end);
        return endTime - startTime;
    };

    private func requireLocale(locale : ?Locale) : Locale {
        switch (locale) {
            case (?l) l;
            case (null) Debug.trap("Locale is required to output the specified date format");
        };
    };

    private func getEra(time : Time.Time, locale : ?Locale) : Era {
        let l = requireLocale(locale);
        let eraFilter = func(e : Era) : Bool {
            let onOrAfterStart = switch (e.start) {
                case (null) true;
                case (?start) time >= start;
            };
            let beforeEnd = switch (e.end) {
                case (null) true;
                case (?end) time < end;
            };
            return onOrAfterStart and beforeEnd;
        };
        switch (Array.find<Era>(l.eras, eraFilter)) {
            case (?era) era;
            case (null) Debug.trap("No era found for time and locale. Time: " # debug_show (time) # ", Locale: " # l.id);
        };
    };

    private func findAndExtractStart(text : Text, options : [Text]) : ?(Nat, Text) {
        let optionIndex = 0;
        for (option in Iter.fromArray(options)) {
            if (Text.startsWith(text, #text(option))) {
                let otherText = skip(text, option.size());
                return ?(optionIndex, otherText);
            };
        };
        null;
    };

    private func skip(text : Text, count : Nat) : Text {
        let textIter = Text.toIter(text);
        let i = 0;
        label l loop {
            if (i >= count) {
                break l;
            };
            let _ = textIter.next();
        };
        Text.fromIter(textIter);
    };

    private func extractNat(text : Text, maxDigits : Nat, strict : Bool) : ?(Nat, Text) {
        let textIter = Text.toIter(text);
        var i = 0;
        var value : Nat = 0;
        label l loop {
            if (i >= maxDigits) {
                break l;
            };
            let char = switch (textIter.next()) {
                case (?c) c;
                case (null) break l;
            };
            let isDigit = Char.isDigit(char);
            if (not isDigit) {
                if (strict) {
                    return null;
                } else {
                    break l;
                };
            };
            value := value * 10 + Nat32.toNat(Char.toNat32(char));
            i += 1;
        };
        let otherText = skip(text, i);
        ?(value, otherText);
    };

    // Tokens are ordered by length so that the longest token is matched first
    let tokens : [TokenInfo] = [
        {
            // Full Month
            value = "MMMM";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                l.months[components.month - 1];
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, subText) = findAndExtractStart(text, l.months) else return null;

                ?{
                    remainingText = subText;
                    value = #month(index + 1);
                };
            };
        },
        {
            // Short Month
            value = "MMM";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                l.monthsShort[components.month - 1];
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, subText) = findAndExtractStart(text, l.months) else return null;
                ?{
                    remainingText = subText;
                    value = #month(index + 1);
                };
            };
        },
        {
            // Padded Month
            value = "MM";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPadded(components.month, 2);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(month, subText) = extractNat(text, 2, true) else return null;
                ?{
                    remainingText = subText;
                    value = #month(month);
                };
            };
        },
        // TODO
        // {
        //     // Month with ordinal
        //     value = "Mo";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         l.getOrdinal(components.month);
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        {
            // Month
            value = "M";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.month);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(month, subText) = extractNat(text, 2, false) else return null;
                ?{
                    remainingText = subText;
                    value = #month(month);
                };
            };
        },
        // TODO
        // {
        //     // Quarter with ordinal
        //     value = "Qo";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         l.getOrdinal(components.month / 3 + 1);
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        {
            // Quarter
            value = "Q";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.month / 3 + 1);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(quarter, subText) = extractNat(text, 1, false) else return null;

                ?{
                    remainingText = subText;
                    value = #quarter(quarter);
                };
            };
        },
        {
            // Padded Day of Year
            value = "DDDD";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                TextUtil.toTextPadded(dayOfYear(components, l.firstDayOfYear), 3);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfYear, subText) = extractNat(text, 4, true) else return null;

                ?{
                    remainingText = subText;
                    value = #dayOfYear(dayOfYear);
                };
            };
        },
        // TODO
        // {
        //     // Day of Year with ordinal
        //     value = "DDDo";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         l.getOrdinal(dayOfYear(components, l.firstDayOfYear));
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        {
            // Day of Year
            value = "DDD";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                Nat.toText(dayOfYear(components, l.firstDayOfYear));
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfYear, subText) = extractNat(text, 4, false) else return null;

                ?{
                    remainingText = subText;
                    value = #dayOfYear(dayOfYear);
                };
            };
        },
        {
            // Padded Day of Month
            value = "DD";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPadded(components.day, 2);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfMonth, subText) = extractNat(text, 2, true) else return null;

                ?{
                    remainingText = subText;
                    value = #dayOfMonth(dayOfMonth);
                };
            };
        },
        // TODO
        // {
        //     // Day of Month with ordinal
        //     value = "Do";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         l.getOrdinal(components.day);
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        {
            // Day of Month
            value = "D";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.day);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfMonth, subText) = extractNat(text, 2, false) else return null;

                ?{
                    remainingText = subText;
                    value = #dayOfMonth(dayOfMonth);
                };
            };
        },
        {
            // Weekday
            value = "dddd";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let dayOfWeek = dayOfWeekIndex(components);
                l.weekdays[dayOfWeek];
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, subText) = findAndExtractStart(text, l.weekdays) else return null;
                ?{
                    remainingText = subText;
                    value = #dayOfWeek(index + 1);
                };
            };
        },
        {
            // Weekday Short
            value = "ddd";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let dayOfWeek = dayOfWeekIndex(components);
                l.weekdaysShort[dayOfWeek];
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, subText) = findAndExtractStart(text, l.weekdaysShort) else return null;
                ?{
                    remainingText = subText;
                    value = #dayOfWeek(index + 1);
                };
            };
        },
        {
            // Weekday Min
            value = "dd";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let dayOfWeek = dayOfWeekIndex(components);
                l.weekdaysMin[dayOfWeek];
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, subText) = findAndExtractStart(text, l.weekdaysMin) else return null;
                ?{
                    remainingText = subText;
                    value = #dayOfWeek(index + 1);
                };
            };
        },
        // TODO
        // {
        //     // Day of Week with ordinal
        //     value = "do";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         let dayOfWeek = dayOfWeekIndex(components);
        //         l.getOrdinal(dayOfWeek);
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        {
            // Day of Week
            value = "d";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let dayOfWeek = dayOfWeekIndex(components);
                Nat.toText(dayOfWeek);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfWeek, subText) = extractNat(text, 1, true) else return null;

                ?{
                    remainingText = subText;
                    value = #dayOfWeek(dayOfWeek);
                };
            };
        },
        {
            // Day of Week (Locale)
            value = "e";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let dayOfWeek = dayOfWeekIndex(components);
                Nat.toText(dayOfWeek + l.firstDayOfWeek);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(dayOfWeek, subText) = extractNat(text, 1, true) else return null;

                ?{
                    remainingText = subText;
                    value = #dayOfWeek(dayOfWeek - l.firstDayOfWeek);
                };
            };
        },
        {
            // Day of Week (ISO)
            value = "E";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let dayOfWeek = dayOfWeekIndex(components);
                Nat.toText(dayOfWeek + 1);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfWeek, subText) = extractNat(text, 1, true) else return null;

                ?{
                    remainingText = subText;
                    value = #dayOfWeek(dayOfWeek - 1);
                };
            };
        },
        {
            // Padded Week of Year
            value = "ww";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let weekOfYearValue = weekOfYear(components, l.firstDayOfWeek, l.firstDayOfYear);
                TextUtil.toTextPaddedSign(weekOfYearValue, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(weekOfYear, subText) = extractNat(text, 2, true) else return null;

                ?{
                    remainingText = subText;
                    value = #weekOfYear(weekOfYear);
                };
            };
        },
        // TODO
        // {
        //     // Week of Year with ordinal
        //     value = "wo";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         let weekOfYearValue = weekOfYear(components, l.firstDayOfWeek, l.firstDayOfYear);
        //         l.getOrdinal(weekOfYearValue);
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        {
            // Week of Year
            value = "w";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let weekOfYearValue = weekOfYear(components, l.firstDayOfWeek, l.firstDayOfYear);
                Nat.toText(weekOfYearValue);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                let ?(weekOfYear, subText) = extractNat(text, 2, false) else return null;

                ?{
                    remainingText = subText;
                    value = #weekOfYear(weekOfYear);
                };
            };
        },
        {
            // Padded Week of Year (ISO)
            value = "WW";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let weekOfYearValue = weekOfYear(components, 1, 4);
                TextUtil.toTextPaddedSign(weekOfYearValue, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        // TODO
        // {
        //     // Week of Year (ISO) with ordinal
        //     value = "Wo";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         let weekOfYearValue = weekOfYear(components, 1, 4);
        //         l.getOrdinal(weekOfYearValue);
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        {
            // Week of Year (ISO)
            value = "W";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let weekOfYearValue = weekOfYear(components, 1, 4);
                Nat.toText(weekOfYearValue);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Max Padded Year with sign
            value = "YYYYYY";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.year, 6, true);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Padded Year
            value = "YYYY";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.year, 4, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Padded Year without century
            value = "YY";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.year % 100, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Year
            value = "Y";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let showPositiveSign = components.year > 9999; // Show + sign for years > 9999
                TextUtil.toTextPaddedSign(components.year, 1, showPositiveSign);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        // TODO
        // {
        //     // Era year with ordinal
        //     value = "yo";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         let now = toTime(components);
        //         let era = getEra(now, locale);
        //         let eraYear = Int.abs(components.year);
        //         l.getOrdinal(eraYear);
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        {
            // Era year
            value = "y";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let now = toTime(components);
                let era = getEra(now, locale);
                let eraYear = Int.abs(components.year);
                Nat.toText(eraYear);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Era Narrow Name
            value = "NNNNN";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, locale);
                era.narrowName;
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Era Full Name
            value = "NNNN";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, locale);
                era.fullName;
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Era
            value = "NNN";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, locale);
                era.abbreviatedName;
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Era
            value = "NN";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, locale);
                era.abbreviatedName;
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Era
            value = "N";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, locale);
                era.abbreviatedName;
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Padded Week Year (Locale)
            value = "gggg";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let weekYearValue = weekYear(components, l.firstDayOfYear);
                TextUtil.toTextPaddedSign(weekYearValue, 4, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Padded Week Year without century (Locale)
            value = "gg";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let weekYearValue = weekYear(components, l.firstDayOfYear);
                TextUtil.toTextPaddedSign(weekYearValue % 100, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Padded Week Year (ISO)
            value = "GGGG";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let weekYearValue = weekYear(components, 4); // ISO week year starts on thursday (4)
                TextUtil.toTextPaddedSign(weekYearValue, 4, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Padded Week Year without century (ISO)
            value = "GG";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let weekYearValue = weekYear(components, 4); // ISO week year starts on thursday (4)
                TextUtil.toTextPaddedSign(weekYearValue % 100, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        // TODO
        // {
        //     // Meridiem (UPPERCASE)
        //     value = "A";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         l.getMeridiem(components.hour, components.minute, false);
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        // {
        //     // Meridiem (lowercase)
        //     value = "a";
        //     getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
        //         let l = requireLocale(locale);
        //         l.getMeridiem(components.hour, components.minute, true);
        //     };
        //     extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
        //         // TODO
        //     };
        // },
        {
            // Hour Padded (0-23)
            value = "HH";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.hour, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Hour (0-23)
            value = "H";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.hour);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Hour Padded (12 hour)
            value = "hh";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let hour12Value = components.hour % 12;
                let value = if (hour12Value == 0) 12 else hour12Value;
                TextUtil.toTextPaddedSign(value, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Hour (12 hour)
            value = "h";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let hour12Value = components.hour % 12;
                let value = if (hour12Value == 0) 12 else hour12Value;
                Nat.toText(value);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Hour Padded (1-24)
            value = "kk";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.hour + 1, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Hour (1-24)
            value = "k";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.hour + 1);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Minute Padded
            value = "mm";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.minute, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Minute
            value = "m";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.minute);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Second Padded
            value = "ss";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let second = components.nanosecond / 1_000_000_000;
                TextUtil.toTextPaddedSign(second, 2, false);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Second
            value = "s";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let second = components.nanosecond / 1_000_000_000;
                Nat.toText(second);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Fractional Second (9 digits)
            value = "SSSSSSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 9);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Fractional Second (8 digits)
            value = "SSSSSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 8);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Fractional Second (7 digits)
            value = "SSSSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 7);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Fractional Second (6 digits)
            value = "SSSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 6);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Fractional Second (5 digits)
            value = "SSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 5);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Fractional Second (4 digits)
            value = "SSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 4);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Fractional Second (3 digits)
            value = "SSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 3);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Fractional Second (2 digits)
            value = "SS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 2);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Fractional Second (1 digit)
            value = "S";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 1);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Time Zone Name
            value = "zz";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getTimeZoneInfo(components, timeZone).0;
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Time Zone Name
            value = "z";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getTimeZoneInfo(components, timeZone).0;
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Time Zone Offset, No Colon
            value = "ZZ";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let offset = getTimeZoneInfo(components, timeZone).1;
                Text.replace(offset, #char(':'), "");
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Time Zone Offset
            value = "Z";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getTimeZoneInfo(components, timeZone).1;
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Unix Timestamp
            value = "X";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let time = toTime(components);
                Int.toText(time / 1_000_000_000);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
        {
            // Unix Millisecond Timestamp
            value = "x";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let time = toTime(components);
                Int.toText(time / 1_000_000);
            };
            extract = func(text : Text, components : Components, locale : ?Locale) : ?ExtractResult {
                // TODO
            };
        },
    ];

    private func getFractionalSecond(components : Components, digits : Int) : Text {
        let seconds = Float.fromInt(components.nanosecond) / 1_000_000_000.0;
        let fractionalSecond = seconds - Float.fromInt(Float.toInt(seconds)); // Remove integer part
        let formattedFloat = Float.format(#fix(9), fractionalSecond);
        Text.replace(formattedFloat, #text("0."), ""); // Remove 0. from the beginning
    };
};
