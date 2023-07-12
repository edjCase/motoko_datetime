import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module HR {
	public let locale : Types.Locale = {
		id = "hr";
		weekdays = [
			"nedjelja",
			"ponedjeljak",
			"utorak",
			"srijeda",
			"četvrtak",
			"petak",
			"subota",
		];
		weekdaysShort = [
			"ned.",
			"pon.",
			"uto.",
			"sri.",
			"čet.",
			"pet.",
			"sub.",
		];
		weekdaysMin = [
			"ne",
			"po",
			"ut",
			"sr",
			"če",
			"pe",
			"su",
		];
		months = [
			"siječanj",
			"veljača",
			"ožujak",
			"travanj",
			"svibanj",
			"lipanj",
			"srpanj",
			"kolovoz",
			"rujan",
			"listopad",
			"studeni",
			"prosinac",
		];
		monthsShort = [
			"sij.",
			"velj.",
			"ožu.",
			"tra.",
			"svi.",
			"lip.",
			"srp.",
			"kol.",
			"ruj.",
			"lis.",
			"stu.",
			"pro.",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
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
