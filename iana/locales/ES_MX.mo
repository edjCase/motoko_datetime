import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module ES_MX {
	public let locale : Types.Locale = {
		id = "es-mx";
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
		firstDayOfWeek = #sunday;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "H:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		eras = [
			{
				start = ?-62135568422000000;
				end = null;
				offset = 1;
				fullName = "Anno Domini";
				narrowName = "AD";
				abbreviatedName = "AD";
			},
			{
				start = null;
				end = ?-62135654822000000;
				offset = 1;
				fullName = "Before Christ";
				narrowName = "BC";
				abbreviatedName = "BC";
			},
		];
	};
};
