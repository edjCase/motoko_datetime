import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module FI {
	public let locale : Types.Locale = {
		id = "fi";
		weekdays = [
			"sunnuntai",
			"maanantai",
			"tiistai",
			"keskiviikko",
			"torstai",
			"perjantai",
			"lauantai",
		];
		weekdaysShort = [
			"su",
			"ma",
			"ti",
			"ke",
			"to",
			"pe",
			"la",
		];
		weekdaysMin = [
			"su",
			"ma",
			"ti",
			"ke",
			"to",
			"pe",
			"la",
		];
		months = [
			"tammikuu",
			"helmikuu",
			"maaliskuu",
			"huhtikuu",
			"toukokuu",
			"kesäkuu",
			"heinäkuu",
			"elokuu",
			"syyskuu",
			"lokakuu",
			"marraskuu",
			"joulukuu",
		];
		monthsShort = [
			"tammi",
			"helmi",
			"maalis",
			"huhti",
			"touko",
			"kesä",
			"heinä",
			"elo",
			"syys",
			"loka",
			"marras",
			"joulu",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH.mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH.mm DD.MM.YYYY";
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
