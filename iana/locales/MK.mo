import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module MK {
	public let locale : Types.Locale = {
		id = "mk";
		weekdays = [
			"недела",
			"понеделник",
			"вторник",
			"среда",
			"четврток",
			"петок",
			"сабота",
		];
		weekdaysShort = [
			"нед",
			"пон",
			"вто",
			"сре",
			"чет",
			"пет",
			"саб",
		];
		weekdaysMin = [
			"нe",
			"пo",
			"вт",
			"ср",
			"че",
			"пе",
			"сa",
		];
		months = [
			"јануари",
			"февруари",
			"март",
			"април",
			"мај",
			"јуни",
			"јули",
			"август",
			"септември",
			"октомври",
			"ноември",
			"декември",
		];
		monthsShort = [
			"јан",
			"фев",
			"мар",
			"апр",
			"мај",
			"јун",
			"јул",
			"авг",
			"сеп",
			"окт",
			"ное",
			"дек",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "D.MM.YYYY";
		dateTimeFormat = "H:mm D.MM.YYYY";
		longDateFormat = "D.MM.YYYY";
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
				return Text.replace("_~_-ев", #text("_~_"), Nat.toText(num));
			};
			if (num == 1) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 2) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 3 and num < 7) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 7 and num < 9) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 9 and num < 21) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 21) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 22) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 23 and num < 27) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 27 and num < 29) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 29 and num < 31) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 31) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 32) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 33 and num < 37) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 37 and num < 39) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 39 and num < 41) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 41) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 42) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 43 and num < 47) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 47 and num < 49) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 49 and num < 51) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 51) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 52) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 53 and num < 57) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 57 and num < 59) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 59 and num < 61) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 61) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 62) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 63 and num < 67) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 67 and num < 69) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 69 and num < 71) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 71) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 72) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 73 and num < 77) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 77 and num < 79) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 79 and num < 81) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 81) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 82) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 83 and num < 87) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 87 and num < 89) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 89 and num < 91) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 91) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 92) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 93 and num < 97) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 97 and num < 99) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num == 99) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 100) {
				return Text.replace("_~_-ен", #text("_~_"), Nat.toText(num));
			};
			if (num == 101) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 102) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 103 and num < 107) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 107 and num < 109) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 109 and num < 121) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 121) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 122) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 123 and num < 127) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 127 and num < 129) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 129 and num < 131) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 131) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 132) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 133 and num < 137) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 137 and num < 139) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 139 and num < 141) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 141) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 142) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 143 and num < 147) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 147 and num < 149) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 149 and num < 151) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 151) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 152) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 153 and num < 157) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 157 and num < 159) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 159 and num < 161) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 161) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 162) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 163 and num < 167) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 167 and num < 169) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 169 and num < 171) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 171) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 172) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 173 and num < 177) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 177 and num < 179) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 179 and num < 181) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 181) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 182) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 183 and num < 187) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 187 and num < 189) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 189 and num < 191) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 191) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 192) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 193 and num < 197) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 197 and num < 199) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num == 199) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 200) {
				return Text.replace("_~_-ен", #text("_~_"), Nat.toText(num));
			};
			if (num == 201) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 202) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 203 and num < 207) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 207 and num < 209) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 209 and num < 221) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 221) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 222) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 223 and num < 227) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 227 and num < 229) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 229 and num < 231) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 231) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 232) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 233 and num < 237) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 237 and num < 239) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 239 and num < 241) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 241) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 242) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 243 and num < 247) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 247 and num < 249) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 249 and num < 251) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 251) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 252) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 253 and num < 257) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 257 and num < 259) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 259 and num < 261) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 261) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 262) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 263 and num < 267) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 267 and num < 269) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 269 and num < 271) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 271) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 272) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 273 and num < 277) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 277 and num < 279) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 279 and num < 281) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 281) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 282) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 283 and num < 287) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 287 and num < 289) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 289 and num < 291) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 291) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 292) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 293 and num < 297) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 297 and num < 299) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num == 299) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 300) {
				return Text.replace("_~_-ен", #text("_~_"), Nat.toText(num));
			};
			if (num == 301) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 302) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 303 and num < 307) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 307 and num < 309) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 309 and num < 321) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 321) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 322) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 323 and num < 327) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 327 and num < 329) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 329 and num < 331) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 331) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 332) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 333 and num < 337) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 337 and num < 339) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 339 and num < 341) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 341) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 342) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 343 and num < 347) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 347 and num < 349) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 349 and num < 351) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 351) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 352) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			if (num > 353 and num < 357) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num > 357 and num < 359) {
				return Text.replace("_~_-ми", #text("_~_"), Nat.toText(num));
			};
			if (num > 359 and num < 361) {
				return Text.replace("_~_-ти", #text("_~_"), Nat.toText(num));
			};
			if (num == 361) {
				return Text.replace("_~_-ви", #text("_~_"), Nat.toText(num));
			};
			if (num == 362) {
				return Text.replace("_~_-ри", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
