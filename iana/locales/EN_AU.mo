import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module EN_AU {
	public let locale : Types.Locale = {
		id = "en-au";
		weekdays = [
			"Sunday",
			"Monday",
			"Tuesday",
			"Wednesday",
			"Thursday",
			"Friday",
			"Saturday",
		];
		weekdaysShort = [
			"Sun",
			"Mon",
			"Tue",
			"Wed",
			"Thu",
			"Fri",
			"Sat",
		];
		weekdaysMin = [
			"Su",
			"Mo",
			"Tu",
			"We",
			"Th",
			"Fr",
			"Sa",
		];
		months = [
			"January",
			"February",
			"March",
			"April",
			"May",
			"June",
			"July",
			"August",
			"September",
			"October",
			"November",
			"December",
		];
		monthsShort = [
			"Jan",
			"Feb",
			"Mar",
			"Apr",
			"May",
			"Jun",
			"Jul",
			"Aug",
			"Sep",
			"Oct",
			"Nov",
			"Dec",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 4;
		timeFormat = "h:mm A";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "h:mm A DD/MM/YYYY";
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
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 1) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 2) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 3) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 4 and num < 21) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 21) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 22) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 23) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 24 and num < 31) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 31) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 32) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 33) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 34 and num < 41) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 41) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 42) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 43) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 44 and num < 51) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 51) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 52) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 53) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 54 and num < 61) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 61) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 62) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 63) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 64 and num < 71) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 71) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 72) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 73) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 74 and num < 81) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 81) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 82) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 83) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 84 and num < 91) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 91) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 92) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 93) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 94 and num < 101) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 101) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 102) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 103) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 104 and num < 121) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 121) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 122) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 123) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 124 and num < 131) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 131) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 132) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 133) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 134 and num < 141) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 141) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 142) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 143) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 144 and num < 151) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 151) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 152) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 153) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 154 and num < 161) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 161) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 162) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 163) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 164 and num < 171) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 171) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 172) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 173) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 174 and num < 181) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 181) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 182) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 183) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 184 and num < 191) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 191) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 192) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 193) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 194 and num < 201) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 201) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 202) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 203) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 204 and num < 221) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 221) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 222) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 223) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 224 and num < 231) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 231) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 232) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 233) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 234 and num < 241) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 241) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 242) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 243) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 244 and num < 251) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 251) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 252) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 253) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 254 and num < 261) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 261) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 262) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 263) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 264 and num < 271) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 271) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 272) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 273) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 274 and num < 281) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 281) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 282) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 283) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 284 and num < 291) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 291) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 292) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 293) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 294 and num < 301) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 301) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 302) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 303) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 304 and num < 321) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 321) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 322) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 323) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 324 and num < 331) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 331) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 332) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 333) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 334 and num < 341) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 341) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 342) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 343) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 344 and num < 351) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 351) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 352) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 353) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			if (num > 354 and num < 361) {
				return Text.replace("_~_th", #text("_~_"), Nat.toText(num));
			};
			if (num == 361) {
				return Text.replace("_~_st", #text("_~_"), Nat.toText(num));
			};
			if (num == 362) {
				return Text.replace("_~_nd", #text("_~_"), Nat.toText(num));
			};
			if (num == 363) {
				return Text.replace("_~_rd", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
