import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SL {
	public let locale : Types.Locale = {
		id = "sl";
		weekdays = [
			"nedelja",
			"ponedeljek",
			"torek",
			"sreda",
			"četrtek",
			"petek",
			"sobota",
		];
		weekdaysShort = [
			"ned.",
			"pon.",
			"tor.",
			"sre.",
			"čet.",
			"pet.",
			"sob.",
		];
		weekdaysMin = [
			"ne",
			"po",
			"to",
			"sr",
			"če",
			"pe",
			"so",
		];
		months = [
			"januar",
			"februar",
			"marec",
			"april",
			"maj",
			"junij",
			"julij",
			"avgust",
			"september",
			"oktober",
			"november",
			"december",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"mar.",
			"apr.",
			"maj.",
			"jun.",
			"jul.",
			"avg.",
			"sep.",
			"okt.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "DD. MM. YYYY";
		dateTimeFormat = "H:mm DD. MM. YYYY";
		longDateFormat = "DD. MM. YYYY";
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
