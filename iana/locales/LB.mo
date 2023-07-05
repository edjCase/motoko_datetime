import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module LB {
	public let locale : Types.Locale = {
		id = "lb";
		weekdays = [
			"Sonndeg",
			"Méindeg",
			"Dënschdeg",
			"Mëttwoch",
			"Donneschdeg",
			"Freideg",
			"Samschdeg",
		];
		weekdaysShort = [
			"So.",
			"Mé.",
			"Dë.",
			"Më.",
			"Do.",
			"Fr.",
			"Sa.",
		];
		weekdaysMin = [
			"So",
			"Mé",
			"Dë",
			"Më",
			"Do",
			"Fr",
			"Sa",
		];
		months = [
			"Januar",
			"Februar",
			"Mäerz",
			"Abrëll",
			"Mee",
			"Juni",
			"Juli",
			"August",
			"September",
			"Oktober",
			"November",
			"Dezember",
		];
		monthsShort = [
			"Jan.",
			"Febr.",
			"Mrz.",
			"Abr.",
			"Mee",
			"Jun.",
			"Jul.",
			"Aug.",
			"Sept.",
			"Okt.",
			"Nov.",
			"Dez.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm [Auer]";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm [Auer] DD.MM.YYYY";
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
