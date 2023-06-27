import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module KY {
	public let locale : Types.Locale = {
		id = "ky";
		weekdays = [
			"Жекшемби",
			"Дүйшөмбү",
			"Шейшемби",
			"Шаршемби",
			"Бейшемби",
			"Жума",
			"Ишемби",
		];
		weekdaysShort = [
			"Жек",
			"Дүй",
			"Шей",
			"Шар",
			"Бей",
			"Жум",
			"Ише",
		];
		weekdaysMin = [
			"Жк",
			"Дй",
			"Шй",
			"Шр",
			"Бй",
			"Жм",
			"Иш",
		];
		months = [
			"январь",
			"февраль",
			"март",
			"апрель",
			"май",
			"июнь",
			"июль",
			"август",
			"сентябрь",
			"октябрь",
			"ноябрь",
			"декабрь",
		];
		monthsShort = [
			"янв",
			"фев",
			"март",
			"апр",
			"май",
			"июнь",
			"июль",
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
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 1 and num < 3) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 3 and num < 5) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 5) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 6) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 7 and num < 9) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 9 and num < 11) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num > 11 and num < 13) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 13 and num < 15) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 15) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 16) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 17 and num < 19) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 19) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 20) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 21 and num < 23) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 23 and num < 25) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 25) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 26) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 27 and num < 29) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 29 and num < 31) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num > 31 and num < 33) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 33 and num < 35) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 35) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 36) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 37 and num < 39) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 39) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 40) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 41 and num < 43) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 43 and num < 45) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 45) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 46) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 47 and num < 49) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 49) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 50) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 51 and num < 53) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 53 and num < 55) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 55) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 56) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 57 and num < 59) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 59) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 60) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 61 and num < 63) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 63 and num < 65) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 65) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 66) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 67 and num < 69) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 69) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num > 70 and num < 73) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 73 and num < 75) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 75) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 76) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 77 and num < 79) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 79) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num > 80 and num < 83) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 83 and num < 85) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 85) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 86) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 87 and num < 89) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 89 and num < 91) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num > 91 and num < 93) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 93 and num < 95) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 95) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 96) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 97 and num < 99) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 99) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 100) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 101 and num < 103) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 103 and num < 105) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 105) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 106) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 107 and num < 109) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 109) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 110) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 111 and num < 113) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 113 and num < 115) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 115) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 116) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 117 and num < 119) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 119) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 120) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 121 and num < 123) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 123 and num < 125) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 125) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 126) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 127 and num < 129) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 129) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 130) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 131 and num < 133) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 133 and num < 135) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 135) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 136) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 137 and num < 139) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 139) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 140) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 141 and num < 143) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 143 and num < 145) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 145) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 146) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 147 and num < 149) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 149) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 150) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 151 and num < 153) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 153 and num < 155) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 155) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 156) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 157 and num < 159) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 159) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 160) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 161 and num < 163) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 163 and num < 165) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 165) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 166) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 167 and num < 169) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 169) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 170) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 171 and num < 173) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 173 and num < 175) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 175) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 176) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 177 and num < 179) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 179) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 180) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 181 and num < 183) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 183 and num < 185) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 185) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 186) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 187 and num < 189) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 189) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 190) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 191 and num < 193) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 193 and num < 195) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 195) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 196) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 197 and num < 199) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 199) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 200) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 201 and num < 203) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 203 and num < 205) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 205) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 206) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 207 and num < 209) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 209) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 210) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 211 and num < 213) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 213 and num < 215) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 215) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 216) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 217 and num < 219) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 219) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 220) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 221 and num < 223) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 223 and num < 225) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 225) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 226) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 227 and num < 229) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 229) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 230) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 231 and num < 233) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 233 and num < 235) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 235) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 236) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 237 and num < 239) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 239) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 240) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 241 and num < 243) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 243 and num < 245) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 245) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 246) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 247 and num < 249) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 249) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 250) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 251 and num < 253) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 253 and num < 255) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 255) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 256) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 257 and num < 259) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 259) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 260) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 261 and num < 263) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 263 and num < 265) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 265) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 266) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 267 and num < 269) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 269) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 270) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 271 and num < 273) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 273 and num < 275) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 275) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 276) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 277 and num < 279) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 279) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 280) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 281 and num < 283) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 283 and num < 285) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 285) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 286) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 287 and num < 289) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 289) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 290) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 291 and num < 293) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 293 and num < 295) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 295) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 296) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 297 and num < 299) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 299) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 300) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 301 and num < 303) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 303 and num < 305) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 305) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 306) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 307 and num < 309) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 309) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 310) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 311 and num < 313) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 313 and num < 315) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 315) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 316) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 317 and num < 319) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 319) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 320) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 321 and num < 323) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 323 and num < 325) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 325) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 326) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 327 and num < 329) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 329) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 330) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 331 and num < 333) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 333 and num < 335) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 335) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 336) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 337 and num < 339) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 339) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 340) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 341 and num < 343) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 343 and num < 345) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 345) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 346) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 347 and num < 349) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 349) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 350) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 351 and num < 353) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 353 and num < 355) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num == 355) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 356) {
				return Text.replace("_~_-чы", #text("_~_"), Nat.toText(num));
			};
			if (num > 357 and num < 359) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num == 359) {
				return Text.replace("_~_-чу", #text("_~_"), Nat.toText(num));
			};
			if (num == 360) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			if (num > 361 and num < 363) {
				return Text.replace("_~_-чи", #text("_~_"), Nat.toText(num));
			};
			if (num > 363 and num < 365) {
				return Text.replace("_~_-чү", #text("_~_"), Nat.toText(num));
			};
			Prelude.unreachable();
		};
	};
};
