import Types "Types";
import Text "mo:core/Text";
import Components "Components";
import Iter "mo:core/Iter";
import Runtime "mo:core/Runtime";

module {
  type TimeZoneData = Types.TimeZoneData;

  public class IanaTimeZone(data : TimeZoneData) : Types.DynamicTimeZone {

    public func getAbbr(dateTime : Types.Components) : Text {
      let rule = getRule(dateTime);
      rule.abbreviation;
    };

    public func toOffsetSeconds(dateTime : Types.Components) : Int {
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
      Runtime.unreachable();
    };
  };
};
