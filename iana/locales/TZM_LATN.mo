import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TZM_LATN {
	public let locale : Types.Locale = {
		id = "tzm-latn";
		weekdays = [
			"asamas",
			"aynas",
			"asinas",
			"akras",
			"akwas",
			"asimwas",
			"asiḍyas",
		];
		weekdaysShort = [
			"asamas",
			"aynas",
			"asinas",
			"akras",
			"akwas",
			"asimwas",
			"asiḍyas",
		];
		weekdaysMin = [
			"asamas",
			"aynas",
			"asinas",
			"akras",
			"akwas",
			"asimwas",
			"asiḍyas",
		];
		months = [
			"innayr",
			"brˤayrˤ",
			"marˤsˤ",
			"ibrir",
			"mayyw",
			"ywnyw",
			"ywlywz",
			"ɣwšt",
			"šwtanbir",
			"ktˤwbrˤ",
			"nwwanbir",
			"dwjnbir",
		];
		monthsShort = [
			"innayr",
			"brˤayrˤ",
			"marˤsˤ",
			"ibrir",
			"mayyw",
			"ywnyw",
			"ywlywz",
			"ɣwšt",
			"šwtanbir",
			"ktˤwbrˤ",
			"nwwanbir",
			"dwjnbir",
		];
		firstDayOfWeek = #saturday;
		firstDayOfYear = 12;
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
