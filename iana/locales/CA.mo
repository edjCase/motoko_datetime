import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module CA {
	public let locale : Types.Locale = {
		id = "ca";
		weekdays = [
			"diumenge",
			"dilluns",
			"dimarts",
			"dimecres",
			"dijous",
			"divendres",
			"dissabte",
		];
		weekdaysShort = [
			"dg.",
			"dl.",
			"dt.",
			"dc.",
			"dj.",
			"dv.",
			"ds.",
		];
		weekdaysMin = [
			"dg",
			"dl",
			"dt",
			"dc",
			"dj",
			"dv",
			"ds",
		];
		months = [
			"gener",
			"febrer",
			"març",
			"abril",
			"maig",
			"juny",
			"juliol",
			"agost",
			"setembre",
			"octubre",
			"novembre",
			"desembre",
		];
		monthsShort = [
			"gen.",
			"febr.",
			"març",
			"abr.",
			"maig",
			"juny",
			"jul.",
			"ag.",
			"set.",
			"oct.",
			"nov.",
			"des.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "H:mm DD/MM/YYYY";
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
			if (num == 0) {
				return Text.replace("_~_è", #text("_~_"), Nat.toText(num));
			};
			if (num == 1) {
				return Text.replace("_~_r", #text("_~_"), Nat.toText(num));
			};
			if (num == 2) {
				return Text.replace("_~_n", #text("_~_"), Nat.toText(num));
			};
			if (num == 3) {
				return Text.replace("_~_r", #text("_~_"), Nat.toText(num));
			};
			if (num == 4) {
				return Text.replace("_~_t", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
