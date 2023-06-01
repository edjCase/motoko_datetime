import InternalTypes "Types";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

module {

    type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor;

    public func parseDescriptor(descriptor : Text) : ?TimeZoneDescriptor {
        do ? {
            if (descriptor == "") {
                return ?#unspecified;
            };
            if (descriptor == "Z") {
                return ?#utc;
            };
            if (descriptor.size() != 6) {
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
            var hours : Int = Nat.fromText(hoursText)!;
            if (isNegative) {
                hours := -1 * hours;
            };
            let minutes = Nat.fromText(minutesText)!;
            #hoursAndMinutes(hours, minutes);
        };
    };
};
