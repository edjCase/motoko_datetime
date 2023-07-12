import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module FR_CA {
	public let locale : Types.Locale = {
		id = "fr-ca";
		weekdays = [
			"dimanche",
			"lundi",
			"mardi",
			"mercredi",
			"jeudi",
			"vendredi",
			"samedi",
		];
		weekdaysShort = [
			"dim.",
			"lun.",
			"mar.",
			"mer.",
			"jeu.",
			"ven.",
			"sam.",
		];
		weekdaysMin = [
			"di",
			"lu",
			"ma",
			"me",
			"je",
			"ve",
			"sa",
		];
		months = [
			"janvier",
			"février",
			"mars",
			"avril",
			"mai",
			"juin",
			"juillet",
			"août",
			"septembre",
			"octobre",
			"novembre",
			"décembre",
		];
		monthsShort = [
			"janv.",
			"févr.",
			"mars",
			"avr.",
			"mai",
			"juin",
			"juil.",
			"août",
			"sept.",
			"oct.",
			"nov.",
			"déc.",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "HH:mm";
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
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
