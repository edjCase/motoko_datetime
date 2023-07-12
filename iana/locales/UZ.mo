import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module UZ {
	public let locale : Types.Locale = {
		id = "uz";
		weekdays = [
			"Якшанба",
			"Душанба",
			"Сешанба",
			"Чоршанба",
			"Пайшанба",
			"Жума",
			"Шанба",
		];
		weekdaysShort = [
			"Якш",
			"Душ",
			"Сеш",
			"Чор",
			"Пай",
			"Жум",
			"Шан",
		];
		weekdaysMin = [
			"Як",
			"Ду",
			"Се",
			"Чо",
			"Па",
			"Жу",
			"Ша",
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
		firstDayOfWeek = #monday;
		firstDayOfYear = 7;
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
