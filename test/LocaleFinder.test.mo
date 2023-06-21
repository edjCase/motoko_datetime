import LocaleFinder "../iana/LocaleFinder";

let locale = LocaleFinder.find("America/New_York");
assert locale != null;
