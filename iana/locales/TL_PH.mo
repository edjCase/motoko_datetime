import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import TextX "mo:xtended-text/TextX";
import Char "mo:base/Char";
module TL_PH {
	public let locale : Types.Locale = {
		id = "tl-ph";
		weekdays = [
			"Linggo",
			"Lunes",
			"Martes",
			"Miyerkules",
			"Huwebes",
			"Biyernes",
			"Sabado",
		];
		weekdaysShort = [
			"Lin",
			"Lun",
			"Mar",
			"Miy",
			"Huw",
			"Biy",
			"Sab",
		];
		weekdaysMin = [
			"Li",
			"Lu",
			"Ma",
			"Mi",
			"Hu",
			"Bi",
			"Sab",
		];
		months = [
			"Enero",
			"Pebrero",
			"Marso",
			"Abril",
			"Mayo",
			"Hunyo",
			"Hulyo",
			"Agosto",
			"Setyembre",
			"Oktubre",
			"Nobyembre",
			"Disyembre",
		];
		monthsShort = [
			"Ene",
			"Peb",
			"Mar",
			"Abr",
			"May",
			"Hun",
			"Hul",
			"Ago",
			"Set",
			"Okt",
			"Nob",
			"Dis",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "MM/D/YYYY";
		dateTimeFormat = "HH:mm MM/D/YYYY";
		longDateFormat = "MM/D/YYYY";
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
