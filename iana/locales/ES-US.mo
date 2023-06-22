import Types "../Types";
module ES-US {
	public let locale : Types.Locale = {
		id = "ES-US";
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
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "h:mm A";
		dateFormat = "MM/DD/YYYY";
		dateTimeFormat = "h:mm A MM/DD/YYYY";
		longDateFormat = "MM/DD/YYYY";
	};
};
