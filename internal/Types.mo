import Time "mo:base/Time";
import Order "mo:base/Order";
module {
    public type Locale = {
        id : Text;
        weekdays : [Text];
        weekdaysShort : [Text];
        weekdaysMin : [Text];
        months : [Text];
        monthsShort : [Text];
        firstDayOfWeek : DayOfWeek;
        firstDayOfYear : Nat;
        timeFormat : Text;
        dateFormat : Text;
        dateTimeFormat : Text;
        longDateFormat : Text;
        eras : [Era];
        getMeridiem : (hour : Nat, minute : Nat, isLower : Bool) -> Text;
        parseMeridiemAsIsPM : (text : Text) -> ?{
            remainingText : Text;
            value : Bool;
        };
        getOrdinal : (num : Int) -> Text;
        parseOrdinal : (text : Text) -> ?{ remainingText : Text; value : Nat };
    };

    public type Era = {
        start : ?Time.Time;
        end : ?Time.Time;
        offset : Int;
        fullName : Text;
        narrowName : Text;
        abbreviatedName : Text;
    };

    public type TimeZoneData = {
        id : Text;
        rules : [TimeZoneRule];
    };

    public type TimeZoneRule = {
        abbreviation : Text;
        expiration : ?Int;
        offsetSeconds : Int;
    };

    public type DateDuration = {
        #days : Int;
        #weeks : Int;
        #months : Int;
        #years : Int;
    };

    public type TimeDuration = {
        #nanoseconds : Int;
        #milliseconds : Int;
        #seconds : Int;
        #minutes : Int;
        #hours : Int;
    };

    public type Duration = DateDuration or TimeDuration;

    public type DateComponents = {
        year : Int;
        month : Nat;
        day : Nat;
    };

    public type TimeComponents = {
        hour : Nat;
        minute : Nat;
        nanosecond : Nat;
    };

    public type Components = DateComponents and TimeComponents;

    public type DayOfWeek = {
        #sunday;
        #monday;
        #tuesday;
        #wednesday;
        #thursday;
        #friday;
        #saturday;
    };

    public type AdvanceDayOfWeekOptions = {
        addWeekOnMatchingDay : Bool;
    };

    public type AdvanceDayOfWeekOptionsWithTime = AdvanceDayOfWeekOptions and {
        resetToStartOfDay : Bool;
    };

    public type TextFormat = {
        #iso;
        #custom : {
            format : Text;
            locale : ?Locale;
        };
    };

    public type FromTextResult = {
        components : Components;
        timeZoneDescriptor : TimeZoneDescriptor;
    };

    public type TimeZoneDescriptor = {
        #unspecified;
        #utc;
        #fixed : FixedTimeZone;
        #name : Text;
    };

    public type TimeZone = {
        #fixed : FixedTimeZone;
        #dynamic : DynamicTimeZone;
    };

    public type DynamicTimeZone = {
        getAbbr : (components : Components) -> Text;
        toOffsetSeconds : (components : Components) -> Int;
    };

    public type FixedTimeZone = {
        #hours : Int;
        #seconds : Int;
    };

    type DateTimeType<T> = {
        equal : (other : T) -> Bool;

        add : (duration : Duration) -> T;

        timeBetween : (other : T) -> Time.Time;

        toTime : () -> Time.Time;

        toText : () -> Text;

        toTextFormatted : (format : TextFormat) -> Text;

        toComponents : () -> Components;

        isInLeapYear : () -> Bool;

        compare : (other : T) -> Order.Order;

        dayOfYear : () -> Nat;

        dayOfWeek : () -> DayOfWeek;

        advanceToDayOfWeek(dayOfWeek : DayOfWeek, options : AdvanceDayOfWeekOptionsWithTime) : T;
    };

    public type DateTime = DateTimeType<DateTime> and {
        weekOfYear : () -> Nat;

        weekYear : () -> Int;
    };

    public type LocaleStartOfYear = {
        firstDayOfWeek : DayOfWeek;
        firstDayOfYear : Nat;
    };

    public type StartOfYear = {
        #iso;
        #locale : LocaleStartOfYear;
    };

    public type LocalDateTime = DateTimeType<LocalDateTime> and {
        toDateTime : () -> DateTime;

        timeZone : TimeZone;

        weekOfYear : (startOfYear : StartOfYear) -> Nat;

        weekYear : (startOfYear : StartOfYear) -> Int;

        withTimeZone(timeZone : TimeZone) : LocalDateTime;
    };
};
