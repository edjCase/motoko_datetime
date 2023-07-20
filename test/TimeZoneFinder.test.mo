import TimeZoneFinder "../iana/TimeZoneFinder";
import EN "../iana/locales/EN";
import AmericaTimeZones "../iana/timezones/America";

let timeZone = TimeZoneFinder.find("America/New_York");
assert timeZone != null;

let timeZone2 = TimeZoneFinder.find("UTC+3");
assert timeZone2 != null;
let timeZone3 = TimeZoneFinder.find("UTC+03:00");
assert timeZone3 != null;
