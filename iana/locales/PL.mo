import Types "../Types";
module PL {
	public let locale : Types.Locale = {
		id = "pl";
		weekdays = [
			"niedziela",
			"poniedziałek",
			"wtorek",
			"środa",
			"czwartek",
			"piątek",
			"sobota",
		];
		weekdaysShort = [
			"ndz",
			"pon",
			"wt",
			"śr",
			"czw",
			"pt",
			"sob",
		];
		weekdaysMin = [
			"Nd",
			"Pn",
			"Wt",
			"Śr",
			"Cz",
			"Pt",
			"So",
		];
		months = [
			"styczeń",
			"luty",
			"marzec",
			"kwiecień",
			"maj",
			"czerwiec",
			"lipiec",
			"sierpień",
			"wrzesień",
			"październik",
			"listopad",
			"grudzień",
		];
		monthsShort = [
			"sty",
			"lut",
			"mar",
			"kwi",
			"maj",
			"cze",
			"lip",
			"sie",
			"wrz",
			"paź",
			"lis",
			"gru",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
	};
};
