import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SR_CYRL {
	public let locale : Types.Locale = {
		id = "sr-cyrl";
		weekdays = [
			"недеља",
			"понедељак",
			"уторак",
			"среда",
			"четвртак",
			"петак",
			"субота",
		];
		weekdaysShort = [
			"нед.",
			"пон.",
			"уто.",
			"сре.",
			"чет.",
			"пет.",
			"суб.",
		];
		weekdaysMin = [
			"не",
			"по",
			"ут",
			"ср",
			"че",
			"пе",
			"су",
		];
		months = [
			"јануар",
			"фебруар",
			"март",
			"април",
			"мај",
			"јун",
			"јул",
			"август",
			"септембар",
			"октобар",
			"новембар",
			"децембар",
		];
		monthsShort = [
			"јан.",
			"феб.",
			"мар.",
			"апр.",
			"мај",
			"јун",
			"јул",
			"авг.",
			"сеп.",
			"окт.",
			"нов.",
			"дец.",
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
