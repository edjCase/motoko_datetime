import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SI {
	public let locale : Types.Locale = {
		id = "si";
		weekdays = [
			"ඉරිදා",
			"සඳුදා",
			"අඟහරුවාදා",
			"බදාදා",
			"බ්‍රහස්පතින්දා",
			"සිකුරාදා",
			"සෙනසුරාදා",
		];
		weekdaysShort = [
			"ඉරි",
			"සඳු",
			"අඟ",
			"බදා",
			"බ්‍රහ",
			"සිකු",
			"සෙන",
		];
		weekdaysMin = [
			"ඉ",
			"ස",
			"අ",
			"බ",
			"බ්‍ර",
			"සි",
			"සෙ",
		];
		months = [
			"ජනවාරි",
			"පෙබරවාරි",
			"මාර්තු",
			"අප්‍රේල්",
			"මැයි",
			"ජූනි",
			"ජූලි",
			"අගෝස්තු",
			"සැප්තැම්බර්",
			"ඔක්තෝබර්",
			"නොවැම්බර්",
			"දෙසැම්බර්",
		];
		monthsShort = [
			"ජන",
			"පෙබ",
			"මාර්",
			"අප්",
			"මැයි",
			"ජූනි",
			"ජූලි",
			"අගෝ",
			"සැප්",
			"ඔක්",
			"නොවැ",
			"දෙසැ",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "a h:mm";
		dateFormat = "YYYY/MM/DD";
		dateTimeFormat = "a h:mm YYYY/MM/DD";
		longDateFormat = "YYYY/MM/DD";
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
