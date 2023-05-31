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

    public type LocalDateTime = InternalTypes.LocalDateTime;

    public type TextFormat = InternalTypes.TextFormat;

    public func LocalDateTime(components : Components, timeZone : TimeZone) : LocalDateTime = object {
        if(not Components.isValid(components)){
            Debug.trap("Invalid components");
        };

        public func equal(other : LocalDateTime) : Bool {
            return compare(other) == #equal;
        };

        public func add(duration : DateTime.Duration) : LocalDateTime {
            switch(InternalComponents.resolveDuration(duration)) {
                case (#absoluteTime(nanoseconds)) {
                    let newComponents = Components.addTime(components, nanoseconds);
                    LocalDateTime(newComponents, timeZone);
                };
                case (#adder(adder)) {
                    // Convert the current datetime components to
                    let newComponents = adder(components);
                    LocalDateTime(newComponents, timeZone);
                };
            };
        };

        public func nanosecondsSince(other : LocalDateTime) : Int {
            let otherTime = other.toTime();
            return toTime() - otherTime;
        };

        public func toTime() : Time.Time {
            let offset = getOffsetSeconds();
            let newComponents = Components.addTime(components, -offset * 1_000_000_000);
            let ?time = Components.toTime(newComponents) else Prelude.unreachable();
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

        public func toComponents() : Components.Components {
            components;
        };

        public func isInLeapYear() : Bool {
            let year = toComponents().year;
            InternalComponents.isLeapYear(year);
        };

        public func compare(other : LocalDateTime) : Order.Order {
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
                        case (#hoursAndMinutes(h, m)) {
                            if (h < 0) {
                                h * 3600 - m * 60;
                            } else {
                                h * 3600 + m * 60;
                            };
                        };
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
            let minutes : Nat = (Int.abs(offsetSeconds) % 3600) / 60;
            let hoursText = InternalTextUtil.toTextPaddedSign(hours, 2, true);
            let minutesText = InternalTextUtil.toTextPadded(minutes, 2);
            hoursText # ":" # minutesText;
        };
    };
    
    public func fromComponents(components : Components, timeZone: TimeZone) : ?LocalDateTime {
        if(not Components.isValid(components)){
            return null;
        };
        ?LocalDateTime(components, timeZone);
    };

    public func equal(a : LocalDateTime, b : LocalDateTime) : Bool {
        return a.equal(b);
    };

    public func now(timeZone : TimeZone) : LocalDateTime {
        return fromTime(Time.now(), timeZone);
    };

    public func fromTime(nanoseconds : Time.Time, timeZone: TimeZone) : LocalDateTime {
        let utcComponents = Components.fromTime(nanoseconds);
        let offset = Components.getOffsetSeconds(utcComponents, timeZone);
        let localizedComponents = Components.addTime(utcComponents, offset * 1_000_000_000);
        LocalDateTime(localizedComponents, timeZone);
    };

    public func toText(dateTime : LocalDateTime) : Text {
        dateTime.toText();
    };

    public func toTextFormatted(dateTime : LocalDateTime, format : TextFormat) : Text {
        dateTime.toTextFormatted(format);
    };

    public func fromTextFormatted(text : Text, format : TextFormat) : ?LocalDateTime {
        do ? {
            let result = Components.fromTextFormatted(text, format)!;
            let timeZone : TimeZone = switch(result.timeZoneDescriptor){
                case (?d) TimeZone.fromDescriptor(d)!;
                case (null) TimeZone.utc();
            };
            LocalDateTime(result.components, timeZone);
        }
    };

};
