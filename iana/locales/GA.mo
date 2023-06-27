import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module GA {
	public let locale : Types.Locale = {
		id = "ga";
		weekdays = [
			"Dé Domhnaigh",
			"Dé Luain",
			"Dé Máirt",
			"Dé Céadaoin",
			"Déardaoin",
			"Dé hAoine",
			"Dé Sathairn",
		];
		weekdaysShort = [
			"Domh",
			"Luan",
			"Máirt",
			"Céad",
			"Déar",
			"Aoine",
			"Sath",
		];
		weekdaysMin = [
			"Do",
			"Lu",
			"Má",
			"Cé",
			"Dé",
			"A",
			"Sa",
		];
		months = [
			"Eanáir",
			"Feabhra",
			"Márta",
			"Aibreán",
			"Bealtaine",
			"Meitheamh",
			"Iúil",
			"Lúnasa",
			"Meán Fómhair",
			"Deireadh Fómhair",
			"Samhain",
			"Nollaig",
		];
		monthsShort = [
			"Ean",
			"Feabh",
			"Márt",
			"Aib",
			"Beal",
			"Meith",
			"Iúil",
			"Lún",
			"M.F.",
			"D.F.",
			"Samh",
			"Noll",
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
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 1) {
				return Text.replace("_~_d", #text("_~_"), Nat.toText(num));
			};
			if (num == 2) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 3 and num < 12) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 12) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 13 and num < 22) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 22) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 23 and num < 32) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 32) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 33 and num < 42) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 42) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 43 and num < 52) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 52) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 53 and num < 62) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 62) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 63 and num < 72) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 72) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 73 and num < 82) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 82) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 83 and num < 92) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 92) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 93 and num < 102) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 102) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 103 and num < 112) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 112) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 113 and num < 122) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 122) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 123 and num < 132) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 132) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 133 and num < 142) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 142) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 143 and num < 152) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 152) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 153 and num < 162) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 162) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 163 and num < 172) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 172) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 173 and num < 182) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 182) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 183 and num < 192) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 192) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 193 and num < 202) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 202) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 203 and num < 212) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 212) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 213 and num < 222) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 222) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 223 and num < 232) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 232) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 233 and num < 242) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 242) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 243 and num < 252) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 252) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 253 and num < 262) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 262) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 263 and num < 272) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 272) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 273 and num < 282) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 282) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 283 and num < 292) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 292) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 293 and num < 302) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 302) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 303 and num < 312) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 312) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 313 and num < 322) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 322) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 323 and num < 332) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 332) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 333 and num < 342) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 342) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 343 and num < 352) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 352) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			if (num > 353 and num < 362) {
				return Text.replace("_~_mh", #text("_~_"), Nat.toText(num));
			};
			if (num == 362) {
				return Text.replace("_~_na", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
