import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module DV {
	public let locale : Types.Locale = {
		id = "dv";
		weekdays = [
			"އާދިއްތަ",
			"ހޯމަ",
			"އަންގާރަ",
			"ބުދަ",
			"ބުރާސްފަތި",
			"ހުކުރު",
			"ހޮނިހިރު",
		];
		weekdaysShort = [
			"އާދިއްތަ",
			"ހޯމަ",
			"އަންގާރަ",
			"ބުދަ",
			"ބުރާސްފަތި",
			"ހުކުރު",
			"ހޮނިހިރު",
		];
		weekdaysMin = [
			"އާދި",
			"ހޯމަ",
			"އަން",
			"ބުދަ",
			"ބުރާ",
			"ހުކު",
			"ހޮނި",
		];
		months = [
			"ޖެނުއަރީ",
			"ފެބްރުއަރީ",
			"މާރިޗު",
			"އޭޕްރީލު",
			"މޭ",
			"ޖޫން",
			"ޖުލައި",
			"އޯގަސްޓު",
			"ސެޕްޓެމްބަރު",
			"އޮކްޓޯބަރު",
			"ނޮވެމްބަރު",
			"ޑިސެމްބަރު",
		];
		monthsShort = [
			"ޖެނުއަރީ",
			"ފެބްރުއަރީ",
			"މާރިޗު",
			"އޭޕްރީލު",
			"މޭ",
			"ޖޫން",
			"ޖުލައި",
			"އޯގަސްޓު",
			"ސެޕްޓެމްބަރު",
			"އޮކްޓޯބަރު",
			"ނޮވެމްބަރު",
			"ޑިސެމްބަރު",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 12;
		timeFormat = "HH:mm";
		dateFormat = "D/M/YYYY";
		dateTimeFormat = "HH:mm D/M/YYYY";
		longDateFormat = "D/M/YYYY";
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
	};
};
