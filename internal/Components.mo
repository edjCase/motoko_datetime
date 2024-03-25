import Types "../src/Types";
import TextUtil "TextUtil";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Prelude "mo:base/Prelude";
import Array "mo:base/Array";
import Float "mo:base/Float";
import Buffer "mo:base/Buffer";
import TimeZone "TimeZone";
import Bool "mo:base/Bool";
import Char "mo:base/Char";
import Option "mo:base/Option";
import Nat8 "mo:base/Nat8";

module Module {

    type Components = Types.Components;
    type DateComponents = Types.DateComponents;
    type TimeComponents = Types.TimeComponents;
    type DayOfWeek = Types.DayOfWeek;
    type Duration = Types.Duration;
    type DateDuration = Types.DateDuration;
    type TimeDuration = Types.TimeDuration;
    type TimeZoneDescriptor = Types.TimeZoneDescriptor;
    type TimeZone = Types.TimeZone;
    type Locale = Types.Locale;
    type Era = Types.Era;
    type TextFormat = Types.TextFormat;
    type FromTextResult = Types.FromTextResult;
    type AdvanceDayOfWeekOptions = Types.AdvanceDayOfWeekOptions;
    type AdvanceDayOfWeekOptionsWithTime = Types.AdvanceDayOfWeekOptionsWithTime;

    public type CalculatedDuration = {
        #relative : (Components) -> Components;
        #absoluteTime : Int;
    };

    type ExtractResult = {
        remainingText : Text;
        value : ExtractedValue;
    };
    type ExtractedValue = {
        #year : Int;
        #yearWithoutCentury : Nat;
        #eraYear : Int;
        #quarter : Nat;
        #month : Nat;
        #dayOfYear : Nat;
        #dayOfMonth : Nat;
        #dayOfWeek : Nat;
        #weekOfYear : { value : Nat; firstDayOfYear : Nat };
        #weekYear : { value : Int; firstDayOfYear : Nat };
        #weekYearWithoutCentury : { value : Nat; firstDayOfYear : Nat };
        #hour : Nat;
        #hour12 : Nat;
        #minute : Nat;
        #second : Nat;
        #fractionalNanosecond : Nat;
        #timeZoneDescriptor : TimeZoneDescriptor;
        #time : Time.Time;
        #era : Era;
        #isPM : Bool;
    };

    type TokenInfo = {
        value : Text;
        getter : (components : Components, timeZone : TimeZone, locale : ?Locale) -> Text;
        extract : (text : Text, locale : ?Locale) -> ?ExtractResult;
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

    public func advanceToDayOfWeek(components : DateComponents, newDayOfWeek : DayOfWeek, options : AdvanceDayOfWeekOptions) : DateComponents {
        let currentDayOfWeek = dayOfWeek(components);
        if (currentDayOfWeek == newDayOfWeek) {
            if (options.addWeekOnMatchingDay) {
                return addDays(components, 7);
            };
            return components;
        };
        let currentDayOfWeekIndex = indexFromDayOfWeek(currentDayOfWeek);
        let newDayOfWeekIndex = indexFromDayOfWeek(newDayOfWeek);
        let dayDelta : Nat = if (currentDayOfWeekIndex < newDayOfWeekIndex) {
            newDayOfWeekIndex - currentDayOfWeekIndex;
        } else {
            7 - (currentDayOfWeekIndex - newDayOfWeekIndex);
        };
        addDays(components, dayDelta);
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
                #relative(
                    func(components : Components) : Components {
                        let uncorrectedMonth : Int = components.month + months;
                        let (month, year) = getCorrectedMonth(uncorrectedMonth, components.year);
                        let day = getCorrectedDay(components.day, month, year);
                        {
                            components with
                            year = year;
                            month = month;
                            day = day;
                        };
                    }
                );
            };
            case (#years(years)) {
                #relative(
                    func(components : Components) : Components {
                        let year : Int = components.year + years;
                        let day = getCorrectedDay(components.day, components.month, year);
                        {
                            components with
                            year = year;
                            day = day;
                        };
                    }
                );
            };
        };
    };

    private func getCorrectedMonth(uncorrectedMonth : Int, year : Int) : (Nat, Int) {
        if (uncorrectedMonth < 1) {
            let absMonth = Int.abs(uncorrectedMonth);
            let extraYears = (absMonth / 12) + 1;
            let month : Nat = 12 - (absMonth % 12);
            (month, year - extraYears);
        } else {
            let absMonth = Int.abs(uncorrectedMonth);
            let extraYears = absMonth / 12;
            let month : Nat = absMonth % 12;
            if (month == 0) {
                (12, year + extraYears - 1);
            } else {
                (month, year + extraYears);
            };
        };
    };

    private func getCorrectedDay(day : Nat, month : Nat, year : Int) : Nat {
        let isLeapYear : Bool = Module.isLeapYear(year);
        let maxDaysInMonth : Nat = Module.daysInMonth(month, isLeapYear);
        let dayIsNotInMonth = day > maxDaysInMonth;
        if (dayIsNotInMonth) {
            // If not in the month then use the last day of the current month
            maxDaysInMonth;
        } else {
            day;
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
            case (#iso) {
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
            case (#iso) null;
            case (#custom({ format; locale })) locale;
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

    public func fromText(text : Text, format : Text, locale : ?Locale) : ?FromTextResult {
        var remainingText = text;
        let tokenOrTextBuffer : Buffer.Buffer<TokenOrText> = parseFormatText(format);
        let extractedValueHelper = ExtractedValueHelper();
        for (tokenOrText in tokenOrTextBuffer.vals()) {
            switch (tokenOrText) {
                case (#text(t)) {
                    // skip text
                    let ?v = Text.stripStart(remainingText, #text(t)) else return null;
                    remainingText := v;
                };
                case (#token(tokenInfo)) {
                    let ?result = tokenInfo.extract(remainingText, locale) else return null;
                    extractedValueHelper.add(result.value);
                    remainingText := result.remainingText;
                };
            };
        };
        let ?(components, timeZoneDescriptor) = extractedValueHelper.resolve() else return null;
        ?{
            components;
            timeZoneDescriptor;
        };
    };

    private class ExtractedValueHelper() {
        let extractedValues : Buffer.Buffer<ExtractedValue> = Buffer.Buffer<ExtractedValue>(10);

        type State = {
            year : ?Int;
            month : ?Nat;
            day : ?Nat;
            hour : ?Nat;
            minute : ?Nat;
            second : ?Nat;
            fractionalNanosecond : ?Nat;
            tz : ?TimeZoneDescriptor;
            isPM : ?Bool;
        };

        public func add(value : ExtractedValue) : () {
            extractedValues.add(value);
        };

        public func resolve() : ?(Components, TimeZoneDescriptor) {

            var state : State = {
                year = null;
                month = null;
                day = null;
                hour = null;
                minute = null;
                second = null;
                fractionalNanosecond = null;
                tz = null;
                isPM = null;
            };

            // To fix and issue with isPM and year being needed for other values, we prefetch them, TODO make better
            for (value in extractedValues.vals()) {
                switch (value) {
                    case (#isPM(_) or #year(_)) {
                        // Prefetch subset
                        state := updateState(state, value);
                    };
                    case (_) {
                        // Skip in prefetch
                    };
                };
            };

            label l loop {
                let ?lastValue = extractedValues.removeLast() else break l;
                state := updateState(state, lastValue);
            };
            let ?year = state.year else return null;
            let ?month = state.month else return null;
            let ?day = state.day else return null;
            let hour = Option.get(state.hour, 0);
            let minute = Option.get(state.minute, 0);
            let nanosecond = Option.get(state.fractionalNanosecond, 0) + Option.get(state.second, 0) * 1_000_000_000;
            let timeZoneDescriptor = Option.get(state.tz, #unspecified);
            let components : Components = {
                year = year;
                month = month;
                day = day;
                hour = hour;
                minute = minute;
                nanosecond = nanosecond;
            };
            ?(components, timeZoneDescriptor);
        };

        func updateState(state : State, value : ExtractedValue) : State {

            let newState = switch (value) {
                case (#year(y)) {
                    { state with year = ?y };
                };
                case (#yearWithoutCentury(_)) {
                    // Skip, not enough information
                    state;
                };
                case (#eraYear(_)) {
                    // Skip, not enough information
                    state;
                };
                case (#quarter(_)) {
                    // Skip, not enough information
                    state;
                };
                case (#month(m)) {
                    { state with month = ?m };
                };
                case (#hour(h)) {
                    { state with hour = ?h };
                };
                case (#hour12(h)) {
                    switch (state.isPM) {
                        case (null) Debug.trap("Meridiem is required when using 12 hour clock"); // isPM is prefetched, TODO make better
                        case (?true) {
                            { state with hour = ?(h + 12) };
                        };
                        case (?false) {
                            { state with hour = ?h };
                        };
                    };
                };
                case (#minute(m)) {
                    { state with minute = ?m };
                };
                case (#second(s)) {
                    { state with second = ?s };
                };
                case (#fractionalNanosecond(s)) {
                    { state with fractionalNanosecond = ?s };
                };
                case (#dayOfYear(d)) {
                    let ?year = state.year else Debug.trap("Year is required when using day of year"); // Year is prefetched, TODO make better
                    var month = 1;
                    var remainingDays = d;
                    label l loop {
                        let daysInMonthValue = daysInMonth(month, isLeapYear(year));
                        if (remainingDays <= daysInMonthValue) {
                            break l;
                        };
                        remainingDays -= daysInMonthValue;
                        month += 1;
                    };
                    {
                        state with
                        day = ?remainingDays;
                        month = ?month;
                    };
                };
                case (#dayOfMonth(d)) {
                    { state with day = ?d };
                };
                case (#dayOfWeek(_)) {
                    // Skip, not enough information
                    state;
                };
                case (#time(t)) {
                    let components = fromTime(t);
                    {
                        state with
                        year = ?components.year;
                        month = ?components.month;
                        day = ?components.day;
                        hour = ?components.hour;
                        minute = ?components.minute;
                        nanosecond = ?components.nanosecond;
                    };
                };
                case (#weekOfYear(_)) {
                    // Skip, not enough information
                    state;
                };
                case (#timeZoneDescriptor(tzd)) {
                    { state with tz = ?tzd };
                };
                case (#era(_)) {
                    // Skip, not enough information
                    state;
                };
                case (#weekYear(_)) {
                    // Skip, not enough information
                    state;
                };
                case (#weekYearWithoutCentury(_)) {
                    // Skip, not enough information
                    state;
                };
                case (#isPM(isPM)) {
                    { state with isPM = ?isPM };
                };
            };
            newState;
        };
    };

    public func fromTime(nanoseconds : Int) : Components {
        addTime(epoch, nanoseconds);
    };

    public func add(components : Components, duration : Duration) : Components {
        let calculatedDuration = resolveDuration(duration);
        switch (calculatedDuration) {
            case (#relative(relativeFunc)) {
                relativeFunc(components);
            };
            case (#absoluteTime(absoluteTime)) {
                addTime(components, absoluteTime);
            };
        };
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

        let date = addDays(components, -remainingDays);
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

    private func addDays(components : DateComponents, days : Int) : DateComponents {
        if (days == 0) {
            return components;
        };
        let add = days > 0;
        var remainingDays : Nat = Int.abs(days);
        var year : Int = components.year;
        var month : Nat = components.month;
        var day : Nat = components.day;

        let beforeLeapDay = month < 2 or (month == 2 and day < 29);

        // Add/Subtract years from total days
        let getNewYear = if (add) {
            func(year : Int) : (Int, Int) {
                let newYear : Int = year + 1;
                let yearToCheck = if (beforeLeapDay) year else newYear;
                (newYear, yearToCheck);
            };
        } else {
            func(year : Int) : (Int, Int) {
                let newYear : Int = year - 1;
                let yearToCheck = if (beforeLeapDay) newYear else year;
                (newYear, yearToCheck);
            };
        };
        label l loop {
            let (newYear, yearToCheck) = getNewYear(year);
            let daysInYearValue = daysInYear(yearToCheck);
            if (remainingDays < daysInYearValue) {
                break l;
            };
            remainingDays -= daysInYearValue;
            year := newYear;
        };

        // Add/Subtract months from total days
        let getNewMonth = if (add) {
            func(year : Int, month : Nat) : (Int, Nat) {
                if (month == 12) {
                    return (year + 1, 1);
                };
                (year, month + 1);
            };
        } else {
            func(year : Int, month : Nat) : (Int, Nat) {
                if (month == 1) {
                    return (year - 1, 12);
                };
                (year, month - 1);
            };
        };

        label l loop {
            let (newYear, newMonth) = getNewMonth(year, month);
            let isLeapYearValue = isLeapYear(newYear);
            let daysInMonthValue = daysInMonth(newMonth, isLeapYearValue);
            if (remainingDays < daysInMonthValue) {
                break l;
            };
            remainingDays -= daysInMonthValue;
            month := newMonth;
            year := newYear;
        };

        // Add/Subtract days from total days
        let getDay = if (add) {
            func(year : Int, month : Nat, day : Nat) : (Int, Nat, Nat) {
                let daysInMonthValue = daysInMonth(month, isLeapYear(year));
                if (day == daysInMonthValue) {
                    let (newYear, newMonth) = if (month == 12) {
                        (year + 1, 1);
                    } else {
                        (year, month + 1);
                    };
                    (newYear, newMonth, 1);
                } else { (year, month, day + 1) };
            };
        } else {
            func(year : Int, month : Nat, day : Nat) : (Int, Nat, Nat) {
                if (day == 1) {
                    let (newYear, newMonth) = if (month == 1) {
                        (year - 1, 12);
                    } else {
                        let newMonth : Nat = month - 1;
                        (year, newMonth);
                    };
                    let daysInMonthValue = daysInMonth(newMonth, isLeapYear(newYear));
                    (newYear, newMonth, daysInMonthValue);
                } else { (year, month, day - 1) };
            };
        };
        while (remainingDays > 0) {
            let (newYear, newMonth, newDay) = getDay(year, month, day);
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

    public func indexFromDayOfWeek(dayOfWeek : DayOfWeek) : Nat {
        switch (dayOfWeek) {
            case (#sunday) 0;
            case (#monday) 1;
            case (#tuesday) 2;
            case (#wednesday) 3;
            case (#thursday) 4;
            case (#friday) 5;
            case (#saturday) 6;
        };
    };

    public func dayOfWeekIndex(components : DateComponents) : Nat {
        // The following uses the Zeller’s Congruence algorithm
        let (month, year) = switch (components.month) {
            case (1) (13, components.year - 1);
            case (2) (14, components.year - 1);
            case (m) (m, components.year);
        };
        let day = components.day;
        let yearWithoutCentury = year % 100;
        let century = year / 100;
        let h = day + 13 * (month + 1) / 5 + yearWithoutCentury + yearWithoutCentury / 4 + century / 4 + 5 * century;
        let position = Int.abs(h) % 7;
        switch (position) {
            case (0) 6; // Wrap around -1 (Saturday)
            case (i) i - 1;
        };
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

    public func weekYear(date : DateComponents, firstDayOfWeek : DayOfWeek, firstDayOfYear : Nat) : Int {
        let weekOfYearValue = weekOfYear(date, firstDayOfWeek, firstDayOfYear);

        if (weekOfYearValue < 1) {
            return date.year - 1;
        };
        date.year;
    };

    public func weekOfYear(components : DateComponents, firstDayOfWeek : DayOfWeek, firstDayOfYear : Nat) : Nat {
        let dayOfYearValue = dayOfYear(components);
        let firstDayOfWeekIndex = indexFromDayOfWeek(firstDayOfWeek);

        let dayInJanuaryThatStartsFirstWeek : Nat = 7 + firstDayOfWeekIndex - firstDayOfYear;

        if (dayOfYearValue < dayInJanuaryThatStartsFirstWeek) {
            return 0;
        };
        let daysAfter : Nat = dayOfYearValue - dayInJanuaryThatStartsFirstWeek;

        let week : Nat = daysAfter / 7 + 1;

        if (daysAfter % 7 != 0) {
            week + 1;
        } else {
            week;
        };
    };

    public func dayOfYear(date : DateComponents) : Nat {
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
        Int.abs(time) / 24 / 60 / 60 / 1_000_000_000 + 1;
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

    private func getEra(time : Time.Time, locale : Locale) : Era {
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
        switch (Array.find<Era>(locale.eras, eraFilter)) {
            case (?era) era;
            case (null) Debug.trap("No era found for time and locale. Time: " # debug_show (time) # ", Locale: " # locale.id);
        };
    };

    private func findAndExtractStart(text : Text, options : [Text]) : ?(Nat, Text) {
        let optionIndex = 0;
        for (option in Iter.fromArray(options)) {
            if (Text.startsWith(text, #text(option))) {
                let (_, remainingText) = take<Char>(text.chars(), option.size());
                return ?(optionIndex, Text.fromIter(remainingText));
            };
        };
        null;
    };

    private func take<T>(iter : Iter.Iter<T>, count : Nat) : (Buffer.Buffer<T>, Iter.Iter<T>) {
        var takenBuffer = Buffer.Buffer<T>(count);
        var i = 0;
        label l loop {
            if (i >= count) {
                break l;
            };
            switch (iter.next()) {
                case (?c) takenBuffer.add(c);
                case (null) break l;
            };
            i += 1;
        };
        (takenBuffer, iter);
    };

    private func extractInt(text : Text, maxDigits : Nat, strict : Bool) : ?(Int, Text) {
        let textIter = text.chars();
        let (isNegative, textWithoutSign) = switch (textIter.next()) {
            case (?'-') (true, Text.fromIter(textIter));
            case (?'+') (false, Text.fromIter(textIter));
            case (_) (false, text);
        };
        let ?(natValue, remainingText) = extractNat(textWithoutSign, maxDigits, strict) else return null;
        let intValue : Int = if (isNegative) -natValue else natValue;
        ?(intValue, remainingText);
    };

    private func getNextWord(text : Text) : (Text, Text) {
        var word = "";
        let iter = text.chars();
        label l loop {
            switch (iter.next()) {
                case (?c) {
                    if (Char.isWhitespace(c)) break l;
                    word #= Text.fromChar(c);
                };
                case (null) break l;
            };
        };
        let remainingText = Text.fromIter(iter);
        (word, remainingText);
    };

    private func extractNat(text : Text, maxDigits : Nat, strict : Bool) : ?(Nat, Text) {
        let (taken, remainingText) = take<Char>(text.chars(), maxDigits);
        var digitCount = 0;
        let values = Buffer.Buffer<Nat>(maxDigits);
        label l for (c in taken.vals()) {
            let digit = switch (c) {
                case ('0') 0;
                case ('1') 1;
                case ('2') 2;
                case ('3') 3;
                case ('4') 4;
                case ('5') 5;
                case ('6') 6;
                case ('7') 7;
                case ('8') 8;
                case ('9') 9;
                case (_) {
                    if (strict or digitCount == 0) {
                        return null;
                    } else {
                        break l;
                    };
                };
            };
            values.add(digit);
            digitCount += 1;
        };
        type Acc = { value : Nat; i : Nat };
        let natValue = Buffer.foldRight(
            values,
            { value = 0; i = 0 },
            func(value : Nat, acc : Acc) : Acc {
                let newValue = acc.value + (value * Nat.pow(10, acc.i));
                {
                    value = newValue;
                    i = acc.i + 1;
                };
            },
        );
        let r = if (digitCount >= taken.size()) {
            Text.fromIter(remainingText);
        } else {
            let unusedTakenLength : Nat = taken.size() - digitCount;
            let unusedTakenBuffer = Buffer.subBuffer(taken, digitCount, unusedTakenLength);
            let unusedTakenText = Text.fromIter(unusedTakenBuffer.vals());
            unusedTakenText # Text.fromIter(remainingText);
        };
        ?(natValue.value, r);
    };

    private func getEraYear(components : Components, locale : Locale) : Int {
        let now = toTime(components);
        let era = getEra(now, locale);
        switch (era.start) {
            case (null) components.year;
            case (?start) components.year - fromTime(start).year + 1;
        };
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, remainingText) = findAndExtractStart(text, l.months) else return null;

                ?{
                    remainingText = remainingText;
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, remainingText) = findAndExtractStart(text, l.months) else return null;
                ?{
                    remainingText = remainingText;
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(month, remainingText) = extractNat(text, 2, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #month(month);
                };
            };
        },
        {
            // Month with ordinal
            value = "Mo";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                l.getOrdinal(components.month);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseOrdinal(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #month(value);
                };
            };
        },
        {
            // Month
            value = "M";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.month);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(month, remainingText) = extractNat(text, 2, false) else return null;
                ?{
                    remainingText = remainingText;
                    value = #month(month);
                };
            };
        },
        {
            // Quarter with ordinal
            value = "Qo";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                l.getOrdinal(components.month / 3 + 1);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseOrdinal(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #quarter(value);
                };
            };
        },
        {
            // Quarter
            value = "Q";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.month / 3 + 1);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(quarter, remainingText) = extractNat(text, 1, false) else return null;

                ?{
                    remainingText = remainingText;
                    value = #quarter(quarter);
                };
            };
        },
        {
            // Padded Day of Year
            value = "DDDD";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPadded(dayOfYear(components), 3);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfYear, remainingText) = extractNat(text, 4, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #dayOfYear(dayOfYear);
                };
            };
        },
        {
            // Day of Year with ordinal
            value = "DDDo";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let doy = dayOfYear(components);
                l.getOrdinal(doy);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseOrdinal(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #dayOfYear(value);
                };
            };
        },
        {
            // Day of Year
            value = "DDD";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(dayOfYear(components));
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfYear, remainingText) = extractNat(text, 4, false) else return null;

                ?{
                    remainingText = remainingText;
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfMonth, remainingText) = extractNat(text, 2, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #dayOfMonth(dayOfMonth);
                };
            };
        },
        {
            // Day of Month with ordinal
            value = "Do";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                l.getOrdinal(components.day);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseOrdinal(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #dayOfMonth(value);
                };
            };
        },
        {
            // Day of Month
            value = "D";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.day);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfMonth, remainingText) = extractNat(text, 2, false) else return null;

                ?{
                    remainingText = remainingText;
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, remainingText) = findAndExtractStart(text, l.weekdays) else return null;
                ?{
                    remainingText = remainingText;
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, remainingText) = findAndExtractStart(text, l.weekdaysShort) else return null;
                ?{
                    remainingText = remainingText;
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(index, remainingText) = findAndExtractStart(text, l.weekdaysMin) else return null;
                ?{
                    remainingText = remainingText;
                    value = #dayOfWeek(index + 1);
                };
            };
        },
        {
            // Day of Week with ordinal
            value = "do";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let dayOfWeek = dayOfWeekIndex(components);
                l.getOrdinal(dayOfWeek);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseOrdinal(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #dayOfWeek(value);
                };
            };
        },
        {
            // Day of Week
            value = "d";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let dayOfWeek = dayOfWeekIndex(components);
                Nat.toText(dayOfWeek);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfWeek, remainingText) = extractNat(text, 1, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #dayOfWeek(dayOfWeek);
                };
            };
        },
        {
            // Day of Week (Locale)
            value = "e";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let dayOfWeekIndexValue = dayOfWeekIndex(components);
                let firstDayOfWeekIndex = indexFromDayOfWeek(l.firstDayOfWeek);
                Nat.toText(dayOfWeekIndexValue + firstDayOfWeekIndex);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(dayOfWeek, remainingText) = extractNat(text, 1, true) else return null;
                let firstDayOfWeekIndex = indexFromDayOfWeek(l.firstDayOfWeek);
                ?{
                    remainingText = remainingText;
                    value = #dayOfWeek(dayOfWeek - firstDayOfWeekIndex);
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(dayOfWeek, remainingText) = extractNat(text, 1, true) else return null;

                ?{
                    remainingText = remainingText;
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(weekOfYear, remainingText) = extractNat(text, 2, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #weekOfYear({
                        value = weekOfYear;
                        firstDayOfWeek = l.firstDayOfWeek;
                        firstDayOfYear = l.firstDayOfYear;
                    });
                };
            };
        },
        {
            // Week of Year with ordinal
            value = "wo";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let weekOfYearValue = weekOfYear(components, l.firstDayOfWeek, l.firstDayOfYear);
                l.getOrdinal(weekOfYearValue);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseOrdinal(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #weekOfYear({
                        value = value;
                        firstDayOfYear = l.firstDayOfYear;
                    });
                };
            };
        },
        {
            // Week of Year
            value = "w";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let weekOfYearValue = weekOfYear(components, l.firstDayOfWeek, l.firstDayOfYear);
                Nat.toText(weekOfYearValue);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(weekOfYear, remainingText) = extractNat(text, 2, false) else return null;

                ?{
                    remainingText = remainingText;
                    value = #weekOfYear({
                        value = weekOfYear;
                        firstDayOfWeek = l.firstDayOfWeek;
                        firstDayOfYear = l.firstDayOfYear;
                    });
                };
            };
        },
        {
            // Padded Week of Year (ISO)
            value = "WW";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let weekOfYearValue = weekOfYear(components, #monday, 4);
                TextUtil.toTextPaddedSign(weekOfYearValue, 2, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(weekOfYear, remainingText) = extractNat(text, 2, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #weekOfYear({
                        value = weekOfYear;
                        firstDayOfYear = 4;
                    });
                };
            };
        },
        {
            // Week of Year (ISO) with ordinal
            value = "Wo";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let weekOfYearValue = weekOfYear(components, #monday, 4);
                l.getOrdinal(weekOfYearValue);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseOrdinal(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #weekOfYear({
                        firstDayOfYear = 4;
                        value = value;
                    });
                };
            };
        },
        {
            // Week of Year (ISO)
            value = "W";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let weekOfYearValue = weekOfYear(components, #monday, 4);
                Nat.toText(weekOfYearValue);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(weekOfYear, remainingText) = extractNat(text, 2, false) else return null;

                ?{
                    remainingText = remainingText;
                    value = #weekOfYear({
                        value = weekOfYear;
                        firstDayOfYear = 4;
                    });
                };
            };
        },
        {
            // Max Padded Year with sign
            value = "YYYYYY";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.year, 6, true);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(year, remainingText) = extractInt(text, 6, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #year(year);
                };
            };
        },
        {
            // Padded Year
            value = "YYYY";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.year, 4, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(year, remainingText) = extractInt(text, 4, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #year(year);
                };
            };
        },
        {
            // Padded Year without century
            value = "YY";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.year % 100, 2, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(year, remainingText) = extractNat(text, 2, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #yearWithoutCentury(year);
                };
            };
        },
        {
            // Year
            value = "Y";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let showPositiveSign = components.year > 9999; // Show + sign for years > 9999
                TextUtil.toTextPaddedSign(components.year, 1, showPositiveSign);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(year, remainingText) = extractInt(text, 4, false) else return null;

                ?{
                    remainingText = remainingText;
                    value = #year(year);
                };
            };
        },
        {
            // Era year with ordinal
            value = "yo";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let eraYear = getEraYear(components, l);
                l.getOrdinal(eraYear);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseOrdinal(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #eraYear(value);
                };
            };
        },
        {
            // Era year
            value = "y";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let eraYear = getEraYear(components, l);
                Int.toText(eraYear);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(eraYear, remainingText) = extractNat(text, 4, false) else return null;
                ?{
                    remainingText = remainingText;
                    value = #eraYear(eraYear);
                };
            };
        },
        {
            // Era Narrow Name
            value = "NNNNN";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, l);
                era.narrowName;
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let options = Array.map(l.eras, func(e : Era) : Text = e.narrowName);
                let ?(index, remainingText) = findAndExtractStart(text, options) else return null;

                ?{
                    remainingText = remainingText;
                    value = #era(l.eras[index]);
                };
            };
        },
        {
            // Era Full Name
            value = "NNNN";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, l);
                era.fullName;
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let options = Array.map(l.eras, func(e : Era) : Text = e.fullName);
                let ?(index, remainingText) = findAndExtractStart(text, options) else return null;

                ?{
                    remainingText = remainingText;
                    value = #era(l.eras[index]);
                };
            };
        },
        {
            // Era
            value = "NNN";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, l);
                era.abbreviatedName;
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let options = Array.map(l.eras, func(e : Era) : Text = e.abbreviatedName);
                let ?(index, remainingText) = findAndExtractStart(text, options) else return null;

                ?{
                    remainingText = remainingText;
                    value = #era(l.eras[index]);
                };
            };
        },
        {
            // Era
            value = "NN";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, l);
                era.abbreviatedName;
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let options = Array.map(l.eras, func(e : Era) : Text = e.abbreviatedName);
                let ?(index, remainingText) = findAndExtractStart(text, options) else return null;

                ?{
                    remainingText = remainingText;
                    value = #era(l.eras[index]);
                };
            };
        },
        {
            // Era
            value = "N";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let now = toTime(components);
                let era = getEra(now, l);
                era.abbreviatedName;
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let options = Array.map(l.eras, func(e : Era) : Text = e.abbreviatedName);
                let ?(index, remainingText) = findAndExtractStart(text, options) else return null;

                ?{
                    remainingText = remainingText;
                    value = #era(l.eras[index]);
                };
            };
        },
        {
            // Padded Week Year (Locale)
            value = "gggg";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let weekYearValue = weekYear(components, l.firstDayOfWeek, l.firstDayOfYear);
                TextUtil.toTextPaddedSign(weekYearValue, 4, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(weekYear, remainingText) = extractInt(text, 4, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #weekYear({
                        value = weekYear;
                        firstDayOfYear = l.firstDayOfYear;
                    });
                };
            };
        },
        {
            // Padded Week Year without century (Locale)
            value = "gg";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                let weekYearValue = weekYear(components, l.firstDayOfWeek, l.firstDayOfYear);
                TextUtil.toTextPaddedSign(weekYearValue % 100, 2, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?(weekYearWithoutCentury, remainingText) = extractNat(text, 2, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #weekYearWithoutCentury({
                        value = weekYearWithoutCentury;
                        firstDayOfYear = l.firstDayOfYear;
                    });
                };
            };
        },
        {
            // Padded Week Year (ISO)
            value = "GGGG";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let weekYearValue = weekYear(components, #monday, 4); // ISO week year starts on thursday (4)
                TextUtil.toTextPaddedSign(weekYearValue, 4, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(weekYear, remainingText) = extractInt(text, 4, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #weekYear({
                        value = weekYear;
                        firstDayOfYear = 4;
                    });
                };
            };
        },
        {
            // Padded Week Year without century (ISO)
            value = "GG";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let weekYearValue = weekYear(components, #monday, 4); // ISO week year starts on thursday (4)
                TextUtil.toTextPaddedSign(weekYearValue % 100, 2, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(weekYearWithoutCentury, remainingText) = extractNat(text, 2, true) else return null;

                ?{
                    remainingText = remainingText;
                    value = #weekYearWithoutCentury({
                        value = weekYearWithoutCentury;
                        firstDayOfYear = 4;
                    });
                };
            };
        },
        {
            // Meridiem (UPPERCASE)
            value = "A";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                l.getMeridiem(components.hour, components.minute, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseMeridiemAsIsPM(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #isPM(value);
                };
            };
        },
        {
            // Meridiem (lowercase)
            value = "a";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let l = requireLocale(locale);
                l.getMeridiem(components.hour, components.minute, true);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let l = requireLocale(locale);
                let ?{ remainingText; value } = l.parseMeridiemAsIsPM(text) else return null;
                ?{
                    remainingText = remainingText;
                    value = #isPM(value);
                };
            };
        },
        {
            // Hour Padded (0-23)
            value = "HH";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.hour, 2, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(hour, remainingText) = extractNat(text, 2, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #hour(hour);
                };
            };
        },
        {
            // Hour (0-23)
            value = "H";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.hour);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(hour, remainingText) = extractNat(text, 2, false) else return null;
                ?{
                    remainingText = remainingText;
                    value = #hour(hour);
                };
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(hour, remainingText) = extractNat(text, 2, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #hour12(hour);
                };
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
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(hour, remainingText) = extractNat(text, 2, false) else return null;
                ?{
                    remainingText = remainingText;
                    value = #hour12(hour);
                };
            };
        },
        {
            // Hour Padded (1-24)
            value = "kk";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.hour + 1, 2, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(hour, remainingText) = extractNat(text, 2, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #hour(hour - 1);
                };
            };
        },
        {
            // Hour (1-24)
            value = "k";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.hour + 1);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(hour, remainingText) = extractNat(text, 2, false) else return null;
                ?{
                    remainingText = remainingText;
                    value = #hour(hour - 1);
                };
            };
        },
        {
            // Minute Padded
            value = "mm";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                TextUtil.toTextPaddedSign(components.minute, 2, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(minute, remainingText) = extractNat(text, 2, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #minute(minute);
                };
            };
        },
        {
            // Minute
            value = "m";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                Nat.toText(components.minute);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(minute, remainingText) = extractNat(text, 2, false) else return null;
                ?{
                    remainingText = remainingText;
                    value = #minute(minute);
                };
            };
        },
        {
            // Second Padded
            value = "ss";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let second = components.nanosecond / 1_000_000_000;
                TextUtil.toTextPaddedSign(second, 2, false);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(second, remainingText) = extractNat(text, 2, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #second(second);
                };
            };
        },
        {
            // Second
            value = "s";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let second = components.nanosecond / 1_000_000_000;
                Nat.toText(second);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(second, remainingText) = extractNat(text, 2, false) else return null;
                ?{
                    remainingText = remainingText;
                    value = #second(second);
                };
            };
        },
        {
            // Fractional Second (9 digits)
            value = "SSSSSSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 9);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(fNanoSeconds, remainingText) = extractNat(text, 9, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #fractionalNanosecond(fNanoSeconds);
                };
            };
        },
        {
            // Fractional Second (8 digits)
            value = "SSSSSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 8);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(fOctSeconds, remainingText) = extractNat(text, 8, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #fractionalNanosecond(fOctSeconds * 10);
                };
            };
        },
        {
            // Fractional Second (7 digits)
            value = "SSSSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 7);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(fSeptSeconds, remainingText) = extractNat(text, 7, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #fractionalNanosecond(fSeptSeconds * 100);
                };
            };
        },
        {
            // Fractional Second (6 digits)
            value = "SSSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 6);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(fHexSeconds, remainingText) = extractNat(text, 6, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #fractionalNanosecond(fHexSeconds * 1_000);
                };
            };
        },
        {
            // Fractional Second (5 digits)
            value = "SSSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 5);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(fPentSeconds, remainingText) = extractNat(text, 5, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #fractionalNanosecond(fPentSeconds * 10_000);
                };
            };
        },
        {
            // Fractional Second (4 digits)
            value = "SSSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 4);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(fQuadSeconds, remainingText) = extractNat(text, 4, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #fractionalNanosecond(fQuadSeconds * 100_000);
                };
            };
        },
        {
            // Fractional Second (3 digits)
            value = "SSS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 3);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(fMilliSeconds, remainingText) = extractNat(text, 3, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #fractionalNanosecond(fMilliSeconds * 1_000_000);
                };
            };
        },
        {
            // Fractional Second (2 digits)
            value = "SS";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 2);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(fCentiSeconds, remainingText) = extractNat(text, 2, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #fractionalNanosecond(fCentiSeconds * 10_000_000);
                };
            };
        },
        {
            // Fractional Second (1 digit)
            value = "S";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getFractionalSecond(components, 1);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(fDeciSeconds, remainingText) = extractNat(text, 1, true) else return null;
                ?{
                    remainingText = remainingText;
                    value = #fractionalNanosecond(fDeciSeconds * 100_000_000);
                };
            };
        },
        {
            // Time Zone Name
            value = "zz";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getTimeZoneInfo(components, timeZone).0;
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let (name, remainingText) = getNextWord(text);
                ?{
                    remainingText = remainingText;
                    value = #timeZoneDescriptor(#name(name));
                };
            };
        },
        {
            // Time Zone Name
            value = "z";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getTimeZoneInfo(components, timeZone).0;
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let (name, remainingText) = getNextWord(text);
                ?{
                    remainingText = remainingText;
                    value = #timeZoneDescriptor(#name(name));
                };
            };
        },
        {
            // Time Zone Offset, No Colon
            value = "ZZ";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let offset = getTimeZoneInfo(components, timeZone).1;
                Text.replace(offset, #char(':'), "");
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {

                let ?(hour, textWithoutHour) = extractInt(text, 2, true) else return null;
                let ?(minute, textWithoutMinute) = extractNat(textWithoutHour, 2, true) else return null;
                let (offsetSeconds, remainingText) = switch (extractNat(textWithoutMinute, 2, true)) {
                    case (null) {
                        let offsetSeconds = hour * 60 * 60 + minute * 60;
                        (offsetSeconds, textWithoutMinute);
                    };
                    case (?(second, remainingText)) {
                        let offsetSeconds = hour * 60 * 60 + minute * 60 + second;
                        (offsetSeconds, remainingText);
                    };
                };
                ?{
                    remainingText = remainingText;
                    value = #timeZoneDescriptor(#fixed(#seconds(offsetSeconds)));
                };
            };
        },
        {
            // Time Zone Offset
            value = "Z";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                getTimeZoneInfo(components, timeZone).1;
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                switch (Text.stripStart(text, #char('Z'))) {
                    case (?remainingText) {
                        // UTC
                        ?{
                            remainingText = remainingText;
                            value = #timeZoneDescriptor(#fixed(#seconds(0)));
                        };
                    };
                    case (null) {
                        // Parse as number
                        let ?(hour, textWithoutHour) = extractInt(text, 2, true) else return null;
                        let negativeModifier = if (hour < 0) -1 else 1;
                        let hourAbs = Int.abs(hour);
                        let ?textWithoutHourAndColon = Text.stripStart(textWithoutHour, #char(':')) else return null;
                        let ?(minute, textWithoutMinute) = extractNat(textWithoutHourAndColon, 2, true) else return null;
                        let offsetHourAndMinute = hourAbs * 60 * 60 + minute * 60;

                        let (offsetSeconds, remainingText) = switch (Text.stripStart(textWithoutMinute, #char(':'))) {
                            case (null) {
                                (offsetHourAndMinute, textWithoutMinute);
                            };
                            case (?textWithoutMinuteAndColon) {
                                let ?(second, textWithoutSecond) = extractNat(textWithoutMinuteAndColon, 2, true) else return null;
                                let offsetSeconds = offsetHourAndMinute + second;
                                (offsetSeconds, textWithoutSecond);
                            };
                        };
                        ?{
                            remainingText = remainingText;
                            value = #timeZoneDescriptor(#fixed(#seconds(offsetSeconds * negativeModifier)));
                        };
                    };
                };
            };
        },
        {
            // Unix Timestamp
            value = "X";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let time = toTime(components);
                Int.toText(time / 1_000_000_000);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(timestamp, remainingText) = extractInt(text, 10, false) else return null;
                ?{
                    remainingText = remainingText;
                    value = #time(timestamp * 1_000_000_000);
                };
            };
        },
        {
            // Unix Millisecond Timestamp
            value = "x";
            getter = func(components : Components, timeZone : TimeZone, locale : ?Locale) : Text {
                let time = toTime(components);
                Int.toText(time / 1_000_000);
            };
            extract = func(text : Text, locale : ?Locale) : ?ExtractResult {
                let ?(timestamp, remainingText) = extractInt(text, 10, false) else return null;
                ?{
                    remainingText = remainingText;
                    value = #time(timestamp * 1_000_000);
                };
            };
        },
    ];

    private func getFractionalSecond(components : Components, digits : Nat8) : Text {
        let seconds = Float.fromInt(components.nanosecond) / Float.fromInt(Nat.pow(10, Nat8.toNat(digits)));
        let fractionalSecond = seconds - Float.fromInt(Float.toInt(seconds)); // Remove integer part
        let formattedFloat = Float.format(#fix(digits), fractionalSecond);
        Text.replace(formattedFloat, #text("0."), ""); // Remove 0. from the beginning
    };
};
