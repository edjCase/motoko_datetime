import Int "mo:base/Int";
import Types "../src/Types";

module {
    type Duration = Types.Duration;
    type DateTime = Types.DateTime;
    type Components = Types.Components;

    public func wrapInt(value : Int, min : Nat, max : Nat) : Nat {
        if (value < min) {
            let difference : Nat = Int.abs(min - value);
            return max - (difference - 1);
        } else if (value > max) {
            let difference : Nat = Int.abs(value - max);
            return min + (difference + 1);
        } else {
            return Int.abs(value);
        };
    };
};
