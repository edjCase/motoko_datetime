import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module MS {
	public let locale : Types.Locale = {
		id = "ms";
		weekdays = [
			"Ahad",
			"Isnin",
			"Selasa",
			"Rabu",
			"Khamis",
			"Jumaat",
			"Sabtu",
		];
		weekdaysShort = [
			"Ahd",
			"Isn",
			"Sel",
			"Rab",
			"Kha",
			"Jum",
			"Sab",
		];
		weekdaysMin = [
			"Ah",
			"Is",
			"Sl",
			"Rb",
			"Km",
			"Jm",
			"Sb",
		];
		months = [
			"Januari",
			"Februari",
			"Mac",
			"April",
			"Mei",
			"Jun",
			"Julai",
			"Ogos",
			"September",
			"Oktober",
			"November",
			"Disember",
		];
		monthsShort = [
			"Jan",
			"Feb",
			"Mac",
			"Apr",
			"Mei",
			"Jun",
			"Jul",
			"Ogs",
			"Sep",
			"Okt",
			"Nov",
			"Dis",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH.mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH.mm DD/MM/YYYY";
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
