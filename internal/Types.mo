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
        firstDayOfWeek : Nat;
        firstDayOfYear : Nat;
        timeFormat : Text;
        dateFormat : Text;
        dateTimeFormat : Text;
        longDateFormat : Text;
        eras : [Era];
        // TODO
        // getMeridiem : (hour : Nat, minute : Nat, isLower : Bool) -> Text;
        // getOrdinal : (num : Nat) -> Text;

    };

    public type Era = {
        start : ?Time.Time;
        end : ?Time.Time;
        offset : Int;
        fullName : Text;
        narrowName : Text;
        abbreviatedName : Text;
    };

    public type Region = {
        id : Text;
        timeZoneRules : [RegionTimeZoneRule];
    };

    public type RegionTimeZoneRule = {
        abbreviation : Text;
        expiration : ?Int;
        offsetSeconds : Int;
    };

    public type Duration = {
        #nanoseconds : Int;
        #milliseconds : Int;
        #seconds : Int;
        #minutes : Int;
        #hours : Int;
        #days : Int;
        #weeks : Int;
        #months : Int;
        #years : Int;
    };

    public type DateComponents = {
        year : Int;
        month : Nat;
        day : Nat;
    };

    public type Components = DateComponents and {
        hour : Nat;
        minute : Nat;
        nanosecond : Nat;
    };

    public type DayOfWeek = {
        #sunday;
        #monday;
        #tuesday;
        #wednesday;
        #thursday;
        #friday;
        #saturday;
    };

    public type TextFormat = {
        #iso8601;
        #custom : {
            format : Text;
            locale : Locale;
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
    };

    public type DateTime = DateTimeType<DateTime>;

    public type LocalDateTime = DateTimeType<LocalDateTime> and {
        toUtcDateTime : () -> DateTime;

        getTimeZone : () -> TimeZone;
    };
};
