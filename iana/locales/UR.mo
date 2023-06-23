import Types "../Types";
module UR {
	public let locale : Types.Locale = {
		id = "ur";
		weekdays = [
			"اتوار",
			"پیر",
			"منگل",
			"بدھ",
			"جمعرات",
			"جمعہ",
			"ہفتہ",
		];
		weekdaysShort = [
			"اتوار",
			"پیر",
			"منگل",
			"بدھ",
			"جمعرات",
			"جمعہ",
			"ہفتہ",
		];
		weekdaysMin = [
			"اتوار",
			"پیر",
			"منگل",
			"بدھ",
			"جمعرات",
			"جمعہ",
			"ہفتہ",
		];
		months = [
			"جنوری",
			"فروری",
			"مارچ",
			"اپریل",
			"مئی",
			"جون",
			"جولائی",
			"اگست",
			"ستمبر",
			"اکتوبر",
			"نومبر",
			"دسمبر",
		];
		monthsShort = [
			"جنوری",
			"فروری",
			"مارچ",
			"اپریل",
			"مئی",
			"جون",
			"جولائی",
			"اگست",
			"ستمبر",
			"اکتوبر",
			"نومبر",
			"دسمبر",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("صبح", "صبح");
				case ((1, _)) ("صبح", "صبح");
				case ((2, _)) ("صبح", "صبح");
				case ((3, _)) ("صبح", "صبح");
				case ((4, _)) ("صبح", "صبح");
				case ((5, _)) ("صبح", "صبح");
				case ((6, _)) ("صبح", "صبح");
				case ((7, _)) ("صبح", "صبح");
				case ((8, _)) ("صبح", "صبح");
				case ((9, _)) ("صبح", "صبح");
				case ((10, _)) ("صبح", "صبح");
				case ((11, _)) ("صبح", "صبح");
				case ((12, _)) ("شام", "شام");
				case ((13, _)) ("شام", "شام");
				case ((14, _)) ("شام", "شام");
				case ((15, _)) ("شام", "شام");
				case ((16, _)) ("شام", "شام");
				case ((17, _)) ("شام", "شام");
				case ((18, _)) ("شام", "شام");
				case ((19, _)) ("شام", "شام");
				case ((20, _)) ("شام", "شام");
				case ((21, _)) ("شام", "شام");
				case ((22, _)) ("شام", "شام");
				case ((23, _)) ("شام", "شام");
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
