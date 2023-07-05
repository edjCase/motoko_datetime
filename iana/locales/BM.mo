import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module BM {
	public let locale : Types.Locale = {
		id = "bm";
		weekdays = [
			"Kari",
			"Ntɛnɛn",
			"Tarata",
			"Araba",
			"Alamisa",
			"Juma",
			"Sibiri",
		];
		weekdaysShort = [
			"Kar",
			"Ntɛ",
			"Tar",
			"Ara",
			"Ala",
			"Jum",
			"Sib",
		];
		weekdaysMin = [
			"Ka",
			"Nt",
			"Ta",
			"Ar",
			"Al",
			"Ju",
			"Si",
		];
		months = [
			"Zanwuyekalo",
			"Fewuruyekalo",
			"Marisikalo",
			"Awirilikalo",
			"Mɛkalo",
			"Zuwɛnkalo",
			"Zuluyekalo",
			"Utikalo",
			"Sɛtanburukalo",
			"ɔkutɔburukalo",
			"Nowanburukalo",
			"Desanburukalo",
		];
		monthsShort = [
			"Zan",
			"Few",
			"Mar",
			"Awi",
			"Mɛ",
			"Zuw",
			"Zul",
			"Uti",
			"Sɛt",
			"ɔku",
			"Now",
			"Des",
		];
		firstDayOfWeek = 1;
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
