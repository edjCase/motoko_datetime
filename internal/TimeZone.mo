import InternalTypes "Types";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";

module {

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

    
    public func getFixedOffsetSeconds(fixedTimeZone : FixedTimeZone) : Int {
        switch (fixedTimeZone) {
            case (#seconds(s)) s;
            case (#hours(h)) h * 3600;
        };
    };

};
