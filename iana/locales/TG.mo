import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TG {
	public let locale : Types.Locale = {
		id = "tg";
		weekdays = [
			"якшанбе",
			"душанбе",
			"сешанбе",
			"чоршанбе",
			"панҷшанбе",
			"ҷумъа",
			"шанбе",
		];
		weekdaysShort = [
			"яшб",
			"дшб",
			"сшб",
			"чшб",
			"пшб",
			"ҷум",
			"шнб",
		];
		weekdaysMin = [
			"яш",
			"дш",
			"сш",
			"чш",
			"пш",
			"ҷм",
			"шб",
		];
		months = [
			"январ",
			"феврал",
			"март",
			"апрел",
			"май",
			"июн",
			"июл",
			"август",
			"сентябр",
			"октябр",
			"ноябр",
			"декабр",
		];
		monthsShort = [
			"янв",
			"фев",
			"мар",
			"апр",
			"май",
			"июн",
			"июл",
			"авг",
			"сен",
			"окт",
			"ноя",
			"дек",
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
				case ((0, _)) ("шаб", "шаб");
				case ((1, _)) ("шаб", "шаб");
				case ((2, _)) ("шаб", "шаб");
				case ((3, _)) ("шаб", "шаб");
				case ((4, _)) ("субҳ", "субҳ");
				case ((5, _)) ("субҳ", "субҳ");
				case ((6, _)) ("субҳ", "субҳ");
				case ((7, _)) ("субҳ", "субҳ");
				case ((8, _)) ("субҳ", "субҳ");
				case ((9, _)) ("субҳ", "субҳ");
				case ((10, _)) ("субҳ", "субҳ");
				case ((11, _)) ("рӯз", "рӯз");
				case ((12, _)) ("рӯз", "рӯз");
				case ((13, _)) ("рӯз", "рӯз");
				case ((14, _)) ("рӯз", "рӯз");
				case ((15, _)) ("рӯз", "рӯз");
				case ((16, _)) ("бегоҳ", "бегоҳ");
				case ((17, _)) ("бегоҳ", "бегоҳ");
				case ((18, _)) ("бегоҳ", "бегоҳ");
				case ((19, _)) ("шаб", "шаб");
				case ((20, _)) ("шаб", "шаб");
				case ((21, _)) ("шаб", "шаб");
				case ((22, _)) ("шаб", "шаб");
				case ((23, _)) ("шаб", "шаб");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			if (num > 0 and num < 2) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 2 and num < 4) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 4 and num < 22) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 22 and num < 24) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 24 and num < 30) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num == 30) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num == 31) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 32 and num < 34) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 34 and num < 42) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 42 and num < 44) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 44 and num < 52) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 52 and num < 54) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 54 and num < 62) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 62 and num < 64) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 64 and num < 72) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 72 and num < 74) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 74 and num < 82) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 82 and num < 84) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 84 and num < 92) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 92 and num < 94) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 94 and num < 102) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 102 and num < 104) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 104 and num < 112) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 112 and num < 114) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 114 and num < 122) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 122 and num < 124) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 124 and num < 132) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 132 and num < 134) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 134 and num < 142) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 142 and num < 144) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 144 and num < 152) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 152 and num < 154) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 154 and num < 162) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 162 and num < 164) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 164 and num < 172) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 172 and num < 174) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 174 and num < 182) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 182 and num < 184) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 184 and num < 192) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 192 and num < 194) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 194 and num < 202) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 202 and num < 204) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 204 and num < 212) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 212 and num < 214) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 214 and num < 222) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 222 and num < 224) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 224 and num < 232) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 232 and num < 234) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 234 and num < 242) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 242 and num < 244) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 244 and num < 252) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 252 and num < 254) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 254 and num < 262) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 262 and num < 264) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 264 and num < 272) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 272 and num < 274) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 274 and num < 282) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 282 and num < 284) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 284 and num < 292) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 292 and num < 294) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 294 and num < 302) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 302 and num < 304) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 304 and num < 312) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 312 and num < 314) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 314 and num < 322) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 322 and num < 324) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 324 and num < 332) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 332 and num < 334) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 334 and num < 342) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 342 and num < 344) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 344 and num < 352) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 352 and num < 354) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			if (num > 354 and num < 362) {
				return Text.replace("_~_-ум", #text("_~_"), Nat.toText(num));
			};
			if (num > 362 and num < 364) {
				return Text.replace("_~_-юм", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
