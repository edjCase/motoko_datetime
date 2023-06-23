import Types "../Types";
module AR_LY {
	public let locale : Types.Locale = {
		id = "ar-ly";
		weekdays = [
			"الأحد",
			"الإثنين",
			"الثلاثاء",
			"الأربعاء",
			"الخميس",
			"الجمعة",
			"السبت",
		];
		weekdaysShort = [
			"أحد",
			"إثنين",
			"ثلاثاء",
			"أربعاء",
			"خميس",
			"جمعة",
			"سبت",
		];
		weekdaysMin = [
			"ح",
			"ن",
			"ث",
			"ر",
			"خ",
			"ج",
			"س",
		];
		months = [
			"يناير",
			"فبراير",
			"مارس",
			"أبريل",
			"مايو",
			"يونيو",
			"يوليو",
			"أغسطس",
			"سبتمبر",
			"أكتوبر",
			"نوفمبر",
			"ديسمبر",
		];
		monthsShort = [
			"يناير",
			"فبراير",
			"مارس",
			"أبريل",
			"مايو",
			"يونيو",
			"يوليو",
			"أغسطس",
			"سبتمبر",
			"أكتوبر",
			"نوفمبر",
			"ديسمبر",
		];
		firstDayOfWeek = 6;
		firstDayOfYear = 12;
		timeFormat = "HH:mm";
		dateFormat = "D/‏M/‏YYYY";
		dateTimeFormat = "HH:mm D/‏M/‏YYYY";
		longDateFormat = "D/‏M/‏YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("ص", "ص");
				case ((1, _)) ("ص", "ص");
				case ((2, _)) ("ص", "ص");
				case ((3, _)) ("ص", "ص");
				case ((4, _)) ("ص", "ص");
				case ((5, _)) ("ص", "ص");
				case ((6, _)) ("ص", "ص");
				case ((7, _)) ("ص", "ص");
				case ((8, _)) ("ص", "ص");
				case ((9, _)) ("ص", "ص");
				case ((10, _)) ("ص", "ص");
				case ((11, _)) ("ص", "ص");
				case ((12, _)) ("م", "م");
				case ((13, _)) ("م", "م");
				case ((14, _)) ("م", "م");
				case ((15, _)) ("م", "م");
				case ((16, _)) ("م", "م");
				case ((17, _)) ("م", "م");
				case ((18, _)) ("م", "م");
				case ((19, _)) ("م", "م");
				case ((20, _)) ("م", "م");
				case ((21, _)) ("م", "م");
				case ((22, _)) ("م", "م");
				case ((23, _)) ("م", "م");
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
