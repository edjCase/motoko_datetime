import InternalTypes "Types";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import TextUtil "TextUtil";
import Int "mo:base/Int";

module {
    type Components = InternalTypes.Components;
    type TimeZone = InternalTypes.TimeZone;
    type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor;
    type FixedTimeZone = InternalTypes.FixedTimeZone;

    public func parseDescriptor(descriptor : Text) : ?TimeZoneDescriptor {
        do ? {
            if (descriptor == "") {
                return ? #unspecified;
            };
            if (descriptor == "Z") {
                return ? #utc;
            };
            if (descriptor.size() != 6 and descriptor.size() != 9) {
                return null;
            };
            let splitIter = Text.split(descriptor, #char(':'));
            var hoursText = splitIter.next()!;

            let iter = Text.toIter(hoursText);
            let sign = iter.next()!;
            let isNegative : Bool = switch (sign) {
                case ('+') false;
                case ('-') true;
                case (_) return null;
            };
            hoursText := Text.fromIter(iter);
            let minutesText = splitIter.next()!;
            let secondsText : ?Text = splitIter.next();
            let hours : Nat = Nat.fromText(hoursText)!;
            let minutes = Nat.fromText(minutesText)!;
            let seconds : Nat = switch (secondsText) {
                case (null) 0;
                case (?s) Nat.fromText(s)!;
            };
            let totalSeconds : Int = hours * 3600 + minutes * 60 + seconds;
            if (isNegative) {
                #fixed(#seconds(-totalSeconds));
            } else {
                #fixed(#seconds(totalSeconds));
            };
        };
    };

    public func toOffsetSeconds(timeZone : TimeZone, components : Components) : Int {
        switch (timeZone) {
            case (#fixed(f)) toFixedOffsetSeconds(f);
            case (#dynamic(d)) d.toOffsetSeconds(components);
        };
    };

    public func toFixedOffsetSeconds(fixedTimeZone : FixedTimeZone) : Int {
        switch (fixedTimeZone) {
            case (#seconds(s)) s;
            case (#hours(h)) h * 3600;
        };
    };

    public func getOffsetText(offsetSeconds : Int) : Text {
        let isNegative : Bool = offsetSeconds < 0;
        let absOffsetSeconds : Nat = Int.abs(offsetSeconds);
        let hours = absOffsetSeconds / 3600;
        let minutes = (absOffsetSeconds % 3600) / 60;
        let seconds = absOffsetSeconds % 60;
        let sign = if (isNegative) "-" else "+";
        let hoursText = TextUtil.toTextPadded(hours, 2);
        let minutesText = TextUtil.toTextPadded(minutes, 2);
        let text = sign # hoursText # ":" # minutesText;
        switch (seconds) {
            case (0) text;
            case (s) text # ":" # TextUtil.toTextPadded(s, 2);
        };
    };

};
