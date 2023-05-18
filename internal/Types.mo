import Time "mo:base/Time";
import Order "mo:base/Order";
module {

    public type Duration = {
        #nanoseconds : Int;
        #milliseconds : Int;
        #seconds : Int;
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

    public type DynamicTimeZone = {
        getOffsetSeconds : (components : Components) -> Int;
    };

    public type FixedTimeZone = {
        #seconds : Int;
        #hoursAndMinutes : (Int, Nat);
    };

    public type TimeZone = {
        #fixed : FixedTimeZone;
        #dynamic : DynamicTimeZone;
    };

    public type DateTime = {
        equal : (other : DateTime) -> Bool;

        add : (duration : Duration) -> DateTime;

        nanosecondsSince : (other : DateTime) -> Int;

        toTime : () -> Time.Time;

        toText : () -> Text;

        toTextFormatted : (format : TextFormat) -> Text;

        toComponents : () -> Components;

        isLeapYear : () -> Bool;

        compare : (other : DateTime) -> Order.Order;
    };

    public type DateTimeWithTZ = {
        equal : (other : DateTimeWithTZ) -> Bool;

        add : (duration : Duration) -> DateTimeWithTZ;

        nanosecondsSince : (other : DateTimeWithTZ) -> Int;

        toTime : () -> Time.Time;

        toText : () -> Text;

        toTextFormatted : (format : TextFormat) -> Text;

        toComponents : () -> Components;

        isLeapYear : () -> Bool;

        compare : (other : DateTimeWithTZ) -> Order.Order;
    };
};
