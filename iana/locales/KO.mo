import Types "../Types";
module KO {
	public let locale : Types.Locale = {
		id = "ko";
		weekdays = [
			"일요일",
			"월요일",
			"화요일",
			"수요일",
			"목요일",
			"금요일",
			"토요일",
		];
		weekdaysShort = [
			"일",
			"월",
			"화",
			"수",
			"목",
			"금",
			"토",
		];
		weekdaysMin = [
			"일",
			"월",
			"화",
			"수",
			"목",
			"금",
			"토",
		];
		months = [
			"1월",
			"2월",
			"3월",
			"4월",
			"5월",
			"6월",
			"7월",
			"8월",
			"9월",
			"10월",
			"11월",
			"12월",
		];
		monthsShort = [
			"1월",
			"2월",
			"3월",
			"4월",
			"5월",
			"6월",
			"7월",
			"8월",
			"9월",
			"10월",
			"11월",
			"12월",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "A h:mm";
		dateFormat = "YYYY.MM.DD.";
		dateTimeFormat = "A h:mm YYYY.MM.DD.";
		longDateFormat = "YYYY.MM.DD.";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("오전", "오전");
				case ((1, _)) ("오전", "오전");
				case ((2, _)) ("오전", "오전");
				case ((3, _)) ("오전", "오전");
				case ((4, _)) ("오전", "오전");
				case ((5, _)) ("오전", "오전");
				case ((6, _)) ("오전", "오전");
				case ((7, _)) ("오전", "오전");
				case ((8, _)) ("오전", "오전");
				case ((9, _)) ("오전", "오전");
				case ((10, _)) ("오전", "오전");
				case ((11, _)) ("오전", "오전");
				case ((12, _)) ("오후", "오후");
				case ((13, _)) ("오후", "오후");
				case ((14, _)) ("오후", "오후");
				case ((15, _)) ("오후", "오후");
				case ((16, _)) ("오후", "오후");
				case ((17, _)) ("오후", "오후");
				case ((18, _)) ("오후", "오후");
				case ((19, _)) ("오후", "오후");
				case ((20, _)) ("오후", "오후");
				case ((21, _)) ("오후", "오후");
				case ((22, _)) ("오후", "오후");
				case ((23, _)) ("오후", "오후");
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
