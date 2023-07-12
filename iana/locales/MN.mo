import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module MN {
	public let locale : Types.Locale = {
		id = "mn";
		weekdays = [
			"Ням",
			"Даваа",
			"Мягмар",
			"Лхагва",
			"Пүрэв",
			"Баасан",
			"Бямба",
		];
		weekdaysShort = [
			"Ням",
			"Дав",
			"Мяг",
			"Лха",
			"Пүр",
			"Баа",
			"Бям",
		];
		weekdaysMin = [
			"Ня",
			"Да",
			"Мя",
			"Лх",
			"Пү",
			"Ба",
			"Бя",
		];
		months = [
			"Нэгдүгээр сар",
			"Хоёрдугаар сар",
			"Гуравдугаар сар",
			"Дөрөвдүгээр сар",
			"Тавдугаар сар",
			"Зургадугаар сар",
			"Долдугаар сар",
			"Наймдугаар сар",
			"Есдүгээр сар",
			"Аравдугаар сар",
			"Арван нэгдүгээр сар",
			"Арван хоёрдугаар сар",
		];
		monthsShort = [
			"1 сар",
			"2 сар",
			"3 сар",
			"4 сар",
			"5 сар",
			"6 сар",
			"7 сар",
			"8 сар",
			"9 сар",
			"10 сар",
			"11 сар",
			"12 сар",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "HH:mm";
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
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
