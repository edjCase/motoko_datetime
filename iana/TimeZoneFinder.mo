import Types "Types";
import Text "mo:core@1/Text";
import Array "mo:core@1/Array";
import TimeZoneList "TimeZoneList";
import TimeZone "../internal/TimeZone";
import TextX "mo:xtended-text@2/TextX";

module {
  type TimeZoneData = Types.TimeZoneData;

  public func find(timeZoneId : Text) : ?TimeZoneData {
    let timeZoneData = Array.find<TimeZoneData>(TimeZoneList.zoneData, func(tz) = tz.id == timeZoneId);
    if (timeZoneData == null and Text.startsWith(timeZoneId, #text("UTC"))) {
      // Test if it a fixed timezone like UTC+1 or UTC-02:30
      let timeZoneOffset = TextX.sliceToEnd(timeZoneId, 3);
      switch (TimeZone.parseDescriptor(timeZoneOffset)) {
        case (#fixed(f)) {
          let offsetSeconds = TimeZone.toFixedOffsetSeconds(f);
          ?{
            id = timeZoneId;
            rules = [{
              abbreviation = timeZoneId;
              expiration = null;
              offsetSeconds = offsetSeconds;
            }];
          };
        };
        case (_) null;
      };
    } else {
      timeZoneData;
    };
  };
};
