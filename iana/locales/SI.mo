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
		firstDayOfWeek = 0;
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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("පෙ.ව.", "පෙර වරු");
				case ((1, _)) ("පෙ.ව.", "පෙර වරු");
				case ((2, _)) ("පෙ.ව.", "පෙර වරු");
				case ((3, _)) ("පෙ.ව.", "පෙර වරු");
				case ((4, _)) ("පෙ.ව.", "පෙර වරු");
				case ((5, _)) ("පෙ.ව.", "පෙර වරු");
				case ((6, _)) ("පෙ.ව.", "පෙර වරු");
				case ((7, _)) ("පෙ.ව.", "පෙර වරු");
				case ((8, _)) ("පෙ.ව.", "පෙර වරු");
				case ((9, _)) ("පෙ.ව.", "පෙර වරු");
				case ((10, _)) ("පෙ.ව.", "පෙර වරු");
				case ((11, _)) ("පෙ.ව.", "පෙර වරු");
				case ((12, _)) ("ප.ව.", "පස් වරු");
				case ((13, _)) ("ප.ව.", "පස් වරු");
				case ((14, _)) ("ප.ව.", "පස් වරු");
				case ((15, _)) ("ප.ව.", "පස් වරු");
				case ((16, _)) ("ප.ව.", "පස් වරු");
				case ((17, _)) ("ප.ව.", "පස් වරු");
				case ((18, _)) ("ප.ව.", "පස් වරු");
				case ((19, _)) ("ප.ව.", "පස් වරු");
				case ((20, _)) ("ප.ව.", "පස් වරු");
				case ((21, _)) ("ප.ව.", "පස් වරු");
				case ((22, _)) ("ප.ව.", "පස් වරු");
				case ((23, _)) ("ප.ව.", "පස් වරු");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
