import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module BG {
	public let locale : Types.Locale = {
		id = "bg";
		weekdays = [
			"неделя",
			"понеделник",
			"вторник",
			"сряда",
			"четвъртък",
			"петък",
			"събота",
		];
		weekdaysShort = [
			"нед",
			"пон",
			"вто",
			"сря",
			"чет",
			"пет",
			"съб",
		];
		weekdaysMin = [
			"нд",
			"пн",
			"вт",
			"ср",
			"чт",
			"пт",
			"сб",
		];
		months = [
			"януари",
			"февруари",
			"март",
			"април",
			"май",
			"юни",
			"юли",
			"август",
			"септември",
			"октомври",
			"ноември",
			"декември",
		];
		monthsShort = [
			"яну",
			"фев",
			"мар",
			"апр",
			"май",
			"юни",
			"юли",
			"авг",
			"сеп",
			"окт",
			"ное",
			"дек",
		];
		firstDayOfWeek = #monday;
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
