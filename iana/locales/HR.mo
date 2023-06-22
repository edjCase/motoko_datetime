import Types "../Types";
module HR {
	public let locale : Types.Locale = {
		id = "hr";
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
			"siječanj",
			"veljača",
			"ožujak",
			"travanj",
			"svibanj",
			"lipanj",
			"srpanj",
			"kolovoz",
			"rujan",
			"listopad",
			"studeni",
			"prosinac",
		];
		monthsShort = [
			"sij.",
			"velj.",
			"ožu.",
			"tra.",
			"svi.",
			"lip.",
			"srp.",
			"kol.",
			"ruj.",
			"lis.",
			"stu.",
			"pro.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
	};
};
