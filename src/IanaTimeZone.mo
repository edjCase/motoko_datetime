import Types "Types";
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
    type TimeZoneData = Types.TimeZoneData;

    public class IanaTimeZone(data : TimeZoneData) : Types.DynamicTimeZone {

        public func getAbbr(dateTime : Types.Components) : Text {
            let rule = getRule(dateTime);
            rule.abbreviation;
        };

        public func toOffsetSeconds(dateTime : Types.Components) : Int {
            let utcTime = Components.toTime(dateTime);
            let utcSeconds = utcTime / 1000000;
            let rule = getRule(dateTime);
            rule.offsetSeconds;
        };

        private func getRule(components : Types.Components) : Types.TimeZoneRule {
            let utcTime = Components.toTime(components);
            let utcSeconds = utcTime / 1000000;
            label f for (rule in Iter.fromArray(data.rules)) {
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
                return rule;
            };
            Prelude.unreachable();
        };
    };
};
