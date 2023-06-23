import Iter "mo:base/Iter";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
module {

    public func toTextPaddedSign(value : Int, length : Nat, includePositiveSign : Bool) : Text {
        let isNegative = value < 0;
        let natValue = Int.abs(value);
        let text = toTextPadded(natValue, length);
        if (isNegative) {
            "-" # text;
        } else {
            if (includePositiveSign) {
                "+" # text;
            } else {
                text;
            };
        };
    };

    public func toTextPadded(value : Nat, length : Nat) : Text {
        toTextPaddedSymb(value, length, "0");
    };

    public func toTextPaddedSymb(value : Nat, length : Nat, padChar : Text) : Text {
        var text = Nat.toText(value);
        if (text.size() < length) {
            // Pad with leading zeros
            for (a in Iter.range(0, length - text.size() - 1)) {
                text := padChar # text;
            };
        };
        text;
    };

    public func readTillEnd(iter : Iter.Iter<Char>, startChar : ?Char) : ?Text {
        var text : Text = switch (startChar) {
            case (null) "";
            case (?char) Text.fromChar(char);
        };
        label l loop {
            let ?char = iter.next() else break l;
            text #= Text.fromChar(char);
        };
        return if (text == "") null else ?text;
    };

    public func parseNat(iter : Iter.Iter<Char>, length : Nat) : ?Nat {
        var value : Text = "";
        for (a in Iter.range(0, length - 1)) {
            let ?char = iter.next() else return null;
            value #= Text.fromChar(char);
        };
        return Nat.fromText(value);
    };

    public func getOrdinal(nat : Nat) : Text {
        let lastDigit = nat % 10;
        let lastTwoDigits = nat % 100;
        if (lastTwoDigits >= 11 and lastTwoDigits <= 13) {
            return "th";
        } else {
            switch (lastDigit) {
                case (1) "st";
                case (2) "nd";
                case (3) "rd";
                case (_) "th";
            };
        };
    };

};
