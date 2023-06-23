import Types "../Types";
module BE {
	public let locale : Types.Locale = {
		id = "be";
		weekdays = [
			"нядзеля",
			"панядзелак",
			"аўторак",
			"серада",
			"чацвер",
			"пятніца",
			"субота",
		];
		weekdaysShort = [
			"нд",
			"пн",
			"ат",
			"ср",
			"чц",
			"пт",
			"сб",
		];
		weekdaysMin = [
			"нд",
			"пн",
			"ат",
			"ср",
			"чц",
			"пт",
			"сб",
		];
		months = [
			"студзень",
			"люты",
			"сакавік",
			"красавік",
			"травень",
			"чэрвень",
			"ліпень",
			"жнівень",
			"верасень",
			"кастрычнік",
			"лістапад",
			"снежань",
		];
		monthsShort = [
			"студ",
			"лют",
			"сак",
			"крас",
			"трав",
			"чэрв",
			"ліп",
			"жнів",
			"вер",
			"каст",
			"ліст",
			"снеж",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("ночы", "ночы");
				case ((1, _)) ("ночы", "ночы");
				case ((2, _)) ("ночы", "ночы");
				case ((3, _)) ("ночы", "ночы");
				case ((4, _)) ("раніцы", "раніцы");
				case ((5, _)) ("раніцы", "раніцы");
				case ((6, _)) ("раніцы", "раніцы");
				case ((7, _)) ("раніцы", "раніцы");
				case ((8, _)) ("раніцы", "раніцы");
				case ((9, _)) ("раніцы", "раніцы");
				case ((10, _)) ("раніцы", "раніцы");
				case ((11, _)) ("раніцы", "раніцы");
				case ((12, _)) ("дня", "дня");
				case ((13, _)) ("дня", "дня");
				case ((14, _)) ("дня", "дня");
				case ((15, _)) ("дня", "дня");
				case ((16, _)) ("дня", "дня");
				case ((17, _)) ("вечара", "вечара");
				case ((18, _)) ("вечара", "вечара");
				case ((19, _)) ("вечара", "вечара");
				case ((20, _)) ("вечара", "вечара");
				case ((21, _)) ("вечара", "вечара");
				case ((22, _)) ("вечара", "вечара");
				case ((23, _)) ("вечара", "вечара");
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
