import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module KK {
	public let locale : Types.Locale = {
		id = "kk";
		weekdays = [
			"жексенбі",
			"дүйсенбі",
			"сейсенбі",
			"сәрсенбі",
			"бейсенбі",
			"жұма",
			"сенбі",
		];
		weekdaysShort = [
			"жек",
			"дүй",
			"сей",
			"сәр",
			"бей",
			"жұм",
			"сен",
		];
		weekdaysMin = [
			"жк",
			"дй",
			"сй",
			"ср",
			"бй",
			"жм",
			"сн",
		];
		months = [
			"қаңтар",
			"ақпан",
			"наурыз",
			"сәуір",
			"мамыр",
			"маусым",
			"шілде",
			"тамыз",
			"қыркүйек",
			"қазан",
			"қараша",
			"желтоқсан",
		];
		monthsShort = [
			"қаң",
			"ақп",
			"нау",
			"сәу",
			"мам",
			"мау",
			"шіл",
			"там",
			"қыр",
			"қаз",
			"қар",
			"жел",
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
			if (num > 0 and num < 6) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 6) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 7 and num < 9) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num > 9 and num < 11) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 11 and num < 16) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 16) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 17 and num < 19) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num > 19 and num < 21) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 21 and num < 26) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 26) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 27 and num < 29) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num > 29 and num < 31) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 31 and num < 36) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 36) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 37 and num < 39) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num > 39 and num < 41) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 41 and num < 46) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 46) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 47 and num < 49) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 49) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 50 and num < 56) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 56) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 57 and num < 59) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num > 59 and num < 61) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 61 and num < 66) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 66) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 67 and num < 69) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 69) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 70 and num < 76) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 76) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 77 and num < 79) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 79) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 80 and num < 86) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 86) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 87 and num < 89) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num > 89 and num < 91) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 91 and num < 96) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 96) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 97 and num < 99) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 99) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 100 and num < 106) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 106) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 107 and num < 109) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 109) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 110 and num < 116) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 116) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 117 and num < 119) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 119) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 120 and num < 126) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 126) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 127 and num < 129) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 129) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 130 and num < 136) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 136) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 137 and num < 139) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 139) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 140 and num < 146) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 146) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 147 and num < 149) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 149) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 150 and num < 156) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 156) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 157 and num < 159) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 159) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 160 and num < 166) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 166) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 167 and num < 169) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 169) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 170 and num < 176) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 176) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 177 and num < 179) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 179) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 180 and num < 186) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 186) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 187 and num < 189) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 189) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 190 and num < 196) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 196) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 197 and num < 199) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 199) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 200 and num < 206) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 206) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 207 and num < 209) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 209) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 210 and num < 216) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 216) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 217 and num < 219) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 219) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 220 and num < 226) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 226) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 227 and num < 229) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 229) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 230 and num < 236) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 236) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 237 and num < 239) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 239) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 240 and num < 246) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 246) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 247 and num < 249) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 249) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 250 and num < 256) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 256) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 257 and num < 259) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 259) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 260 and num < 266) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 266) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 267 and num < 269) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 269) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 270 and num < 276) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 276) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 277 and num < 279) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 279) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 280 and num < 286) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 286) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 287 and num < 289) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 289) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 290 and num < 296) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 296) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 297 and num < 299) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 299) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 300 and num < 306) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 306) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 307 and num < 309) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 309) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 310 and num < 316) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 316) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 317 and num < 319) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 319) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 320 and num < 326) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 326) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 327 and num < 329) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 329) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 330 and num < 336) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 336) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 337 and num < 339) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 339) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 340 and num < 346) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 346) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 347 and num < 349) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 349) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 350 and num < 356) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 356) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			if (num > 357 and num < 359) {
				return Text.replace("_~_-ші", #text("_~_"), Nat.toText(num));
			};
			if (num == 359) {
				return Text.replace("_~_-шы", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
