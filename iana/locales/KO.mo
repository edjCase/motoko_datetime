import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module KO {
	public let locale : Types.Locale = {
		id = "ko";
		weekdays = [
			"일요일",
			"월요일",
			"화요일",
			"수요일",
			"목요일",
			"금요일",
			"토요일",
		];
		weekdaysShort = [
			"일",
			"월",
			"화",
			"수",
			"목",
			"금",
			"토",
		];
		weekdaysMin = [
			"일",
			"월",
			"화",
			"수",
			"목",
			"금",
			"토",
		];
		months = [
			"1월",
			"2월",
			"3월",
			"4월",
			"5월",
			"6월",
			"7월",
			"8월",
			"9월",
			"10월",
			"11월",
			"12월",
		];
		monthsShort = [
			"1월",
			"2월",
			"3월",
			"4월",
			"5월",
			"6월",
			"7월",
			"8월",
			"9월",
			"10월",
			"11월",
			"12월",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "A h:mm";
		dateFormat = "YYYY.MM.DD.";
		dateTimeFormat = "A h:mm YYYY.MM.DD.";
		longDateFormat = "YYYY.MM.DD.";
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
