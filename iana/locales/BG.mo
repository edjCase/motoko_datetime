import Types "../Types";
module BG {
	public let locale : Types.Locale = {
		id = "bg";
		weekdays = [
			"неделя",
			"понеделник",
			"вторник",
			"сряда",
			"четвъртък",
			"петък",
			"събота",
		];
		weekdaysShort = [
			"нед",
			"пон",
			"вто",
			"сря",
			"чет",
			"пет",
			"съб",
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
			"януари",
			"февруари",
			"март",
			"април",
			"май",
			"юни",
			"юли",
			"август",
			"септември",
			"октомври",
			"ноември",
			"декември",
		];
		monthsShort = [
			"яну",
			"фев",
			"мар",
			"апр",
			"май",
			"юни",
			"юли",
			"авг",
			"сеп",
			"окт",
			"ное",
			"дек",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "D.MM.YYYY";
		dateTimeFormat = "H:mm D.MM.YYYY";
		longDateFormat = "D.MM.YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("am", "AM");
				case ((1, _)) ("am", "AM");
				case ((2, _)) ("am", "AM");
				case ((3, _)) ("am", "AM");
				case ((4, _)) ("am", "AM");
				case ((5, _)) ("am", "AM");
				case ((6, _)) ("am", "AM");
				case ((7, _)) ("am", "AM");
				case ((8, _)) ("am", "AM");
				case ((9, _)) ("am", "AM");
				case ((10, _)) ("am", "AM");
				case ((11, _)) ("am", "AM");
				case ((12, _)) ("pm", "PM");
				case ((13, _)) ("pm", "PM");
				case ((14, _)) ("pm", "PM");
				case ((15, _)) ("pm", "PM");
				case ((16, _)) ("pm", "PM");
				case ((17, _)) ("pm", "PM");
				case ((18, _)) ("pm", "PM");
				case ((19, _)) ("pm", "PM");
				case ((20, _)) ("pm", "PM");
				case ((21, _)) ("pm", "PM");
				case ((22, _)) ("pm", "PM");
				case ((23, _)) ("pm", "PM");
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
