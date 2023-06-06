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

    public type DateTime = {
        equal : (other : DateTime) -> Bool;

        add : (duration : Duration) -> DateTime;

        timeSince : (other : DateTime) -> Time.Time;

        toTime : () -> Time.Time;

        toText : () -> Text;

        toTextFormatted : (format : TextFormat) -> Text;

        toComponents : () -> Components;

        isInLeapYear : () -> Bool;

        compare : (other : DateTime) -> Order.Order;
    };

    public type LocalDateTime = {
        equal : (other : LocalDateTime) -> Bool;

        add : (duration : Duration) -> LocalDateTime;

        timeSince : (other : LocalDateTime) -> Time.Time;

        toTime : () -> Time.Time;

        toText : () -> Text;

        toTextFormatted : (format : TextFormat) -> Text;

        toComponents : () -> Components;

        isInLeapYear : () -> Bool;

        compare : (other : LocalDateTime) -> Order.Order;
    };
};
