import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TZM {
	public let locale : Types.Locale = {
		id = "tzm";
		weekdays = [
			"ⴰⵙⴰⵎⴰⵙ",
			"ⴰⵢⵏⴰⵙ",
			"ⴰⵙⵉⵏⴰⵙ",
			"ⴰⴽⵔⴰⵙ",
			"ⴰⴽⵡⴰⵙ",
			"ⴰⵙⵉⵎⵡⴰⵙ",
			"ⴰⵙⵉⴹⵢⴰⵙ",
		];
		weekdaysShort = [
			"ⴰⵙⴰⵎⴰⵙ",
			"ⴰⵢⵏⴰⵙ",
			"ⴰⵙⵉⵏⴰⵙ",
			"ⴰⴽⵔⴰⵙ",
			"ⴰⴽⵡⴰⵙ",
			"ⴰⵙⵉⵎⵡⴰⵙ",
			"ⴰⵙⵉⴹⵢⴰⵙ",
		];
		weekdaysMin = [
			"ⴰⵙⴰⵎⴰⵙ",
			"ⴰⵢⵏⴰⵙ",
			"ⴰⵙⵉⵏⴰⵙ",
			"ⴰⴽⵔⴰⵙ",
			"ⴰⴽⵡⴰⵙ",
			"ⴰⵙⵉⵎⵡⴰⵙ",
			"ⴰⵙⵉⴹⵢⴰⵙ",
		];
		months = [
			"ⵉⵏⵏⴰⵢⵔ",
			"ⴱⵕⴰⵢⵕ",
			"ⵎⴰⵕⵚ",
			"ⵉⴱⵔⵉⵔ",
			"ⵎⴰⵢⵢⵓ",
			"ⵢⵓⵏⵢⵓ",
			"ⵢⵓⵍⵢⵓⵣ",
			"ⵖⵓⵛⵜ",
			"ⵛⵓⵜⴰⵏⴱⵉⵔ",
			"ⴽⵟⵓⴱⵕ",
			"ⵏⵓⵡⴰⵏⴱⵉⵔ",
			"ⴷⵓⵊⵏⴱⵉⵔ",
		];
		monthsShort = [
			"ⵉⵏⵏⴰⵢⵔ",
			"ⴱⵕⴰⵢⵕ",
			"ⵎⴰⵕⵚ",
			"ⵉⴱⵔⵉⵔ",
			"ⵎⴰⵢⵢⵓ",
			"ⵢⵓⵏⵢⵓ",
			"ⵢⵓⵍⵢⵓⵣ",
			"ⵖⵓⵛⵜ",
			"ⵛⵓⵜⴰⵏⴱⵉⵔ",
			"ⴽⵟⵓⴱⵕ",
			"ⵏⵓⵡⴰⵏⴱⵉⵔ",
			"ⴷⵓⵊⵏⴱⵉⵔ",
		];
		firstDayOfWeek = 6;
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
