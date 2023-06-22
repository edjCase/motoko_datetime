import Types "../Types";
module ES {
	public let locale : Types.Locale = {
		id = "ES";
		weekdays = [
			"domingo",
			"lunes",
			"martes",
			"miércoles",
			"jueves",
			"viernes",
			"sábado",
		];
		weekdaysShort = [
			"dom.",
			"lun.",
			"mar.",
			"mié.",
			"jue.",
			"vie.",
			"sáb.",
		];
		weekdaysMin = [
			"do",
			"lu",
			"ma",
			"mi",
			"ju",
			"vi",
			"sá",
		];
		months = [
			"enero",
			"febrero",
			"marzo",
			"abril",
			"mayo",
			"junio",
			"julio",
			"agosto",
			"septiembre",
			"octubre",
			"noviembre",
			"diciembre",
		];
		monthsShort = [
			"ene.",
			"feb.",
			"mar.",
			"abr.",
			"may.",
			"jun.",
			"jul.",
			"ago.",
			"sep.",
			"oct.",
			"nov.",
			"dic.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "H:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
	};
};
