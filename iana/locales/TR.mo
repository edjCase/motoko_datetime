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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("öö", "ÖÖ");
				case ((1, _)) ("öö", "ÖÖ");
				case ((2, _)) ("öö", "ÖÖ");
				case ((3, _)) ("öö", "ÖÖ");
				case ((4, _)) ("öö", "ÖÖ");
				case ((5, _)) ("öö", "ÖÖ");
				case ((6, _)) ("öö", "ÖÖ");
				case ((7, _)) ("öö", "ÖÖ");
				case ((8, _)) ("öö", "ÖÖ");
				case ((9, _)) ("öö", "ÖÖ");
				case ((10, _)) ("öö", "ÖÖ");
				case ((11, _)) ("öö", "ÖÖ");
				case ((12, _)) ("ös", "ÖS");
				case ((13, _)) ("ös", "ÖS");
				case ((14, _)) ("ös", "ÖS");
				case ((15, _)) ("ös", "ÖS");
				case ((16, _)) ("ös", "ÖS");
				case ((17, _)) ("ös", "ÖS");
				case ((18, _)) ("ös", "ÖS");
				case ((19, _)) ("ös", "ÖS");
				case ((20, _)) ("ös", "ÖS");
				case ((21, _)) ("ös", "ÖS");
				case ((22, _)) ("ös", "ÖS");
				case ((23, _)) ("ös", "ÖS");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			if (num == 0) {
				return Text.replace("_~_'ıncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 1) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 2) {
				return Text.replace("_~_'nci", #text("_~_"), Nat.toText(num));
			};
			if (num > 3 and num < 5) {
				return Text.replace("_~_'üncü", #text("_~_"), Nat.toText(num));
			};
			if (num == 5) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 6) {
				return Text.replace("_~_'ncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 7) {
				return Text.replace("_~_'nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 8) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num > 9 and num < 11) {
				return Text.replace("_~_'uncu", #text("_~_"), Nat.toText(num));
			};
			if (num == 11) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 12) {
				return Text.replace("_~_'nci", #text("_~_"), Nat.toText(num));
			};
			if (num > 13 and num < 15) {
				return Text.replace("_~_'üncü", #text("_~_"), Nat.toText(num));
			};
			if (num == 15) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 16) {
				return Text.replace("_~_'ncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 17) {
				return Text.replace("_~_'nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 18) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 19) {
				return Text.replace("_~_'uncu", #text("_~_"), Nat.toText(num));
			};
			if (num == 20) {
				return Text.replace("_~_'nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 21) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 22) {
				return Text.replace("_~_'nci", #text("_~_"), Nat.toText(num));
			};
			if (num > 23 and num < 25) {
				return Text.replace("_~_'üncü", #text("_~_"), Nat.toText(num));
			};
			if (num == 25) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 26) {
				return Text.replace("_~_'ncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 27) {
				return Text.replace("_~_'nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 28) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num > 29 and num < 31) {
				return Text.replace("_~_'uncu", #text("_~_"), Nat.toText(num));
			};
			if (num == 31) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 32) {
				return Text.replace("_~_'nci", #text("_~_"), Nat.toText(num));
			};
			if (num > 33 and num < 35) {
				return Text.replace("_~_'üncü", #text("_~_"), Nat.toText(num));
			};
			if (num == 35) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 36) {
				return Text.replace("_~_'ncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 37) {
				return Text.replace("_~_'nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 38) {
				return Text.replace("_~_'inci", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
