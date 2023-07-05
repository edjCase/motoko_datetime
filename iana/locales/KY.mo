import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module KY {
	public let locale : Types.Locale = {
		id = "ky";
		weekdays = [
			"Жекшемби",
			"Дүйшөмбү",
			"Шейшемби",
			"Шаршемби",
			"Бейшемби",
			"Жума",
			"Ишемби",
		];
		weekdaysShort = [
			"Жек",
			"Дүй",
			"Шей",
			"Шар",
			"Бей",
			"Жум",
			"Ише",
		];
		weekdaysMin = [
			"Жк",
			"Дй",
			"Шй",
			"Шр",
			"Бй",
			"Жм",
			"Иш",
		];
		months = [
			"январь",
			"февраль",
			"март",
			"апрель",
			"май",
			"июнь",
			"июль",
			"август",
			"сентябрь",
			"октябрь",
			"ноябрь",
			"декабрь",
		];
		monthsShort = [
			"янв",
			"фев",
			"март",
			"апр",
			"май",
			"июнь",
			"июль",
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
