import Types "../Types";
module OC_LNC {
	public let locale : Types.Locale = {
		id = "oc-lnc";
		weekdays = [
			"dimenge",
			"diluns",
			"dimars",
			"dimècres",
			"dijòus",
			"divendres",
			"dissabte",
		];
		weekdaysShort = [
			"dg.",
			"dl.",
			"dm.",
			"dc.",
			"dj.",
			"dv.",
			"ds.",
		];
		weekdaysMin = [
			"dg",
			"dl",
			"dm",
			"dc",
			"dj",
			"dv",
			"ds",
		];
		months = [
			"genièr",
			"febrièr",
			"març",
			"abril",
			"mai",
			"junh",
			"julhet",
			"agost",
			"setembre",
			"octòbre",
			"novembre",
			"decembre",
		];
		monthsShort = [
			"gen.",
			"febr.",
			"març",
			"abr.",
			"mai",
			"junh",
			"julh.",
			"ago.",
			"set.",
			"oct.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "H:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
	};
};
