import Types "../Types";
module JA {
	public let locale : Types.Locale = {
		id = "ja";
		weekdays = [
			"日曜日",
			"月曜日",
			"火曜日",
			"水曜日",
			"木曜日",
			"金曜日",
			"土曜日",
		];
		weekdaysShort = [
			"日",
			"月",
			"火",
			"水",
			"木",
			"金",
			"土",
		];
		weekdaysMin = [
			"日",
			"月",
			"火",
			"水",
			"木",
			"金",
			"土",
		];
		months = [
			"1月",
			"2月",
			"3月",
			"4月",
			"5月",
			"6月",
			"7月",
			"8月",
			"9月",
			"10月",
			"11月",
			"12月",
		];
		monthsShort = [
			"1月",
			"2月",
			"3月",
			"4月",
			"5月",
			"6月",
			"7月",
			"8月",
			"9月",
			"10月",
			"11月",
			"12月",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "HH:mm";
		dateFormat = "YYYY/MM/DD";
		dateTimeFormat = "HH:mm YYYY/MM/DD";
		longDateFormat = "YYYY/MM/DD";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("午前", "午前");
				case ((1, _)) ("午前", "午前");
				case ((2, _)) ("午前", "午前");
				case ((3, _)) ("午前", "午前");
				case ((4, _)) ("午前", "午前");
				case ((5, _)) ("午前", "午前");
				case ((6, _)) ("午前", "午前");
				case ((7, _)) ("午前", "午前");
				case ((8, _)) ("午前", "午前");
				case ((9, _)) ("午前", "午前");
				case ((10, _)) ("午前", "午前");
				case ((11, _)) ("午前", "午前");
				case ((12, _)) ("午後", "午後");
				case ((13, _)) ("午後", "午後");
				case ((14, _)) ("午後", "午後");
				case ((15, _)) ("午後", "午後");
				case ((16, _)) ("午後", "午後");
				case ((17, _)) ("午後", "午後");
				case ((18, _)) ("午後", "午後");
				case ((19, _)) ("午後", "午後");
				case ((20, _)) ("午後", "午後");
				case ((21, _)) ("午後", "午後");
				case ((22, _)) ("午後", "午後");
				case ((23, _)) ("午後", "午後");
			};
			if (isLower) lower else upper;
		};
		eras = [
			{
				start = 1556694000000000;
				end = null;
				offset = 1;
				fullName = "令和";
				narrowName = "㋿";
				abbreviatedName = "R";
			},
			{
				start = 600249600000000;
				end = 1556607600000000;
				offset = 1;
				fullName = "平成";
				narrowName = "㍻";
				abbreviatedName = "H";
			},
			{
				start = -1357574400000000;
				end = 600163200000000;
				offset = 1;
				fullName = "昭和";
				narrowName = "㍼";
				abbreviatedName = "S";
			},
			{
				start = -1812124800000000;
				end = -1357660800000000;
				offset = 1;
				fullName = "大正";
				narrowName = "㍽";
				abbreviatedName = "T";
			},
			{
				start = -3060950822000000;
				end = -1812211200000000;
				offset = 6;
				fullName = "明治";
				narrowName = "㍾";
				abbreviatedName = "M";
			},
			{
				start = -62135568422000000;
				end = -3029501222000000;
				offset = 1;
				fullName = "西暦";
				narrowName = "AD";
				abbreviatedName = "AD";
			},
			{
				start = null;
				end = -62135654822000000;
				offset = 1;
				fullName = "紀元前";
				narrowName = "BC";
				abbreviatedName = "BC";
			},
		];
	};
};
