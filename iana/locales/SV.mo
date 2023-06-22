import Types "../Types";
module SV {
	public let locale : Types.Locale = {
		id = "sv";
		weekdays = [
			"söndag",
			"måndag",
			"tisdag",
			"onsdag",
			"torsdag",
			"fredag",
			"lördag",
		];
		weekdaysShort = [
			"sön",
			"mån",
			"tis",
			"ons",
			"tor",
			"fre",
			"lör",
		];
		weekdaysMin = [
			"sö",
			"må",
			"ti",
			"on",
			"to",
			"fr",
			"lö",
		];
		months = [
			"januari",
			"februari",
			"mars",
			"april",
			"maj",
			"juni",
			"juli",
			"augusti",
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
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
	};
};
