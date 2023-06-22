import Types "../Types";
module FO {
	public let locale : Types.Locale = {
		id = "fo";
		weekdays = [
			"sunnudagur",
			"mánadagur",
			"týsdagur",
			"mikudagur",
			"hósdagur",
			"fríggjadagur",
			"leygardagur",
		];
		weekdaysShort = [
			"sun",
			"mán",
			"týs",
			"mik",
			"hós",
			"frí",
			"ley",
		];
		weekdaysMin = [
			"su",
			"má",
			"tý",
			"mi",
			"hó",
			"fr",
			"le",
		];
		months = [
			"januar",
			"februar",
			"mars",
			"apríl",
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
			"jan",
			"feb",
			"mar",
			"apr",
			"mai",
			"jun",
			"jul",
			"aug",
			"sep",
			"okt",
			"nov",
			"des",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
	};
};
