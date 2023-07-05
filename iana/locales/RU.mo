import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module RU {
	public let locale : Types.Locale = {
		id = "ru";
		weekdays = [
			"воскресенье",
			"понедельник",
			"вторник",
			"среда",
			"четверг",
			"пятница",
			"суббота",
		];
		weekdaysShort = [
			"вс",
			"пн",
			"вт",
			"ср",
			"чт",
			"пт",
			"сб",
		];
		weekdaysMin = [
			"вс",
			"пн",
			"вт",
			"ср",
			"чт",
			"пт",
			"сб",
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
			"янв.",
			"февр.",
			"март",
			"апр.",
			"май",
			"июнь",
			"июль",
			"авг.",
			"сент.",
			"окт.",
			"нояб.",
			"дек.",
		];
		firstDayOfWeek = 1;
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
