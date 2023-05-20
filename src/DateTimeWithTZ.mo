import Time "mo:base/Time";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Prelude "mo:base/Prelude";
import Order "mo:base/Order";
import DateTime "DateTime";
import InternalTypes "../internal/Types";
import InternalTextUtil "../internal/TextUtil";
import InternalNumberUtil "../internal/NumberUtil";
import InternalComponents "../internal/Components";
import Components "Components";
import TimeZone "TimeZone";

module  {

    public type DynamicTimeZone = InternalTypes.DynamicTimeZone;

    public type TimeZone = InternalTypes.TimeZone;

    public type Components = InternalTypes.Components;

    public type DateTimeWithTZ = InternalTypes.DateTimeWithTZ;

    public type TextFormat = InternalTypes.TextFormat;

    public func DateTimeWithTZ(components : Components, timeZone : TimeZone) : DateTimeWithTZ = object {
        if(not Components.isValid(components)){
            Debug.trap("Invalid components");
        };

        public func equal(other : DateTimeWithTZ) : Bool {
            return compare(other) == #equal;
        };

        public func add(duration : DateTime.Duration) : DateTimeWithTZ {
            switch(InternalComponents.resolveDuration(duration)) {
                case (#absoluteTime(nanoseconds)) {
                    let newComponents = Components.addTime(components, nanoseconds);
                    DateTimeWithTZ(newComponents, timeZone);
                };
                case (#adder(adder)) {
                    // Convert the current datetime components to
                    let newComponents = adder(components);
                    DateTimeWithTZ(newComponents, timeZone);
                };
            };
        };

        public func nanosecondsSince(other : DateTimeWithTZ) : Int {
            let otherTime = other.toTime();
            return toTime() - otherTime;
        };

        public func toTime() : Time.Time {
            let offset = getOffsetSeconds();            
            let newComponents = Components.addTime(components, offset);
            let ?time = Components.toTime(components) else Prelude.unreachable();
            time;
        };

        public func toText() : Text {
            return toTextFormatted(#iso8601);
        };

        public func toTextFormatted(format : DateTime.TextFormat) : Text {
            let components = toComponents();
            let timeZone = getTimeZoneDesignator();
            InternalComponents.toTextFormatted(components, format, timeZone);
        };

        public func toComponents() : DateTime.Components {
            components;
        };

        public func isLeapYear() : Bool {
            let year = toComponents().year;
            InternalComponents.isLeapYear(year);
        };

        public func compare(other : DateTimeWithTZ) : Order.Order {
            Int.compare(toTime(), other.toTime());
        };

        public func toUtcDateTime() : DateTime.DateTime {
            DateTime.DateTime(toTime());
        };

        public func getOffsetSeconds() : Int {
            switch (timeZone) {
                case (#fixed(f)) {
                    switch (f) {
                        case (#seconds(s)) s;
                        case (#hoursAndMinutes(h, m)) h * 3600 + m * 60;
                    };
                };
                case (#dynamic(d)) {
                    d.getOffsetSeconds(components);
                };
            };
        };

        public func getTimeZoneDesignator() : Text {
            let offsetSeconds = getOffsetSeconds();
            if (offsetSeconds == 0) {
                return "Z";
            };
            let hours : Int = offsetSeconds / 3600;
            let minutes : Nat = (Int.abs(hours) % 3600) / 60;
            let hoursText = InternalTextUtil.toTextPaddedSign(hours, 2, false);
            let minutesText = InternalTextUtil.toTextPadded(minutes, 2);
            hoursText # ":" # minutesText;
        };
    };
    
    public func fromComponents(components : Components, timeZone: TimeZone) : ?DateTimeWithTZ {
        return ?DateTimeWithTZ(components, timeZone);
    };

    public func equal(a : DateTimeWithTZ, b : DateTimeWithTZ) : Bool {
        return a.equal(b);
    };

    public func now(timeZone : TimeZone) : DateTimeWithTZ {
        return fromTime(Time.now(), timeZone);
    };

    public func fromTime(nanoseconds : Time.Time, timeZone: TimeZone) : DateTimeWithTZ {
        let components = Components.fromTime(nanoseconds);
        Debug.print(debug_show(components));
        let offset = Components.getOffsetSeconds(components, timeZone);
        Debug.print(debug_show(offset * 1000_000_000));
        let localizedComponents = Components.addTime(components, offset * 1000_000_000);
        Debug.print(debug_show(localizedComponents));
        DateTimeWithTZ(localizedComponents, timeZone);
    };

    public func toText(dateTime : DateTimeWithTZ) : Text {
        dateTime.toText();
    };

    public func toTextFormatted(dateTime : DateTimeWithTZ, format : TextFormat) : Text {
        dateTime.toTextFormatted(format);
    };

    public func fromTextFormatted(text : Text, format : TextFormat) : ?DateTimeWithTZ {
        do ? {
            let result = Components.fromTextFormatted(text, format)!;
            let timeZone : TimeZone = switch(result.timeZoneDescriptor){
                case (?d) TimeZone.fromDescriptor(d);
                case (null) TimeZone.utc();
            };
            DateTimeWithTZ(result.components, timeZone);
        }
    };

};
