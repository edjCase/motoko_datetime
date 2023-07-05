import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module CA {
	public let locale : Types.Locale = {
		id = "ca";
		weekdays = [
			"diumenge",
			"dilluns",
			"dimarts",
			"dimecres",
			"dijous",
			"divendres",
			"dissabte",
		];
		weekdaysShort = [
			"dg.",
			"dl.",
			"dt.",
			"dc.",
			"dj.",
			"dv.",
			"ds.",
		];
		weekdaysMin = [
			"dg",
			"dl",
			"dt",
			"dc",
			"dj",
			"dv",
			"ds",
		];
		months = [
			"gener",
			"febrer",
			"març",
			"abril",
			"maig",
			"juny",
			"juliol",
			"agost",
			"setembre",
			"octubre",
			"novembre",
			"desembre",
		];
		monthsShort = [
			"gen.",
			"febr.",
			"març",
			"abr.",
			"maig",
			"juny",
			"jul.",
			"ag.",
			"set.",
			"oct.",
			"nov.",
			"des.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "H:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
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
