import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module PT_BR {
	public let locale : Types.Locale = {
		id = "pt-br";
		weekdays = [
			"domingo",
			"segunda-feira",
			"terça-feira",
			"quarta-feira",
			"quinta-feira",
			"sexta-feira",
			"sábado",
		];
		weekdaysShort = [
			"dom",
			"seg",
			"ter",
			"qua",
			"qui",
			"sex",
			"sáb",
		];
		weekdaysMin = [
			"do",
			"2ª",
			"3ª",
			"4ª",
			"5ª",
			"6ª",
			"sá",
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
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
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
