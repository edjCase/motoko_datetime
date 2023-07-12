import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
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
	};
};
