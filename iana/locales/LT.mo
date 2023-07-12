import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module LT {
	public let locale : Types.Locale = {
		id = "lt";
		weekdays = [
			"sekmadienis",
			"pirmadienis",
			"antradienis",
			"trečiadienis",
			"ketvirtadienis",
			"penktadienis",
			"šeštadienis",
		];
		weekdaysShort = [
			"Sek",
			"Pir",
			"Ant",
			"Tre",
			"Ket",
			"Pen",
			"Šeš",
		];
		weekdaysMin = [
			"S",
			"P",
			"A",
			"T",
			"K",
			"Pn",
			"Š",
		];
		months = [
			"sausis",
			"vasaris",
			"kovas",
			"balandis",
			"gegužė",
			"birželis",
			"liepa",
			"rugpjūtis",
			"rugsėjis",
			"spalis",
			"lapkritis",
			"gruodis",
		];
		monthsShort = [
			"sau",
			"vas",
			"kov",
			"bal",
			"geg",
			"bir",
			"lie",
			"rgp",
			"rgs",
			"spa",
			"lap",
			"grd",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
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
