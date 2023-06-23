import Types "../Types";
module DV {
	public let locale : Types.Locale = {
		id = "dv";
		weekdays = [
			"އާދިއްތަ",
			"ހޯމަ",
			"އަންގާރަ",
			"ބުދަ",
			"ބުރާސްފަތި",
			"ހުކުރު",
			"ހޮނިހިރު",
		];
		weekdaysShort = [
			"އާދިއްތަ",
			"ހޯމަ",
			"އަންގާރަ",
			"ބުދަ",
			"ބުރާސްފަތި",
			"ހުކުރު",
			"ހޮނިހިރު",
		];
		weekdaysMin = [
			"އާދި",
			"ހޯމަ",
			"އަން",
			"ބުދަ",
			"ބުރާ",
			"ހުކު",
			"ހޮނި",
		];
		months = [
			"ޖެނުއަރީ",
			"ފެބްރުއަރީ",
			"މާރިޗު",
			"އޭޕްރީލު",
			"މޭ",
			"ޖޫން",
			"ޖުލައި",
			"އޯގަސްޓު",
			"ސެޕްޓެމްބަރު",
			"އޮކްޓޯބަރު",
			"ނޮވެމްބަރު",
			"ޑިސެމްބަރު",
		];
		monthsShort = [
			"ޖެނުއަރީ",
			"ފެބްރުއަރީ",
			"މާރިޗު",
			"އޭޕްރީލު",
			"މޭ",
			"ޖޫން",
			"ޖުލައި",
			"އޯގަސްޓު",
			"ސެޕްޓެމްބަރު",
			"އޮކްޓޯބަރު",
			"ނޮވެމްބަރު",
			"ޑިސެމްބަރު",
		];
		firstDayOfWeek = 7;
		firstDayOfYear = 12;
		timeFormat = "HH:mm";
		dateFormat = "D/M/YYYY";
		dateTimeFormat = "HH:mm D/M/YYYY";
		longDateFormat = "D/M/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("މކ", "މކ");
				case ((1, _)) ("މކ", "މކ");
				case ((2, _)) ("މކ", "މކ");
				case ((3, _)) ("މކ", "މކ");
				case ((4, _)) ("މކ", "މކ");
				case ((5, _)) ("މކ", "މކ");
				case ((6, _)) ("މކ", "މކ");
				case ((7, _)) ("މކ", "މކ");
				case ((8, _)) ("މކ", "މކ");
				case ((9, _)) ("މކ", "މކ");
				case ((10, _)) ("މކ", "މކ");
				case ((11, _)) ("މކ", "މކ");
				case ((12, _)) ("މފ", "މފ");
				case ((13, _)) ("މފ", "މފ");
				case ((14, _)) ("މފ", "މފ");
				case ((15, _)) ("މފ", "މފ");
				case ((16, _)) ("މފ", "މފ");
				case ((17, _)) ("މފ", "މފ");
				case ((18, _)) ("މފ", "މފ");
				case ((19, _)) ("މފ", "މފ");
				case ((20, _)) ("މފ", "މފ");
				case ((21, _)) ("މފ", "މފ");
				case ((22, _)) ("މފ", "މފ");
				case ((23, _)) ("މފ", "މފ");
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
