import Types "../Types";
module TG {
	public let locale : Types.Locale = {
		id = "tg";
		weekdays = [
			"якшанбе",
			"душанбе",
			"сешанбе",
			"чоршанбе",
			"панҷшанбе",
			"ҷумъа",
			"шанбе",
		];
		weekdaysShort = [
			"яшб",
			"дшб",
			"сшб",
			"чшб",
			"пшб",
			"ҷум",
			"шнб",
		];
		weekdaysMin = [
			"яш",
			"дш",
			"сш",
			"чш",
			"пш",
			"ҷм",
			"шб",
		];
		months = [
			"январ",
			"феврал",
			"март",
			"апрел",
			"май",
			"июн",
			"июл",
			"август",
			"сентябр",
			"октябр",
			"ноябр",
			"декабр",
		];
		monthsShort = [
			"янв",
			"фев",
			"мар",
			"апр",
			"май",
			"июн",
			"июл",
			"авг",
			"сен",
			"окт",
			"ноя",
			"дек",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("шаб", "шаб");
				case ((1, _)) ("шаб", "шаб");
				case ((2, _)) ("шаб", "шаб");
				case ((3, _)) ("шаб", "шаб");
				case ((4, _)) ("субҳ", "субҳ");
				case ((5, _)) ("субҳ", "субҳ");
				case ((6, _)) ("субҳ", "субҳ");
				case ((7, _)) ("субҳ", "субҳ");
				case ((8, _)) ("субҳ", "субҳ");
				case ((9, _)) ("субҳ", "субҳ");
				case ((10, _)) ("субҳ", "субҳ");
				case ((11, _)) ("рӯз", "рӯз");
				case ((12, _)) ("рӯз", "рӯз");
				case ((13, _)) ("рӯз", "рӯз");
				case ((14, _)) ("рӯз", "рӯз");
				case ((15, _)) ("рӯз", "рӯз");
				case ((16, _)) ("бегоҳ", "бегоҳ");
				case ((17, _)) ("бегоҳ", "бегоҳ");
				case ((18, _)) ("бегоҳ", "бегоҳ");
				case ((19, _)) ("шаб", "шаб");
				case ((20, _)) ("шаб", "шаб");
				case ((21, _)) ("шаб", "шаб");
				case ((22, _)) ("шаб", "шаб");
				case ((23, _)) ("шаб", "шаб");
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
