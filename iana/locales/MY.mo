import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module MY {
	public let locale : Types.Locale = {
		id = "my";
		weekdays = [
			"တနင်္ဂနွေ",
			"တနင်္လာ",
			"အင်္ဂါ",
			"ဗုဒ္ဓဟူး",
			"ကြာသပတေး",
			"သောကြာ",
			"စနေ",
		];
		weekdaysShort = [
			"နွေ",
			"လာ",
			"ဂါ",
			"ဟူး",
			"ကြာ",
			"သော",
			"နေ",
		];
		weekdaysMin = [
			"နွေ",
			"လာ",
			"ဂါ",
			"ဟူး",
			"ကြာ",
			"သော",
			"နေ",
		];
		months = [
			"ဇန်နဝါရီ",
			"ဖေဖော်ဝါရီ",
			"မတ်",
			"ဧပြီ",
			"မေ",
			"ဇွန်",
			"ဇူလိုင်",
			"သြဂုတ်",
			"စက်တင်ဘာ",
			"အောက်တိုဘာ",
			"နိုဝင်ဘာ",
			"ဒီဇင်ဘာ",
		];
		monthsShort = [
			"ဇန်",
			"ဖေ",
			"မတ်",
			"ပြီ",
			"မေ",
			"ဇွန်",
			"လိုင်",
			"သြ",
			"စက်",
			"အောက်",
			"နို",
			"ဒီ",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
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
	};
};
