import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module PT {
	public let locale : Types.Locale = {
		id = "pt";
		weekdays = [
			"Domingo",
			"Segunda-feira",
			"Terça-feira",
			"Quarta-feira",
			"Quinta-feira",
			"Sexta-feira",
			"Sábado",
		];
		weekdaysShort = [
			"Dom",
			"Seg",
			"Ter",
			"Qua",
			"Qui",
			"Sex",
			"Sáb",
		];
		weekdaysMin = [
			"Do",
			"2ª",
			"3ª",
			"4ª",
			"5ª",
			"6ª",
			"Sá",
		];
		months = [
			"janeiro",
			"fevereiro",
			"março",
			"abril",
			"maio",
			"junho",
			"julho",
			"agosto",
			"setembro",
			"outubro",
			"novembro",
			"dezembro",
		];
		monthsShort = [
			"jan",
			"fev",
			"mar",
			"abr",
			"mai",
			"jun",
			"jul",
			"ago",
			"set",
			"out",
			"nov",
			"dez",
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
