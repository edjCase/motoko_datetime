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
	};
};
