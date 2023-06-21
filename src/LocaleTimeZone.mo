import InternalTypes "../internal/Types";
import DateTime "DateTime";
import IanaTypes = "../iana/Types";
import Text "mo:base/Text";
import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Components "Components";
import Iter "mo:base/Iter";
import Float "mo:base/Float";
import Prelude "mo:base/Prelude";

module {
    type Locale = IanaTypes.Locale;

    public class LocaleTimeZone(locale : Locale) : InternalTypes.DynamicTimeZone {

        public func toOffsetSeconds(dateTime : InternalTypes.Components) : Int {
            let ?utcTime = Components.toTime(dateTime) else Debug.trap("Invalid datetime components: " # debug_show (dateTime));
            let utcSeconds = utcTime / 1000000;
            label f for (rule in Iter.fromArray(locale.rules)) {
                switch (rule.expiration) {
                    case (?expiration) {
                        if (utcSeconds > expiration) {
                            continue f;
                        };
                    };
                    case (null) {
                        // Skip, no expiration
                    };
                };
                return rule.offsetSeconds;
            };
            Prelude.unreachable();
        };
    };
};
