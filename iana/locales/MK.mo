import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module MK {
	public let locale : Types.Locale = {
		id = "mk";
		weekdays = [
			"недела",
			"понеделник",
			"вторник",
			"среда",
			"четврток",
			"петок",
			"сабота",
		];
		weekdaysShort = [
			"нед",
			"пон",
			"вто",
			"сре",
			"чет",
			"пет",
			"саб",
		];
		weekdaysMin = [
			"нe",
			"пo",
			"вт",
			"ср",
			"че",
			"пе",
			"сa",
		];
		months = [
			"јануари",
			"февруари",
			"март",
			"април",
			"мај",
			"јуни",
			"јули",
			"август",
			"септември",
			"октомври",
			"ноември",
			"декември",
		];
		monthsShort = [
			"јан",
			"фев",
			"мар",
			"апр",
			"мај",
			"јун",
			"јул",
			"авг",
			"сеп",
			"окт",
			"ное",
			"дек",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "D.MM.YYYY";
		dateTimeFormat = "H:mm D.MM.YYYY";
		longDateFormat = "D.MM.YYYY";
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
