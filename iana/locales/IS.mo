import Types "../Types";
module IS {
	public let locale : Types.Locale = {
		id = "is";
		weekdays = [
			"sunnudagur",
			"mánudagur",
			"þriðjudagur",
			"miðvikudagur",
			"fimmtudagur",
			"föstudagur",
			"laugardagur",
		];
		weekdaysShort = [
			"sun",
			"mán",
			"þri",
			"mið",
			"fim",
			"fös",
			"lau",
		];
		weekdaysMin = [
			"Su",
			"Má",
			"Þr",
			"Mi",
			"Fi",
			"Fö",
			"La",
		];
		months = [
			"janúar",
			"febrúar",
			"mars",
			"apríl",
			"maí",
			"júní",
			"júlí",
			"ágúst",
			"september",
			"október",
			"nóvember",
			"desember",
		];
		monthsShort = [
			"jan",
			"feb",
			"mar",
			"apr",
			"maí",
			"jún",
			"júl",
			"ágú",
			"sep",
			"okt",
			"nóv",
			"des",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
	};
};
