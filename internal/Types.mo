import Time "mo:base/Time";
import Order "mo:base/Order";
module {

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

    public type Components = {
        year : Int;
        month : Nat;
        day : Nat;
        hour : Nat;
        minute : Nat;
        nanosecond : Nat;
    };

    public type TextFormat = {
        #iso8601;
    };

    public type TimeZoneDescriptor = {
        #unspecified;
        #utc;
        #fixed : FixedTimeZone;
    };

    public type TimeZone = {
        #fixed : FixedTimeZone;
        #dynamic : DynamicTimeZone;
    };

    public type DynamicTimeZone = {
        getOffsetSeconds : (components : Components) -> Int;
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

        getTimeZone: () -> TimeZone;
    };
};
