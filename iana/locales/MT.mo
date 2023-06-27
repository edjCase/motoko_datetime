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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("am", "AM");
				case ((1, _)) ("am", "AM");
				case ((2, _)) ("am", "AM");
				case ((3, _)) ("am", "AM");
				case ((4, _)) ("am", "AM");
				case ((5, _)) ("am", "AM");
				case ((6, _)) ("am", "AM");
				case ((7, _)) ("am", "AM");
				case ((8, _)) ("am", "AM");
				case ((9, _)) ("am", "AM");
				case ((10, _)) ("am", "AM");
				case ((11, _)) ("am", "AM");
				case ((12, _)) ("pm", "PM");
				case ((13, _)) ("pm", "PM");
				case ((14, _)) ("pm", "PM");
				case ((15, _)) ("pm", "PM");
				case ((16, _)) ("pm", "PM");
				case ((17, _)) ("pm", "PM");
				case ((18, _)) ("pm", "PM");
				case ((19, _)) ("pm", "PM");
				case ((20, _)) ("pm", "PM");
				case ((21, _)) ("pm", "PM");
				case ((22, _)) ("pm", "PM");
				case ((23, _)) ("pm", "PM");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
