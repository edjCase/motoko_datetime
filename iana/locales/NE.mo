import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module NE {
	public let locale : Types.Locale = {
		id = "ne";
		weekdays = [
			"आइतबार",
			"सोमबार",
			"मङ्गलबार",
			"बुधबार",
			"बिहिबार",
			"शुक्रबार",
			"शनिबार",
		];
		weekdaysShort = [
			"आइत.",
			"सोम.",
			"मङ्गल.",
			"बुध.",
			"बिहि.",
			"शुक्र.",
			"शनि.",
		];
		weekdaysMin = [
			"आ.",
			"सो.",
			"मं.",
			"बु.",
			"बि.",
			"शु.",
			"श.",
		];
		months = [
			"जनवरी",
			"फेब्रुवरी",
			"मार्च",
			"अप्रिल",
			"मई",
			"जुन",
			"जुलाई",
			"अगष्ट",
			"सेप्टेम्बर",
			"अक्टोबर",
			"नोभेम्बर",
			"डिसेम्बर",
		];
		monthsShort = [
			"जन.",
			"फेब्रु.",
			"मार्च",
			"अप्रि.",
			"मई",
			"जुन",
			"जुलाई.",
			"अग.",
			"सेप्ट.",
			"अक्टो.",
			"नोभे.",
			"डिसे.",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "Aको h:mm बजे";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "Aको h:mm बजे DD/MM/YYYY";
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
				case ((0, _)) ("राति", "राति");
				case ((1, _)) ("राति", "राति");
				case ((2, _)) ("राति", "राति");
				case ((3, _)) ("बिहान", "बिहान");
				case ((4, _)) ("बिहान", "बिहान");
				case ((5, _)) ("बिहान", "बिहान");
				case ((6, _)) ("बिहान", "बिहान");
				case ((7, _)) ("बिहान", "बिहान");
				case ((8, _)) ("बिहान", "बिहान");
				case ((9, _)) ("बिहान", "बिहान");
				case ((10, _)) ("बिहान", "बिहान");
				case ((11, _)) ("बिहान", "बिहान");
				case ((12, _)) ("दिउँसो", "दिउँसो");
				case ((13, _)) ("दिउँसो", "दिउँसो");
				case ((14, _)) ("दिउँसो", "दिउँसो");
				case ((15, _)) ("दिउँसो", "दिउँसो");
				case ((16, _)) ("साँझ", "साँझ");
				case ((17, _)) ("साँझ", "साँझ");
				case ((18, _)) ("साँझ", "साँझ");
				case ((19, _)) ("साँझ", "साँझ");
				case ((20, _)) ("राति", "राति");
				case ((21, _)) ("राति", "राति");
				case ((22, _)) ("राति", "राति");
				case ((23, _)) ("राति", "राति");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
