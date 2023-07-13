import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import TextX "mo:xtended-text/TextX";
import Char "mo:base/Char";
module TA {
	public let locale : Types.Locale = {
		id = "ta";
		weekdays = [
			"ஞாயிற்றுக்கிழமை",
			"திங்கட்கிழமை",
			"செவ்வாய்கிழமை",
			"புதன்கிழமை",
			"வியாழக்கிழமை",
			"வெள்ளிக்கிழமை",
			"சனிக்கிழமை",
		];
		weekdaysShort = [
			"ஞாயிறு",
			"திங்கள்",
			"செவ்வாய்",
			"புதன்",
			"வியாழன்",
			"வெள்ளி",
			"சனி",
		];
		weekdaysMin = [
			"ஞா",
			"தி",
			"செ",
			"பு",
			"வி",
			"வெ",
			"ச",
		];
		months = [
			"ஜனவரி",
			"பிப்ரவரி",
			"மார்ச்",
			"ஏப்ரல்",
			"மே",
			"ஜூன்",
			"ஜூலை",
			"ஆகஸ்ட்",
			"செப்டெம்பர்",
			"அக்டோபர்",
			"நவம்பர்",
			"டிசம்பர்",
		];
		monthsShort = [
			"ஜனவரி",
			"பிப்ரவரி",
			"மார்ச்",
			"ஏப்ரல்",
			"மே",
			"ஜூன்",
			"ஜூலை",
			"ஆகஸ்ட்",
			"செப்டெம்பர்",
			"அக்டோபர்",
			"நவம்பர்",
			"டிசம்பர்",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
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
