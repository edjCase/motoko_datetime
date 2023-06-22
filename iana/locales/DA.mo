import Types "../Types";
module DA {
	public let locale : Types.Locale = {
		id = "da";
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
			"søn",
			"man",
			"tir",
			"ons",
			"tor",
			"fre",
			"lør",
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
			"marts",
			"april",
			"maj",
			"juni",
			"juli",
			"august",
			"september",
			"oktober",
			"november",
			"december",
		];
		monthsShort = [
			"jan",
			"feb",
			"mar",
			"apr",
			"maj",
			"jun",
			"jul",
			"aug",
			"sep",
			"okt",
			"nov",
			"dec",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
	};
};
