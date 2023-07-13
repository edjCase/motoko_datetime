import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import TextX "mo:xtended-text/TextX";
import Char "mo:base/Char";
module BO {
	public let locale : Types.Locale = {
		id = "bo";
		weekdays = [
			"གཟའ་ཉི་མ་",
			"གཟའ་ཟླ་བ་",
			"གཟའ་མིག་དམར་",
			"གཟའ་ལྷག་པ་",
			"གཟའ་ཕུར་བུ",
			"གཟའ་པ་སངས་",
			"གཟའ་སྤེན་པ་",
		];
		weekdaysShort = [
			"ཉི་མ་",
			"ཟླ་བ་",
			"མིག་དམར་",
			"ལྷག་པ་",
			"ཕུར་བུ",
			"པ་སངས་",
			"སྤེན་པ་",
		];
		weekdaysMin = [
			"ཉི",
			"ཟླ",
			"མིག",
			"ལྷག",
			"ཕུར",
			"སངས",
			"སྤེན",
		];
		months = [
			"ཟླ་བ་དང་པོ",
			"ཟླ་བ་གཉིས་པ",
			"ཟླ་བ་གསུམ་པ",
			"ཟླ་བ་བཞི་པ",
			"ཟླ་བ་ལྔ་པ",
			"ཟླ་བ་དྲུག་པ",
			"ཟླ་བ་བདུན་པ",
			"ཟླ་བ་བརྒྱད་པ",
			"ཟླ་བ་དགུ་པ",
			"ཟླ་བ་བཅུ་པ",
			"ཟླ་བ་བཅུ་གཅིག་པ",
			"ཟླ་བ་བཅུ་གཉིས་པ",
		];
		monthsShort = [
			"ཟླ་1",
			"ཟླ་2",
			"ཟླ་3",
			"ཟླ་4",
			"ཟླ་5",
			"ཟླ་6",
			"ཟླ་7",
			"ཟླ་8",
			"ཟླ་9",
			"ཟླ་10",
			"ཟླ་11",
			"ཟླ་12",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "A h:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm DD/MM/YYYY";
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
