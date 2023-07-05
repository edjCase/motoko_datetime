import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TG {
	public let locale : Types.Locale = {
		id = "tg";
		weekdays = [
			"якшанбе",
			"душанбе",
			"сешанбе",
			"чоршанбе",
			"панҷшанбе",
			"ҷумъа",
			"шанбе",
		];
		weekdaysShort = [
			"яшб",
			"дшб",
			"сшб",
			"чшб",
			"пшб",
			"ҷум",
			"шнб",
		];
		weekdaysMin = [
			"яш",
			"дш",
			"сш",
			"чш",
			"пш",
			"ҷм",
			"шб",
		];
		months = [
			"январ",
			"феврал",
			"март",
			"апрел",
			"май",
			"июн",
			"июл",
			"август",
			"сентябр",
			"октябр",
			"ноябр",
			"декабр",
		];
		monthsShort = [
			"янв",
			"фев",
			"мар",
			"апр",
			"май",
			"июн",
			"июл",
			"авг",
			"сен",
			"окт",
			"ноя",
			"дек",
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
