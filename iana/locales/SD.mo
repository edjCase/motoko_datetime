import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SD {
	public let locale : Types.Locale = {
		id = "sd";
		weekdays = [
			"آچر",
			"سومر",
			"اڱارو",
			"اربع",
			"خميس",
			"جمع",
			"ڇنڇر",
		];
		weekdaysShort = [
			"آچر",
			"سومر",
			"اڱارو",
			"اربع",
			"خميس",
			"جمع",
			"ڇنڇر",
		];
		weekdaysMin = [
			"آچر",
			"سومر",
			"اڱارو",
			"اربع",
			"خميس",
			"جمع",
			"ڇنڇر",
		];
		months = [
			"جنوري",
			"فيبروري",
			"مارچ",
			"اپريل",
			"مئي",
			"جون",
			"جولاءِ",
			"آگسٽ",
			"سيپٽمبر",
			"آڪٽوبر",
			"نومبر",
			"ڊسمبر",
		];
		monthsShort = [
			"جنوري",
			"فيبروري",
			"مارچ",
			"اپريل",
			"مئي",
			"جون",
			"جولاءِ",
			"آگسٽ",
			"سيپٽمبر",
			"آڪٽوبر",
			"نومبر",
			"ڊسمبر",
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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("صبح", "صبح");
				case ((1, _)) ("صبح", "صبح");
				case ((2, _)) ("صبح", "صبح");
				case ((3, _)) ("صبح", "صبح");
				case ((4, _)) ("صبح", "صبح");
				case ((5, _)) ("صبح", "صبح");
				case ((6, _)) ("صبح", "صبح");
				case ((7, _)) ("صبح", "صبح");
				case ((8, _)) ("صبح", "صبح");
				case ((9, _)) ("صبح", "صبح");
				case ((10, _)) ("صبح", "صبح");
				case ((11, _)) ("صبح", "صبح");
				case ((12, _)) ("شام", "شام");
				case ((13, _)) ("شام", "شام");
				case ((14, _)) ("شام", "شام");
				case ((15, _)) ("شام", "شام");
				case ((16, _)) ("شام", "شام");
				case ((17, _)) ("شام", "شام");
				case ((18, _)) ("شام", "شام");
				case ((19, _)) ("شام", "شام");
				case ((20, _)) ("شام", "شام");
				case ((21, _)) ("شام", "شام");
				case ((22, _)) ("شام", "شام");
				case ((23, _)) ("شام", "شام");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
