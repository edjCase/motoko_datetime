import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TK {
	public let locale : Types.Locale = {
		id = "tk";
		weekdays = [
			"Ýekşenbe",
			"Duşenbe",
			"Sişenbe",
			"Çarşenbe",
			"Penşenbe",
			"Anna",
			"Şenbe",
		];
		weekdaysShort = [
			"Ýek",
			"Duş",
			"Siş",
			"Çar",
			"Pen",
			"Ann",
			"Şen",
		];
		weekdaysMin = [
			"Ýk",
			"Dş",
			"Sş",
			"Çr",
			"Pn",
			"An",
			"Şn",
		];
		months = [
			"Ýanwar",
			"Fewral",
			"Mart",
			"Aprel",
			"Maý",
			"Iýun",
			"Iýul",
			"Awgust",
			"Sentýabr",
			"Oktýabr",
			"Noýabr",
			"Dekabr",
		];
		monthsShort = [
			"Ýan",
			"Few",
			"Mar",
			"Apr",
			"Maý",
			"Iýn",
			"Iýl",
			"Awg",
			"Sen",
			"Okt",
			"Noý",
			"Dek",
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
