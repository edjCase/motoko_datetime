import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module AF {
	public let locale : Types.Locale = {
		id = "af";
		weekdays = [
			"Sondag",
			"Maandag",
			"Dinsdag",
			"Woensdag",
			"Donderdag",
			"Vrydag",
			"Saterdag",
		];
		weekdaysShort = [
			"Son",
			"Maa",
			"Din",
			"Woe",
			"Don",
			"Vry",
			"Sat",
		];
		weekdaysMin = [
			"So",
			"Ma",
			"Di",
			"Wo",
			"Do",
			"Vr",
			"Sa",
		];
		months = [
			"Januarie",
			"Februarie",
			"Maart",
			"April",
			"Mei",
			"Junie",
			"Julie",
			"Augustus",
			"September",
			"Oktober",
			"November",
			"Desember",
		];
		monthsShort = [
			"Jan",
			"Feb",
			"Mrt",
			"Apr",
			"Mei",
			"Jun",
			"Jul",
			"Aug",
			"Sep",
			"Okt",
			"Nov",
			"Des",
		];
		firstDayOfWeek = 1;
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
