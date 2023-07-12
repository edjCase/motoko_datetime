import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module NB {
	public let locale : Types.Locale = {
		id = "nb";
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
			"sø.",
			"ma.",
			"ti.",
			"on.",
			"to.",
			"fr.",
			"lø.",
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
			"mars",
			"april",
			"mai",
			"juni",
			"juli",
			"august",
			"september",
			"oktober",
			"november",
			"desember",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"mars",
			"apr.",
			"mai",
			"juni",
			"juli",
			"aug.",
			"sep.",
			"okt.",
			"nov.",
			"des.",
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
