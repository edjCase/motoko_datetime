import Types "../Types";
module RU {
	public let locale : Types.Locale = {
		id = "ru";
		weekdays = [
			"воскресенье",
			"понедельник",
			"вторник",
			"среда",
			"четверг",
			"пятница",
			"суббота",
		];
		weekdaysShort = [
			"вс",
			"пн",
			"вт",
			"ср",
			"чт",
			"пт",
			"сб",
		];
		weekdaysMin = [
			"вс",
			"пн",
			"вт",
			"ср",
			"чт",
			"пт",
			"сб",
		];
		months = [
			"январь",
			"февраль",
			"март",
			"апрель",
			"май",
			"июнь",
			"июль",
			"август",
			"сентябрь",
			"октябрь",
			"ноябрь",
			"декабрь",
		];
		monthsShort = [
			"янв.",
			"февр.",
			"март",
			"апр.",
			"май",
			"июнь",
			"июль",
			"авг.",
			"сент.",
			"окт.",
			"нояб.",
			"дек.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("ночи", "ночи");
				case ((1, _)) ("ночи", "ночи");
				case ((2, _)) ("ночи", "ночи");
				case ((3, _)) ("ночи", "ночи");
				case ((4, _)) ("утра", "утра");
				case ((5, _)) ("утра", "утра");
				case ((6, _)) ("утра", "утра");
				case ((7, _)) ("утра", "утра");
				case ((8, _)) ("утра", "утра");
				case ((9, _)) ("утра", "утра");
				case ((10, _)) ("утра", "утра");
				case ((11, _)) ("утра", "утра");
				case ((12, _)) ("дня", "дня");
				case ((13, _)) ("дня", "дня");
				case ((14, _)) ("дня", "дня");
				case ((15, _)) ("дня", "дня");
				case ((16, _)) ("дня", "дня");
				case ((17, _)) ("вечера", "вечера");
				case ((18, _)) ("вечера", "вечера");
				case ((19, _)) ("вечера", "вечера");
				case ((20, _)) ("вечера", "вечера");
				case ((21, _)) ("вечера", "вечера");
				case ((22, _)) ("вечера", "вечера");
				case ((23, _)) ("вечера", "вечера");
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
