import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module ID {
	public let locale : Types.Locale = {
		id = "id";
		weekdays = [
			"Minggu",
			"Senin",
			"Selasa",
			"Rabu",
			"Kamis",
			"Jumat",
			"Sabtu",
		];
		weekdaysShort = [
			"Min",
			"Sen",
			"Sel",
			"Rab",
			"Kam",
			"Jum",
			"Sab",
		];
		weekdaysMin = [
			"Mg",
			"Sn",
			"Sl",
			"Rb",
			"Km",
			"Jm",
			"Sb",
		];
		months = [
			"Januari",
			"Februari",
			"Maret",
			"April",
			"Mei",
			"Juni",
			"Juli",
			"Agustus",
			"September",
			"Oktober",
			"November",
			"Desember",
		];
		monthsShort = [
			"Jan",
			"Feb",
			"Mar",
			"Apr",
			"Mei",
			"Jun",
			"Jul",
			"Agt",
			"Sep",
			"Okt",
			"Nov",
			"Des",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
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
