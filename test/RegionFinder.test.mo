import RegionFinder "../iana/RegionFinder";

let region = RegionFinder.find("America/New_York");
assert region != null;
