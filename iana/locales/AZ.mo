import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module AZ {
	public let locale : Types.Locale = {
		id = "az";
		weekdays = [
			"Bazar",
			"Bazar ertəsi",
			"Çərşənbə axşamı",
			"Çərşənbə",
			"Cümə axşamı",
			"Cümə",
			"Şənbə",
		];
		weekdaysShort = [
			"Baz",
			"BzE",
			"ÇAx",
			"Çər",
			"CAx",
			"Cüm",
			"Şən",
		];
		weekdaysMin = [
			"Bz",
			"BE",
			"ÇA",
			"Çə",
			"CA",
			"Cü",
			"Şə",
		];
		months = [
			"yanvar",
			"fevral",
			"mart",
			"aprel",
			"may",
			"iyun",
			"iyul",
			"avqust",
			"sentyabr",
			"oktyabr",
			"noyabr",
			"dekabr",
		];
		monthsShort = [
			"yan",
			"fev",
			"mar",
			"apr",
			"may",
			"iyn",
			"iyl",
			"avq",
			"sen",
			"okt",
			"noy",
			"dek",
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
				case ((0, _)) ("gecə", "gecə");
				case ((1, _)) ("gecə", "gecə");
				case ((2, _)) ("gecə", "gecə");
				case ((3, _)) ("gecə", "gecə");
				case ((4, _)) ("səhər", "səhər");
				case ((5, _)) ("səhər", "səhər");
				case ((6, _)) ("səhər", "səhər");
				case ((7, _)) ("səhər", "səhər");
				case ((8, _)) ("səhər", "səhər");
				case ((9, _)) ("səhər", "səhər");
				case ((10, _)) ("səhər", "səhər");
				case ((11, _)) ("səhər", "səhər");
				case ((12, _)) ("gündüz", "gündüz");
				case ((13, _)) ("gündüz", "gündüz");
				case ((14, _)) ("gündüz", "gündüz");
				case ((15, _)) ("gündüz", "gündüz");
				case ((16, _)) ("gündüz", "gündüz");
				case ((17, _)) ("axşam", "axşam");
				case ((18, _)) ("axşam", "axşam");
				case ((19, _)) ("axşam", "axşam");
				case ((20, _)) ("axşam", "axşam");
				case ((21, _)) ("axşam", "axşam");
				case ((22, _)) ("axşam", "axşam");
				case ((23, _)) ("axşam", "axşam");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			if (num == 0) {
				return Text.replace("_~_-ıncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 1) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 2) {
				return Text.replace("_~_-nci", #text("_~_"), Nat.toText(num));
			};
			if (num > 3 and num < 5) {
				return Text.replace("_~_-üncü", #text("_~_"), Nat.toText(num));
			};
			if (num == 5) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 6) {
				return Text.replace("_~_-ncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 7) {
				return Text.replace("_~_-nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 8) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num > 9 and num < 11) {
				return Text.replace("_~_-uncu", #text("_~_"), Nat.toText(num));
			};
			if (num == 11) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 12) {
				return Text.replace("_~_-nci", #text("_~_"), Nat.toText(num));
			};
			if (num > 13 and num < 15) {
				return Text.replace("_~_-üncü", #text("_~_"), Nat.toText(num));
			};
			if (num == 15) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 16) {
				return Text.replace("_~_-ncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 17) {
				return Text.replace("_~_-nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 18) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 19) {
				return Text.replace("_~_-uncu", #text("_~_"), Nat.toText(num));
			};
			if (num == 20) {
				return Text.replace("_~_-nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 21) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 22) {
				return Text.replace("_~_-nci", #text("_~_"), Nat.toText(num));
			};
			if (num > 23 and num < 25) {
				return Text.replace("_~_-üncü", #text("_~_"), Nat.toText(num));
			};
			if (num == 25) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 26) {
				return Text.replace("_~_-ncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 27) {
				return Text.replace("_~_-nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 28) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num > 29 and num < 31) {
				return Text.replace("_~_-uncu", #text("_~_"), Nat.toText(num));
			};
			if (num == 31) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 32) {
				return Text.replace("_~_-nci", #text("_~_"), Nat.toText(num));
			};
			if (num > 33 and num < 35) {
				return Text.replace("_~_-üncü", #text("_~_"), Nat.toText(num));
			};
			if (num == 35) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			if (num == 36) {
				return Text.replace("_~_-ncı", #text("_~_"), Nat.toText(num));
			};
			if (num == 37) {
				return Text.replace("_~_-nci", #text("_~_"), Nat.toText(num));
			};
			if (num == 38) {
				return Text.replace("_~_-inci", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
