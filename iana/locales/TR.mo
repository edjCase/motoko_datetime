import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TR {
	public let locale : Types.Locale = {
		id = "tr";
		weekdays = [
			"Pazar",
			"Pazartesi",
			"Salı",
			"Çarşamba",
			"Perşembe",
			"Cuma",
			"Cumartesi",
		];
		weekdaysShort = [
			"Paz",
			"Pzt",
			"Sal",
			"Çar",
			"Per",
			"Cum",
			"Cmt",
		];
		weekdaysMin = [
			"Pz",
			"Pt",
			"Sa",
			"Ça",
			"Pe",
			"Cu",
			"Ct",
		];
		months = [
			"Ocak",
			"Şubat",
			"Mart",
			"Nisan",
			"Mayıs",
			"Haziran",
			"Temmuz",
			"Ağustos",
			"Eylül",
			"Ekim",
			"Kasım",
			"Aralık",
		];
		monthsShort = [
			"Oca",
			"Şub",
			"Mar",
			"Nis",
			"May",
			"Haz",
			"Tem",
			"Ağu",
			"Eyl",
			"Eki",
			"Kas",
			"Ara",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
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
