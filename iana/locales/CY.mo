import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module CY {
	public let locale : Types.Locale = {
		id = "cy";
		weekdays = [
			"Dydd Sul",
			"Dydd Llun",
			"Dydd Mawrth",
			"Dydd Mercher",
			"Dydd Iau",
			"Dydd Gwener",
			"Dydd Sadwrn",
		];
		weekdaysShort = [
			"Sul",
			"Llun",
			"Maw",
			"Mer",
			"Iau",
			"Gwe",
			"Sad",
		];
		weekdaysMin = [
			"Su",
			"Ll",
			"Ma",
			"Me",
			"Ia",
			"Gw",
			"Sa",
		];
		months = [
			"Ionawr",
			"Chwefror",
			"Mawrth",
			"Ebrill",
			"Mai",
			"Mehefin",
			"Gorffennaf",
			"Awst",
			"Medi",
			"Hydref",
			"Tachwedd",
			"Rhagfyr",
		];
		monthsShort = [
			"Ion",
			"Chwe",
			"Maw",
			"Ebr",
			"Mai",
			"Meh",
			"Gor",
			"Aws",
			"Med",
			"Hyd",
			"Tach",
			"Rhag",
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
