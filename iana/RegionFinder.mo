import Types "Types";
import Text "mo:base/Text";
import Array "mo:base/Array";
import RegionList "RegionList";

module {
    type Region = Types.Region;

    public func find(regionId : Text) : ?Region {
        Array.find<Region>(RegionList.regions, func(region) = region.id == regionId);
    };
};
