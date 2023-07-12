import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module HY_AM {
	public let locale : Types.Locale = {
		id = "hy-am";
		weekdays = [
			"կիրակի",
			"երկուշաբթի",
			"երեքշաբթի",
			"չորեքշաբթի",
			"հինգշաբթի",
			"ուրբաթ",
			"շաբաթ",
		];
		weekdaysShort = [
			"կրկ",
			"երկ",
			"երք",
			"չրք",
			"հնգ",
			"ուրբ",
			"շբթ",
		];
		weekdaysMin = [
			"կրկ",
			"երկ",
			"երք",
			"չրք",
			"հնգ",
			"ուրբ",
			"շբթ",
		];
		months = [
			"հունվար",
			"փետրվար",
			"մարտ",
			"ապրիլ",
			"մայիս",
			"հունիս",
			"հուլիս",
			"օգոստոս",
			"սեպտեմբեր",
			"հոկտեմբեր",
			"նոյեմբեր",
			"դեկտեմբեր",
		];
		monthsShort = [
			"հնվ",
			"փտր",
			"մրտ",
			"ապր",
			"մյս",
			"հնս",
			"հլս",
			"օգս",
			"սպտ",
			"հկտ",
			"նմբ",
			"դկտ",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
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
