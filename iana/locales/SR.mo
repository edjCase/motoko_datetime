import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SR {
	public let locale : Types.Locale = {
		id = "sr";
		weekdays = [
			"nedelja",
			"ponedeljak",
			"utorak",
			"sreda",
			"četvrtak",
			"petak",
			"subota",
		];
		weekdaysShort = [
			"ned.",
			"pon.",
			"uto.",
			"sre.",
			"čet.",
			"pet.",
			"sub.",
		];
		weekdaysMin = [
			"ne",
			"po",
			"ut",
			"sr",
			"če",
			"pe",
			"su",
		];
		months = [
			"januar",
			"februar",
			"mart",
			"april",
			"maj",
			"jun",
			"jul",
			"avgust",
			"septembar",
			"oktobar",
			"novembar",
			"decembar",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"mar.",
			"apr.",
			"maj",
			"jun",
			"jul",
			"avg.",
			"sep.",
			"okt.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "D. M. YYYY.";
		dateTimeFormat = "H:mm D. M. YYYY.";
		longDateFormat = "D. M. YYYY.";
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
