import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SQ {
	public let locale : Types.Locale = {
		id = "sq";
		weekdays = [
			"E Diel",
			"E Hënë",
			"E Martë",
			"E Mërkurë",
			"E Enjte",
			"E Premte",
			"E Shtunë",
		];
		weekdaysShort = [
			"Die",
			"Hën",
			"Mar",
			"Mër",
			"Enj",
			"Pre",
			"Sht",
		];
		weekdaysMin = [
			"D",
			"H",
			"Ma",
			"Më",
			"E",
			"P",
			"Sh",
		];
		months = [
			"Janar",
			"Shkurt",
			"Mars",
			"Prill",
			"Maj",
			"Qershor",
			"Korrik",
			"Gusht",
			"Shtator",
			"Tetor",
			"Nëntor",
			"Dhjetor",
		];
		monthsShort = [
			"Jan",
			"Shk",
			"Mar",
			"Pri",
			"Maj",
			"Qer",
			"Kor",
			"Gus",
			"Sht",
			"Tet",
			"Nën",
			"Dhj",
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
