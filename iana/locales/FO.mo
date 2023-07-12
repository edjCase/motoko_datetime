import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module FO {
	public let locale : Types.Locale = {
		id = "fo";
		weekdays = [
			"sunnudagur",
			"mánadagur",
			"týsdagur",
			"mikudagur",
			"hósdagur",
			"fríggjadagur",
			"leygardagur",
		];
		weekdaysShort = [
			"sun",
			"mán",
			"týs",
			"mik",
			"hós",
			"frí",
			"ley",
		];
		weekdaysMin = [
			"su",
			"má",
			"tý",
			"mi",
			"hó",
			"fr",
			"le",
		];
		months = [
			"januar",
			"februar",
			"mars",
			"apríl",
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
			"jan",
			"feb",
			"mar",
			"apr",
			"mai",
			"jun",
			"jul",
			"aug",
			"sep",
			"okt",
			"nov",
			"des",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
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
