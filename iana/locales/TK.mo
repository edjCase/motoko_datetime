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
				return Text.replace("_~_'unjy", #text("_~_"), Nat.toText(num));
			};
			if (num == 1) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num == 2) {
				return Text.replace("_~_'nji", #text("_~_"), Nat.toText(num));
			};
			if (num > 3 and num < 5) {
				return Text.replace("_~_'ünji", #text("_~_"), Nat.toText(num));
			};
			if (num == 5) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num == 6) {
				return Text.replace("_~_'njy", #text("_~_"), Nat.toText(num));
			};
			if (num == 7) {
				return Text.replace("_~_'nji", #text("_~_"), Nat.toText(num));
			};
			if (num == 8) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num > 9 and num < 11) {
				return Text.replace("_~_'unjy", #text("_~_"), Nat.toText(num));
			};
			if (num == 11) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num == 12) {
				return Text.replace("_~_'nji", #text("_~_"), Nat.toText(num));
			};
			if (num > 13 and num < 15) {
				return Text.replace("_~_'ünji", #text("_~_"), Nat.toText(num));
			};
			if (num == 15) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num == 16) {
				return Text.replace("_~_'njy", #text("_~_"), Nat.toText(num));
			};
			if (num == 17) {
				return Text.replace("_~_'nji", #text("_~_"), Nat.toText(num));
			};
			if (num == 18) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num == 19) {
				return Text.replace("_~_'unjy", #text("_~_"), Nat.toText(num));
			};
			if (num == 20) {
				return Text.replace("_~_'nji", #text("_~_"), Nat.toText(num));
			};
			if (num == 21) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num == 22) {
				return Text.replace("_~_'nji", #text("_~_"), Nat.toText(num));
			};
			if (num > 23 and num < 25) {
				return Text.replace("_~_'ünji", #text("_~_"), Nat.toText(num));
			};
			if (num == 25) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num == 26) {
				return Text.replace("_~_'njy", #text("_~_"), Nat.toText(num));
			};
			if (num == 27) {
				return Text.replace("_~_'nji", #text("_~_"), Nat.toText(num));
			};
			if (num == 28) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num > 29 and num < 31) {
				return Text.replace("_~_'unjy", #text("_~_"), Nat.toText(num));
			};
			if (num == 31) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num == 32) {
				return Text.replace("_~_'nji", #text("_~_"), Nat.toText(num));
			};
			if (num > 33 and num < 35) {
				return Text.replace("_~_'ünji", #text("_~_"), Nat.toText(num));
			};
			if (num == 35) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			if (num == 36) {
				return Text.replace("_~_'njy", #text("_~_"), Nat.toText(num));
			};
			if (num == 37) {
				return Text.replace("_~_'nji", #text("_~_"), Nat.toText(num));
			};
			if (num == 38) {
				return Text.replace("_~_'inji", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
