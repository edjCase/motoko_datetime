import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SK {
	public let locale : Types.Locale = {
		id = "sk";
		weekdays = [
			"nedeľa",
			"pondelok",
			"utorok",
			"streda",
			"štvrtok",
			"piatok",
			"sobota",
		];
		weekdaysShort = [
			"ne",
			"po",
			"ut",
			"st",
			"št",
			"pi",
			"so",
		];
		weekdaysMin = [
			"ne",
			"po",
			"ut",
			"st",
			"št",
			"pi",
			"so",
		];
		months = [
			"január",
			"február",
			"marec",
			"apríl",
			"máj",
			"jún",
			"júl",
			"august",
			"september",
			"október",
			"november",
			"december",
		];
		monthsShort = [
			"jan",
			"feb",
			"mar",
			"apr",
			"máj",
			"jún",
			"júl",
			"aug",
			"sep",
			"okt",
			"nov",
			"dec",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
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
