import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module PL {
	public let locale : Types.Locale = {
		id = "pl";
		weekdays = [
			"niedziela",
			"poniedziałek",
			"wtorek",
			"środa",
			"czwartek",
			"piątek",
			"sobota",
		];
		weekdaysShort = [
			"ndz",
			"pon",
			"wt",
			"śr",
			"czw",
			"pt",
			"sob",
		];
		weekdaysMin = [
			"Nd",
			"Pn",
			"Wt",
			"Śr",
			"Cz",
			"Pt",
			"So",
		];
		months = [
			"styczeń",
			"luty",
			"marzec",
			"kwiecień",
			"maj",
			"czerwiec",
			"lipiec",
			"sierpień",
			"wrzesień",
			"październik",
			"listopad",
			"grudzień",
		];
		monthsShort = [
			"sty",
			"lut",
			"mar",
			"kwi",
			"maj",
			"cze",
			"lip",
			"sie",
			"wrz",
			"paź",
			"lis",
			"gru",
		];
		firstDayOfWeek = 1;
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
