import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module LV {
	public let locale : Types.Locale = {
		id = "lv";
		weekdays = [
			"svētdiena",
			"pirmdiena",
			"otrdiena",
			"trešdiena",
			"ceturtdiena",
			"piektdiena",
			"sestdiena",
		];
		weekdaysShort = [
			"Sv",
			"P",
			"O",
			"T",
			"C",
			"Pk",
			"S",
		];
		weekdaysMin = [
			"Sv",
			"P",
			"O",
			"T",
			"C",
			"Pk",
			"S",
		];
		months = [
			"janvāris",
			"februāris",
			"marts",
			"aprīlis",
			"maijs",
			"jūnijs",
			"jūlijs",
			"augusts",
			"septembris",
			"oktobris",
			"novembris",
			"decembris",
		];
		monthsShort = [
			"jan",
			"feb",
			"mar",
			"apr",
			"mai",
			"jūn",
			"jūl",
			"aug",
			"sep",
			"okt",
			"nov",
			"dec",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY.";
		dateTimeFormat = "HH:mm DD.MM.YYYY.";
		longDateFormat = "DD.MM.YYYY.";
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
