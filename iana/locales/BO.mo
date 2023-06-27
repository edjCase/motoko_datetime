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
		firstDayOfWeek = 0;
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
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("མཚན་མོ", "མཚན་མོ");
				case ((1, _)) ("མཚན་མོ", "མཚན་མོ");
				case ((2, _)) ("མཚན་མོ", "མཚན་མོ");
				case ((3, _)) ("མཚན་མོ", "མཚན་མོ");
				case ((4, _)) ("ཞོགས་ཀས", "ཞོགས་ཀས");
				case ((5, _)) ("ཞོགས་ཀས", "ཞོགས་ཀས");
				case ((6, _)) ("ཞོགས་ཀས", "ཞོགས་ཀས");
				case ((7, _)) ("ཞོགས་ཀས", "ཞོགས་ཀས");
				case ((8, _)) ("ཞོགས་ཀས", "ཞོགས་ཀས");
				case ((9, _)) ("ཞོགས་ཀས", "ཞོགས་ཀས");
				case ((10, _)) ("ཉིན་གུང", "ཉིན་གུང");
				case ((11, _)) ("ཉིན་གུང", "ཉིན་གུང");
				case ((12, _)) ("ཉིན་གུང", "ཉིན་གུང");
				case ((13, _)) ("ཉིན་གུང", "ཉིན་གུང");
				case ((14, _)) ("ཉིན་གུང", "ཉིན་གུང");
				case ((15, _)) ("ཉིན་གུང", "ཉིན་གུང");
				case ((16, _)) ("ཉིན་གུང", "ཉིན་གུང");
				case ((17, _)) ("དགོང་དག", "དགོང་དག");
				case ((18, _)) ("དགོང་དག", "དགོང་དག");
				case ((19, _)) ("དགོང་དག", "དགོང་དག");
				case ((20, _)) ("མཚན་མོ", "མཚན་མོ");
				case ((21, _)) ("མཚན་མོ", "མཚན་མོ");
				case ((22, _)) ("མཚན་མོ", "མཚན་མོ");
				case ((23, _)) ("མཚན་མོ", "མཚན་མོ");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
