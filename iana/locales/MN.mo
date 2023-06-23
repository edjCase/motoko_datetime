import Types "../Types";
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
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "HH:mm";
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("ҮӨ", "ҮӨ");
				case ((1, _)) ("ҮӨ", "ҮӨ");
				case ((2, _)) ("ҮӨ", "ҮӨ");
				case ((3, _)) ("ҮӨ", "ҮӨ");
				case ((4, _)) ("ҮӨ", "ҮӨ");
				case ((5, _)) ("ҮӨ", "ҮӨ");
				case ((6, _)) ("ҮӨ", "ҮӨ");
				case ((7, _)) ("ҮӨ", "ҮӨ");
				case ((8, _)) ("ҮӨ", "ҮӨ");
				case ((9, _)) ("ҮӨ", "ҮӨ");
				case ((10, _)) ("ҮӨ", "ҮӨ");
				case ((11, _)) ("ҮӨ", "ҮӨ");
				case ((12, _)) ("ҮХ", "ҮХ");
				case ((13, _)) ("ҮХ", "ҮХ");
				case ((14, _)) ("ҮХ", "ҮХ");
				case ((15, _)) ("ҮХ", "ҮХ");
				case ((16, _)) ("ҮХ", "ҮХ");
				case ((17, _)) ("ҮХ", "ҮХ");
				case ((18, _)) ("ҮХ", "ҮХ");
				case ((19, _)) ("ҮХ", "ҮХ");
				case ((20, _)) ("ҮХ", "ҮХ");
				case ((21, _)) ("ҮХ", "ҮХ");
				case ((22, _)) ("ҮХ", "ҮХ");
				case ((23, _)) ("ҮХ", "ҮХ");
			};
			if (isLower) lower else upper;
		};
		eras = [
			{
				start = -62135568422000000;
				end = null;
				offset = 1;
				fullName = "Anno Domini";
				narrowName = "AD";
				abbreviatedName = "AD";
			},
			{
				start = null;
				end = -62135654822000000;
				offset = 1;
				fullName = "Before Christ";
				narrowName = "BC";
				abbreviatedName = "BC";
			},
		];
	};
};
