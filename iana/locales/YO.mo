import Types "../Types";
module YO {
	public let locale : Types.Locale = {
		id = "yo";
		weekdays = [
			"Àìkú",
			"Ajé",
			"Ìsẹ́gun",
			"Ọjọ́rú",
			"Ọjọ́bọ",
			"Ẹtì",
			"Àbámẹ́ta",
		];
		weekdaysShort = [
			"Àìk",
			"Ajé",
			"Ìsẹ́",
			"Ọjr",
			"Ọjb",
			"Ẹtì",
			"Àbá",
		];
		weekdaysMin = [
			"Àì",
			"Aj",
			"Ìs",
			"Ọr",
			"Ọb",
			"Ẹt",
			"Àb",
		];
		months = [
			"Sẹ́rẹ́",
			"Èrèlè",
			"Ẹrẹ̀nà",
			"Ìgbé",
			"Èbibi",
			"Òkùdu",
			"Agẹmo",
			"Ògún",
			"Owewe",
			"Ọ̀wàrà",
			"Bélú",
			"Ọ̀pẹ̀̀",
		];
		monthsShort = [
			"Sẹ́r",
			"Èrl",
			"Ẹrn",
			"Ìgb",
			"Èbi",
			"Òkù",
			"Agẹ",
			"Ògú",
			"Owe",
			"Ọ̀wà",
			"Bél",
			"Ọ̀pẹ̀̀",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "h:mm A";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "h:mm A DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
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
