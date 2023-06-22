import Types "../Types";
module HU {
	public let locale : Types.Locale = {
		id = "hu";
		weekdays = [
			"vasárnap",
			"hétfő",
			"kedd",
			"szerda",
			"csütörtök",
			"péntek",
			"szombat",
		];
		weekdaysShort = [
			"vas",
			"hét",
			"kedd",
			"sze",
			"csüt",
			"pén",
			"szo",
		];
		weekdaysMin = [
			"v",
			"h",
			"k",
			"sze",
			"cs",
			"p",
			"szo",
		];
		months = [
			"január",
			"február",
			"március",
			"április",
			"május",
			"június",
			"július",
			"augusztus",
			"szeptember",
			"október",
			"november",
			"december",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"márc.",
			"ápr.",
			"máj.",
			"jún.",
			"júl.",
			"aug.",
			"szept.",
			"okt.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "YYYY.MM.DD.";
		dateTimeFormat = "H:mm YYYY.MM.DD.";
		longDateFormat = "YYYY.MM.DD.";
	};
};
