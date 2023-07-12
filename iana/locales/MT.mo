import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module MT {
	public let locale : Types.Locale = {
		id = "mt";
		weekdays = [
			"Il-Ħadd",
			"It-Tnejn",
			"It-Tlieta",
			"L-Erbgħa",
			"Il-Ħamis",
			"Il-Ġimgħa",
			"Is-Sibt",
		];
		weekdaysShort = [
			"Ħad",
			"Tne",
			"Tli",
			"Erb",
			"Ħam",
			"Ġim",
			"Sib",
		];
		weekdaysMin = [
			"Ħa",
			"Tn",
			"Tl",
			"Er",
			"Ħa",
			"Ġi",
			"Si",
		];
		months = [
			"Jannar",
			"Frar",
			"Marzu",
			"April",
			"Mejju",
			"Ġunju",
			"Lulju",
			"Awwissu",
			"Settembru",
			"Ottubru",
			"Novembru",
			"Diċembru",
		];
		monthsShort = [
			"Jan",
			"Fra",
			"Mar",
			"Apr",
			"Mej",
			"Ġun",
			"Lul",
			"Aww",
			"Set",
			"Ott",
			"Nov",
			"Diċ",
		];
		firstDayOfWeek = #monday;
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
