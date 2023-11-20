import Types "../src/Types";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import TextUtil "TextUtil";
import Int "mo:base/Int";
import TextX "mo:xtended-text/TextX";

module {
    type Components = Types.Components;
    type TimeZone = Types.TimeZone;
    type TimeZoneDescriptor = Types.TimeZoneDescriptor;
    type FixedTimeZone = Types.FixedTimeZone;

    public func parseDescriptor(descriptor : Text) : TimeZoneDescriptor {
        switch (parseDescriptorInternal(descriptor)) {
            case (?d) d;
            case (null) #name(descriptor); // fallback to it being a name
        };
    };

    private func parseDescriptorInternal(descriptor : Text) : ?TimeZoneDescriptor {
        do ? {
            if (descriptor == "") {
                return ? #unspecified;
            };
            if (descriptor == "Z") {
                return ? #utc;
            };
            let utcTrimmed = if (Text.startsWith(descriptor, #text("UTC"))) {
                TextX.sliceToEnd(descriptor, 3); // Remove UTC prefix from UTC+00:00
            } else {
                descriptor;
            };
            let (isNegative, signTrimmed) : (Bool, Text) = switch (TextX.slice(utcTrimmed, 0, 1)) {
                case ("+")(false, TextX.sliceToEnd(utcTrimmed, 1));
                case ("-")(true, TextX.sliceToEnd(utcTrimmed, 1));
                case (_)(false, utcTrimmed);
            };
            let splitIter = Text.split(signTrimmed, #char(':'));

            let hours = switch (splitIter.next()) {
                case (null) return ? #utc;
                case (?h) Nat.fromText(h)!;
            };
            let minutes : Nat = switch (splitIter.next()) {
                case (null) 0;
                case (?m) Nat.fromText(m)!;
            };
            let seconds : Nat = switch (splitIter.next()) {
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
