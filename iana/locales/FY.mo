import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module FY {
	public let locale : Types.Locale = {
		id = "fy";
		weekdays = [
			"snein",
			"moandei",
			"tiisdei",
			"woansdei",
			"tongersdei",
			"freed",
			"sneon",
		];
		weekdaysShort = [
			"si.",
			"mo.",
			"ti.",
			"wo.",
			"to.",
			"fr.",
			"so.",
		];
		weekdaysMin = [
			"Si",
			"Mo",
			"Ti",
			"Wo",
			"To",
			"Fr",
			"So",
		];
		months = [
			"jannewaris",
			"febrewaris",
			"maart",
			"april",
			"maaie",
			"juny",
			"july",
			"augustus",
			"septimber",
			"oktober",
			"novimber",
			"desimber",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"mrt.",
			"apr.",
			"mai",
			"jun.",
			"jul.",
			"aug.",
			"sep.",
			"okt.",
			"nov.",
			"des.",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD-MM-YYYY";
		dateTimeFormat = "HH:mm DD-MM-YYYY";
		longDateFormat = "DD-MM-YYYY";
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
