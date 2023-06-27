import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SV {
	public let locale : Types.Locale = {
		id = "sv";
		weekdays = [
			"söndag",
			"måndag",
			"tisdag",
			"onsdag",
			"torsdag",
			"fredag",
			"lördag",
		];
		weekdaysShort = [
			"sön",
			"mån",
			"tis",
			"ons",
			"tor",
			"fre",
			"lör",
		];
		weekdaysMin = [
			"sö",
			"må",
			"ti",
			"on",
			"to",
			"fr",
			"lö",
		];
		months = [
			"januari",
			"februari",
			"mars",
			"april",
			"maj",
			"juni",
			"juli",
			"augusti",
			"september",
			"oktober",
			"november",
			"december",
		];
		monthsShort = [
			"jan",
			"feb",
			"mar",
			"apr",
			"maj",
			"jun",
			"jul",
			"aug",
			"sep",
			"okt",
			"nov",
			"dec",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
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
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 1 and num < 3) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 3 and num < 21) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 21 and num < 23) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 23 and num < 31) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 31 and num < 33) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 33 and num < 41) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 41 and num < 43) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 43 and num < 51) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 51 and num < 53) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 53 and num < 61) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 61 and num < 63) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 63 and num < 71) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 71 and num < 73) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 73 and num < 81) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 81 and num < 83) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 83 and num < 91) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 91 and num < 93) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 93 and num < 101) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 101 and num < 103) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 103 and num < 121) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 121 and num < 123) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 123 and num < 131) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 131 and num < 133) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 133 and num < 141) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 141 and num < 143) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 143 and num < 151) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 151 and num < 153) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 153 and num < 161) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 161 and num < 163) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 163 and num < 171) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 171 and num < 173) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 173 and num < 181) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 181 and num < 183) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 183 and num < 191) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 191 and num < 193) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 193 and num < 201) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 201 and num < 203) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 203 and num < 221) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 221 and num < 223) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 223 and num < 231) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 231 and num < 233) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 233 and num < 241) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 241 and num < 243) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 243 and num < 251) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 251 and num < 253) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 253 and num < 261) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 261 and num < 263) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 263 and num < 271) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 271 and num < 273) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 273 and num < 281) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 281 and num < 283) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 283 and num < 291) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 291 and num < 293) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 293 and num < 301) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 301 and num < 303) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 303 and num < 321) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 321 and num < 323) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 323 and num < 331) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 331 and num < 333) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 333 and num < 341) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 341 and num < 343) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 343 and num < 351) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 351 and num < 353) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			if (num > 353 and num < 361) {
				return Text.replace("_~_:e", #text("_~_"), Nat.toText(num));
			};
			if (num > 361 and num < 363) {
				return Text.replace("_~_:a", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
