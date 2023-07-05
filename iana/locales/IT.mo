import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module IT {
	public let locale : Types.Locale = {
		id = "it";
		weekdays = [
			"domenica",
			"lunedì",
			"martedì",
			"mercoledì",
			"giovedì",
			"venerdì",
			"sabato",
		];
		weekdaysShort = [
			"dom",
			"lun",
			"mar",
			"mer",
			"gio",
			"ven",
			"sab",
		];
		weekdaysMin = [
			"do",
			"lu",
			"ma",
			"me",
			"gi",
			"ve",
			"sa",
		];
		months = [
			"gennaio",
			"febbraio",
			"marzo",
			"aprile",
			"maggio",
			"giugno",
			"luglio",
			"agosto",
			"settembre",
			"ottobre",
			"novembre",
			"dicembre",
		];
		monthsShort = [
			"gen",
			"feb",
			"mar",
			"apr",
			"mag",
			"giu",
			"lug",
			"ago",
			"set",
			"ott",
			"nov",
			"dic",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
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
