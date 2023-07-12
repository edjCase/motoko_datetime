import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SV {
	public let locale : Types.Locale = {
		id = "sv";
		weekdays = [
			"söndag",
			"måndag",
			"tisdag",
			"onsdag",
			"torsdag",
			"fredag",
			"lördag",
		];
		weekdaysShort = [
			"sön",
			"mån",
			"tis",
			"ons",
			"tor",
			"fre",
			"lör",
		];
		weekdaysMin = [
			"sö",
			"må",
			"ti",
			"on",
			"to",
			"fr",
			"lö",
		];
		months = [
			"januari",
			"februari",
			"mars",
			"april",
			"maj",
			"juni",
			"juli",
			"augusti",
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
