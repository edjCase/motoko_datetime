import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module UK {
	public let locale : Types.Locale = {
		id = "uk";
		weekdays = [
			"неділя",
			"понеділок",
			"вівторок",
			"середа",
			"четвер",
			"п’ятниця",
			"субота",
		];
		weekdaysShort = [
			"нд",
			"пн",
			"вт",
			"ср",
			"чт",
			"пт",
			"сб",
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
			"січень",
			"лютий",
			"березень",
			"квітень",
			"травень",
			"червень",
			"липень",
			"серпень",
			"вересень",
			"жовтень",
			"листопад",
			"грудень",
		];
		monthsShort = [
			"січ",
			"лют",
			"бер",
			"квіт",
			"трав",
			"черв",
			"лип",
			"серп",
			"вер",
			"жовт",
			"лист",
			"груд",
		];
		firstDayOfWeek = 1;
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
