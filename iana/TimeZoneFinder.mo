import Types "Types";
import Text "mo:base/Text";
import Array "mo:base/Array";
import TimeZoneList "TimeZoneList";
import InternalTypes "../internal/Types";
import TimeZone "../internal/TimeZone";

module {
    type TimeZoneData = Types.TimeZoneData;

    public func find(timeZoneId : Text) : ?TimeZoneData {
        let timeZoneData = Array.find<TimeZoneData>(TimeZoneList.zoneData, func(tz) = tz.id == timeZoneId);
        if (timeZoneData == null) {
            // Test if it a fixed timezone like UTC+1 or UTC-02:30
            switch (TimeZone.parseDescriptor(timeZoneId)) {
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
