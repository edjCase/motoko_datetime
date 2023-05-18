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
            text;
        };
    };

    public func toTextPadded(value : Nat, length : Nat) : Text {
        var text = Nat.toText(value);
        if (text.size() < length) {
            // Pad with leading zeros
            for (a in Iter.range(0, length - text.size() - 1)) {
                text := "0" # text;
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
    
};