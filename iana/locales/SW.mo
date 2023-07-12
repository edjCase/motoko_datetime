import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SW {
	public let locale : Types.Locale = {
		id = "sw";
		weekdays = [
			"Jumapili",
			"Jumatatu",
			"Jumanne",
			"Jumatano",
			"Alhamisi",
			"Ijumaa",
			"Jumamosi",
		];
		weekdaysShort = [
			"Jpl",
			"Jtat",
			"Jnne",
			"Jtan",
			"Alh",
			"Ijm",
			"Jmos",
		];
		weekdaysMin = [
			"J2",
			"J3",
			"J4",
			"J5",
			"Al",
			"Ij",
			"J1",
		];
		months = [
			"Januari",
			"Februari",
			"Machi",
			"Aprili",
			"Mei",
			"Juni",
			"Julai",
			"Agosti",
			"Septemba",
			"Oktoba",
			"Novemba",
			"Desemba",
		];
		monthsShort = [
			"Jan",
			"Feb",
			"Mac",
			"Apr",
			"Mei",
			"Jun",
			"Jul",
			"Ago",
			"Sep",
			"Okt",
			"Nov",
			"Des",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 7;
		timeFormat = "hh:mm A";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "hh:mm A DD.MM.YYYY";
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
