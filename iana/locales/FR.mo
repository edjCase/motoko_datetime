import Types "../Types";
module FR {
	public let locale : Types.Locale = {
		id = "fr";
		weekdays = [
			"dimanche",
			"lundi",
			"mardi",
			"mercredi",
			"jeudi",
			"vendredi",
			"samedi",
		];
		weekdaysShort = [
			"dim.",
			"lun.",
			"mar.",
			"mer.",
			"jeu.",
			"ven.",
			"sam.",
		];
		weekdaysMin = [
			"di",
			"lu",
			"ma",
			"me",
			"je",
			"ve",
			"sa",
		];
		months = [
			"janvier",
			"février",
			"mars",
			"avril",
			"mai",
			"juin",
			"juillet",
			"août",
			"septembre",
			"octobre",
			"novembre",
			"décembre",
		];
		monthsShort = [
			"janv.",
			"févr.",
			"mars",
			"avr.",
			"mai",
			"juin",
			"juil.",
			"août",
			"sept.",
			"oct.",
			"nov.",
			"déc.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
	};
};
