import TimeZoneFinder "../iana/TimeZoneFinder";

let timeZone = TimeZoneFinder.find("America/New_York");
assert timeZone != null;
