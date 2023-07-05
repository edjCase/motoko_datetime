import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module BE {
	public let locale : Types.Locale = {
		id = "be";
		weekdays = [
			"нядзеля",
			"панядзелак",
			"аўторак",
			"серада",
			"чацвер",
			"пятніца",
			"субота",
		];
		weekdaysShort = [
			"нд",
			"пн",
			"ат",
			"ср",
			"чц",
			"пт",
			"сб",
		];
		weekdaysMin = [
			"нд",
			"пн",
			"ат",
			"ср",
			"чц",
			"пт",
			"сб",
		];
		months = [
			"студзень",
			"люты",
			"сакавік",
			"красавік",
			"травень",
			"чэрвень",
			"ліпень",
			"жнівень",
			"верасень",
			"кастрычнік",
			"лістапад",
			"снежань",
		];
		monthsShort = [
			"студ",
			"лют",
			"сак",
			"крас",
			"трав",
			"чэрв",
			"ліп",
			"жнів",
			"вер",
			"каст",
			"ліст",
			"снеж",
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
