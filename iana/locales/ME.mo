import Types "../Types";
module ME {
	public let locale : Types.Locale = {
		id = "ME";
		weekdays = [
			"nedjelja",
			"ponedjeljak",
			"utorak",
			"srijeda",
			"četvrtak",
			"petak",
			"subota",
		];
		weekdaysShort = [
			"ned.",
			"pon.",
			"uto.",
			"sri.",
			"čet.",
			"pet.",
			"sub.",
		];
		weekdaysMin = [
			"ne",
			"po",
			"ut",
			"sr",
			"če",
			"pe",
			"su",
		];
		months = [
			"januar",
			"februar",
			"mart",
			"april",
			"maj",
			"jun",
			"jul",
			"avgust",
			"septembar",
			"oktobar",
			"novembar",
			"decembar",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"mar.",
			"apr.",
			"maj",
			"jun",
			"jul",
			"avg.",
			"sep.",
			"okt.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
	};
};
