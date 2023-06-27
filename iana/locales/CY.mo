import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module CY {
	public let locale : Types.Locale = {
		id = "cy";
		weekdays = [
			"Dydd Sul",
			"Dydd Llun",
			"Dydd Mawrth",
			"Dydd Mercher",
			"Dydd Iau",
			"Dydd Gwener",
			"Dydd Sadwrn",
		];
		weekdaysShort = [
			"Sul",
			"Llun",
			"Maw",
			"Mer",
			"Iau",
			"Gwe",
			"Sad",
		];
		weekdaysMin = [
			"Su",
			"Ll",
			"Ma",
			"Me",
			"Ia",
			"Gw",
			"Sa",
		];
		months = [
			"Ionawr",
			"Chwefror",
			"Mawrth",
			"Ebrill",
			"Mai",
			"Mehefin",
			"Gorffennaf",
			"Awst",
			"Medi",
			"Hydref",
			"Tachwedd",
			"Rhagfyr",
		];
		monthsShort = [
			"Ion",
			"Chwe",
			"Maw",
			"Ebr",
			"Mai",
			"Meh",
			"Gor",
			"Aws",
			"Med",
			"Hyd",
			"Tach",
			"Rhag",
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
			if (num == 0) {
				return Text.replace("_~_", #text("_~_"), Nat.toText(num));
			};
			if (num == 1) {
				return Text.replace("_~_af", #text("_~_"), Nat.toText(num));
			};
			if (num == 2) {
				return Text.replace("_~_il", #text("_~_"), Nat.toText(num));
			};
			if (num > 3 and num < 5) {
				return Text.replace("_~_ydd", #text("_~_"), Nat.toText(num));
			};
			if (num > 5 and num < 8) {
				return Text.replace("_~_ed", #text("_~_"), Nat.toText(num));
			};
			if (num > 8 and num < 11) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			if (num == 11) {
				return Text.replace("_~_eg", #text("_~_"), Nat.toText(num));
			};
			if (num == 12) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			if (num > 13 and num < 15) {
				return Text.replace("_~_eg", #text("_~_"), Nat.toText(num));
			};
			if (num == 15) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			if (num > 16 and num < 18) {
				return Text.replace("_~_eg", #text("_~_"), Nat.toText(num));
			};
			if (num == 18) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			if (num == 19) {
				return Text.replace("_~_eg", #text("_~_"), Nat.toText(num));
			};
			if (num == 20) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			if (num > 21 and num < 40) {
				return Text.replace("_~_ain", #text("_~_"), Nat.toText(num));
			};
			if (num == 40) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			if (num > 41 and num < 50) {
				return Text.replace("_~_ain", #text("_~_"), Nat.toText(num));
			};
			if (num == 50) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			if (num > 51 and num < 60) {
				return Text.replace("_~_ain", #text("_~_"), Nat.toText(num));
			};
			if (num == 60) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			if (num > 61 and num < 80) {
				return Text.replace("_~_ain", #text("_~_"), Nat.toText(num));
			};
			if (num == 80) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			if (num > 81 and num < 100) {
				return Text.replace("_~_ain", #text("_~_"), Nat.toText(num));
			};
			if (num == 100) {
				return Text.replace("_~_fed", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
