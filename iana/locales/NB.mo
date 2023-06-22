import Types "../Types";
module NB {
	public let locale : Types.Locale = {
		id = "NB";
		weekdays = [
			"søndag",
			"mandag",
			"tirsdag",
			"onsdag",
			"torsdag",
			"fredag",
			"lørdag",
		];
		weekdaysShort = [
			"sø.",
			"ma.",
			"ti.",
			"on.",
			"to.",
			"fr.",
			"lø.",
		];
		weekdaysMin = [
			"sø",
			"ma",
			"ti",
			"on",
			"to",
			"fr",
			"lø",
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
