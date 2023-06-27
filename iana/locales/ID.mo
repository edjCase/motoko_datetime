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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("pagi", "pagi");
				case ((1, _)) ("pagi", "pagi");
				case ((2, _)) ("pagi", "pagi");
				case ((3, _)) ("pagi", "pagi");
				case ((4, _)) ("pagi", "pagi");
				case ((5, _)) ("pagi", "pagi");
				case ((6, _)) ("pagi", "pagi");
				case ((7, _)) ("pagi", "pagi");
				case ((8, _)) ("pagi", "pagi");
				case ((9, _)) ("pagi", "pagi");
				case ((10, _)) ("pagi", "pagi");
				case ((11, _)) ("siang", "siang");
				case ((12, _)) ("siang", "siang");
				case ((13, _)) ("siang", "siang");
				case ((14, _)) ("siang", "siang");
				case ((15, _)) ("sore", "sore");
				case ((16, _)) ("sore", "sore");
				case ((17, _)) ("sore", "sore");
				case ((18, _)) ("sore", "sore");
				case ((19, _)) ("malam", "malam");
				case ((20, _)) ("malam", "malam");
				case ((21, _)) ("malam", "malam");
				case ((22, _)) ("malam", "malam");
				case ((23, _)) ("malam", "malam");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
