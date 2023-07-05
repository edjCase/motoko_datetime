import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module EO {
	public let locale : Types.Locale = {
		id = "eo";
		weekdays = [
			"dimanĉo",
			"lundo",
			"mardo",
			"merkredo",
			"ĵaŭdo",
			"vendredo",
			"sabato",
		];
		weekdaysShort = [
			"dim",
			"lun",
			"mard",
			"merk",
			"ĵaŭ",
			"ven",
			"sab",
		];
		weekdaysMin = [
			"di",
			"lu",
			"ma",
			"me",
			"ĵa",
			"ve",
			"sa",
		];
		months = [
			"januaro",
			"februaro",
			"marto",
			"aprilo",
			"majo",
			"junio",
			"julio",
			"aŭgusto",
			"septembro",
			"oktobro",
			"novembro",
			"decembro",
		];
		monthsShort = [
			"jan",
			"feb",
			"mart",
			"apr",
			"maj",
			"jun",
			"jul",
			"aŭg",
			"sept",
			"okt",
			"nov",
			"dec",
		];
		firstDayOfWeek = 1;
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
