import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module UG_CN {
	public let locale : Types.Locale = {
		id = "ug-cn";
		weekdays = [
			"يەكشەنبە",
			"دۈشەنبە",
			"سەيشەنبە",
			"چارشەنبە",
			"پەيشەنبە",
			"جۈمە",
			"شەنبە",
		];
		weekdaysShort = [
			"يە",
			"دۈ",
			"سە",
			"چا",
			"پە",
			"جۈ",
			"شە",
		];
		weekdaysMin = [
			"يە",
			"دۈ",
			"سە",
			"چا",
			"پە",
			"جۈ",
			"شە",
		];
		months = [
			"يانۋار",
			"فېۋرال",
			"مارت",
			"ئاپرېل",
			"ماي",
			"ئىيۇن",
			"ئىيۇل",
			"ئاۋغۇست",
			"سېنتەبىر",
			"ئۆكتەبىر",
			"نويابىر",
			"دېكابىر",
		];
		monthsShort = [
			"يانۋار",
			"فېۋرال",
			"مارت",
			"ئاپرېل",
			"ماي",
			"ئىيۇن",
			"ئىيۇل",
			"ئاۋغۇست",
			"سېنتەبىر",
			"ئۆكتەبىر",
			"نويابىر",
			"دېكابىر",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
		eras = [
			{
				start = ?-62135568422000000;
				end = null;
				offset = 1;
				fullName = "Anno Domini";
				narrowName = "AD";
				abbreviatedName = "AD";
			},
			{
				start = null;
				end = ?-62135654822000000;
				offset = 1;
				fullName = "Before Christ";
				narrowName = "BC";
				abbreviatedName = "BC";
			},
		];
	};
};
