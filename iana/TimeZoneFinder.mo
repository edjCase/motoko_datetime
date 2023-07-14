import Types "Types";
import Text "mo:base/Text";
import Array "mo:base/Array";
import TimeZoneList "TimeZoneList";
import InternalTypes "../internal/Types";

module {
    type TimeZoneData = Types.TimeZoneData;

    public func find(timeZoneId : Text) : ?TimeZoneData {
        Array.find<TimeZoneData>(TimeZoneList.zoneData, func(tz) = tz.id == timeZoneId);
    };
};
