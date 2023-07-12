import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module GL {
	public let locale : Types.Locale = {
		id = "gl";
		weekdays = [
			"domingo",
			"luns",
			"martes",
			"mércores",
			"xoves",
			"venres",
			"sábado",
		];
		weekdaysShort = [
			"dom.",
			"lun.",
			"mar.",
			"mér.",
			"xov.",
			"ven.",
			"sáb.",
		];
		weekdaysMin = [
			"do",
			"lu",
			"ma",
			"mé",
			"xo",
			"ve",
			"sá",
		];
		months = [
			"xaneiro",
			"febreiro",
			"marzo",
			"abril",
			"maio",
			"xuño",
			"xullo",
			"agosto",
			"setembro",
			"outubro",
			"novembro",
			"decembro",
		];
		monthsShort = [
			"xan.",
			"feb.",
			"mar.",
			"abr.",
			"mai.",
			"xuñ.",
			"xul.",
			"ago.",
			"set.",
			"out.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = #monday;
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
