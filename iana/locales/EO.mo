import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module EO {
	public let locale : Types.Locale = {
		id = "eo";
		weekdays = [
			"dimanĉo",
			"lundo",
			"mardo",
			"merkredo",
			"ĵaŭdo",
			"vendredo",
			"sabato",
		];
		weekdaysShort = [
			"dim",
			"lun",
			"mard",
			"merk",
			"ĵaŭ",
			"ven",
			"sab",
		];
		weekdaysMin = [
			"di",
			"lu",
			"ma",
			"me",
			"ĵa",
			"ve",
			"sa",
		];
		months = [
			"januaro",
			"februaro",
			"marto",
			"aprilo",
			"majo",
			"junio",
			"julio",
			"aŭgusto",
			"septembro",
			"oktobro",
			"novembro",
			"decembro",
		];
		monthsShort = [
			"jan",
			"feb",
			"mart",
			"apr",
			"maj",
			"jun",
			"jul",
			"aŭg",
			"sept",
			"okt",
			"nov",
			"dec",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
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
				case ((0, _)) ("a.t.m.", "A.T.M.");
				case ((1, _)) ("a.t.m.", "A.T.M.");
				case ((2, _)) ("a.t.m.", "A.T.M.");
				case ((3, _)) ("a.t.m.", "A.T.M.");
				case ((4, _)) ("a.t.m.", "A.T.M.");
				case ((5, _)) ("a.t.m.", "A.T.M.");
				case ((6, _)) ("a.t.m.", "A.T.M.");
				case ((7, _)) ("a.t.m.", "A.T.M.");
				case ((8, _)) ("a.t.m.", "A.T.M.");
				case ((9, _)) ("a.t.m.", "A.T.M.");
				case ((10, _)) ("a.t.m.", "A.T.M.");
				case ((11, _)) ("a.t.m.", "A.T.M.");
				case ((12, _)) ("p.t.m.", "P.T.M.");
				case ((13, _)) ("p.t.m.", "P.T.M.");
				case ((14, _)) ("p.t.m.", "P.T.M.");
				case ((15, _)) ("p.t.m.", "P.T.M.");
				case ((16, _)) ("p.t.m.", "P.T.M.");
				case ((17, _)) ("p.t.m.", "P.T.M.");
				case ((18, _)) ("p.t.m.", "P.T.M.");
				case ((19, _)) ("p.t.m.", "P.T.M.");
				case ((20, _)) ("p.t.m.", "P.T.M.");
				case ((21, _)) ("p.t.m.", "P.T.M.");
				case ((22, _)) ("p.t.m.", "P.T.M.");
				case ((23, _)) ("p.t.m.", "P.T.M.");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
