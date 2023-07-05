import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module JV {
	public let locale : Types.Locale = {
		id = "jv";
		weekdays = [
			"Minggu",
			"Senen",
			"Seloso",
			"Rebu",
			"Kemis",
			"Jemuwah",
			"Septu",
		];
		weekdaysShort = [
			"Min",
			"Sen",
			"Sel",
			"Reb",
			"Kem",
			"Jem",
			"Sep",
		];
		weekdaysMin = [
			"Mg",
			"Sn",
			"Sl",
			"Rb",
			"Km",
			"Jm",
			"Sp",
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
			"Nopember",
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
			"Ags",
			"Sep",
			"Okt",
			"Nop",
			"Des",
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
