import Types "../Types";
module NN {
	public let locale : Types.Locale = {
		id = "NN";
		weekdays = [
			"sundag",
			"måndag",
			"tysdag",
			"onsdag",
			"torsdag",
			"fredag",
			"laurdag",
		];
		weekdaysShort = [
			"su.",
			"må.",
			"ty.",
			"on.",
			"to.",
			"fr.",
			"lau.",
		];
		weekdaysMin = [
			"su",
			"må",
			"ty",
			"on",
			"to",
			"fr",
			"la",
		];
		months = [
			"januar",
			"februar",
			"mars",
			"april",
			"mai",
			"juni",
			"juli",
			"august",
			"september",
			"oktober",
			"november",
			"desember",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"mars",
			"apr.",
			"mai",
			"juni",
			"juli",
			"aug.",
			"sep.",
			"okt.",
			"nov.",
			"des.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
	};
};
