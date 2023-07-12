import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module DA {
	public let locale : Types.Locale = {
		id = "da";
		weekdays = [
			"søndag",
			"mandag",
			"tirsdag",
			"onsdag",
			"torsdag",
			"fredag",
			"lørdag",
		];
		weekdaysShort = [
			"søn",
			"man",
			"tir",
			"ons",
			"tor",
			"fre",
			"lør",
		];
		weekdaysMin = [
			"sø",
			"ma",
			"ti",
			"on",
			"to",
			"fr",
			"lø",
		];
		months = [
			"januar",
			"februar",
			"marts",
			"april",
			"maj",
			"juni",
			"juli",
			"august",
			"september",
			"oktober",
			"november",
			"december",
		];
		monthsShort = [
			"jan",
			"feb",
			"mar",
			"apr",
			"maj",
			"jun",
			"jul",
			"aug",
			"sep",
			"okt",
			"nov",
			"dec",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
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
