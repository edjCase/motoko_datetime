import InternalTypes "../internal/Types";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
module {

    public type TimeZone = InternalTypes.TimeZone;
    public type Offset = InternalTypes.FixedTimeZone;

    public func utc() : TimeZone {
        return #fixed(#seconds(0));
    };

    public func withFixedOffset(offset : Offset) : TimeZone {
        return #fixed(offset);
    };

    public func fromDescriptor(descriptor : Text) : ?TimeZone {
        do ? {
            if (descriptor == "Z") {
                utc();
            } else {
                if (descriptor.size() != 6) {
                    return null;
                };
                let splitIter = Text.split(descriptor, #char(':'));
                var hoursText = splitIter.next()!;
                
                let iter = Text.toIter(hoursText);
                let sign = iter.next()!;
                let isNegative: Bool = switch(sign){
                    case ('+') false;
                    case ('-') true;
                    case (_) return null;
                };
                hoursText := Text.fromIter(iter);
                let minutesText = splitIter.next()!;
                var hours : Int = Nat.fromText(hoursText)!;
                if (isNegative) {
                    hours := -1 * hours;
                };
                let minutes = Nat.fromText(minutesText)!;
                #fixed(#hoursAndMinutes(hours, minutes));
            };
        };
    };
};
