import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import TextX "mo:xtended-text/TextX";
import Char "mo:base/Char";
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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			if (hour < 12) {
				if (isLower) "am" else "AM";
			} else {
				if (isLower) "pm" else "PM";
			};
		};
		parseMeridiemAsIsPM = func (text : Text) : ?{
			remainingText : Text;
			value : Bool;
		} {
			let mederiem = TextX.slice(text, 0, 2);
			switch (TextX.toLower(mederiem)) {
				case ("pm") {
					?{
						remainingText = TextX.sliceToEnd(text, 2);
						value = true;
					};
				};
				case ("am") {
					?{
						remainingText = TextX.sliceToEnd(text, 2);
						value = false;
					};
				};
				case (_) {
					null;
				};
			};
		};
		getOrdinal = func (num : Int) : Text {
			let suffix = if (num % 100 >= 11 and num % 100 <= 13) {
				"th";
			} else switch (num % 10) {
				case (1) "st";
				case (2) "nd";
				case (3) "rd";
				case (_) "th";
			};
			return Int.toText(num) # suffix;
		};
		parseOrdinal = func(ordinal : Text) : ?{
			remainingText : Text;
			value : Nat;
		} {
			var startIndex = 0;
			label f for (char in ordinal.chars()) {
				if (Char.isDigit(char)) {
					startIndex += 1;
				} else {
					break f;
				};
			};
			let numberText = TextX.slice(ordinal, 0, startIndex);
			let suffix = TextX.slice(ordinal, startIndex, 2);
			if (suffix == "st" or suffix == "nd" or suffix == "rd" or suffix == "th") {
				let ?value = Nat.fromText(numberText) else return null;
				return ?{
					remainingText = TextX.sliceToEnd(ordinal, startIndex + 2);
					value = value;
				};
			};
			return null;
		};
	};
};
