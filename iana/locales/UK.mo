import Types "../Types";
module UK {
	public let locale : Types.Locale = {
		id = "uk";
		weekdays = [
			"неділя",
			"понеділок",
			"вівторок",
			"середа",
			"четвер",
			"п’ятниця",
			"субота",
		];
		weekdaysShort = [
			"нд",
			"пн",
			"вт",
			"ср",
			"чт",
			"пт",
			"сб",
		];
		weekdaysMin = [
			"нд",
			"пн",
			"вт",
			"ср",
			"чт",
			"пт",
			"сб",
		];
		months = [
			"січень",
			"лютий",
			"березень",
			"квітень",
			"травень",
			"червень",
			"липень",
			"серпень",
			"вересень",
			"жовтень",
			"листопад",
			"грудень",
		];
		monthsShort = [
			"січ",
			"лют",
			"бер",
			"квіт",
			"трав",
			"черв",
			"лип",
			"серп",
			"вер",
			"жовт",
			"лист",
			"груд",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("ночі", "ночі");
				case ((1, _)) ("ночі", "ночі");
				case ((2, _)) ("ночі", "ночі");
				case ((3, _)) ("ночі", "ночі");
				case ((4, _)) ("ранку", "ранку");
				case ((5, _)) ("ранку", "ранку");
				case ((6, _)) ("ранку", "ранку");
				case ((7, _)) ("ранку", "ранку");
				case ((8, _)) ("ранку", "ранку");
				case ((9, _)) ("ранку", "ранку");
				case ((10, _)) ("ранку", "ранку");
				case ((11, _)) ("ранку", "ранку");
				case ((12, _)) ("дня", "дня");
				case ((13, _)) ("дня", "дня");
				case ((14, _)) ("дня", "дня");
				case ((15, _)) ("дня", "дня");
				case ((16, _)) ("дня", "дня");
				case ((17, _)) ("вечора", "вечора");
				case ((18, _)) ("вечора", "вечора");
				case ((19, _)) ("вечора", "вечора");
				case ((20, _)) ("вечора", "вечора");
				case ((21, _)) ("вечора", "вечора");
				case ((22, _)) ("вечора", "вечора");
				case ((23, _)) ("вечора", "вечора");
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
