import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module NN {
	public let locale : Types.Locale = {
		id = "nn";
		weekdays = [
			"sundag",
			"måndag",
			"tysdag",
			"onsdag",
			"torsdag",
			"fredag",
			"laurdag",
		];
		weekdaysShort = [
			"su.",
			"må.",
			"ty.",
			"on.",
			"to.",
			"fr.",
			"lau.",
		];
		weekdaysMin = [
			"su",
			"må",
			"ty",
			"on",
			"to",
			"fr",
			"la",
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
