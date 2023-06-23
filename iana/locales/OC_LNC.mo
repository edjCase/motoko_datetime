import Types "../Types";
module OC_LNC {
	public let locale : Types.Locale = {
		id = "oc-lnc";
		weekdays = [
			"dimenge",
			"diluns",
			"dimars",
			"dimècres",
			"dijòus",
			"divendres",
			"dissabte",
		];
		weekdaysShort = [
			"dg.",
			"dl.",
			"dm.",
			"dc.",
			"dj.",
			"dv.",
			"ds.",
		];
		weekdaysMin = [
			"dg",
			"dl",
			"dm",
			"dc",
			"dj",
			"dv",
			"ds",
		];
		months = [
			"genièr",
			"febrièr",
			"març",
			"abril",
			"mai",
			"junh",
			"julhet",
			"agost",
			"setembre",
			"octòbre",
			"novembre",
			"decembre",
		];
		monthsShort = [
			"gen.",
			"febr.",
			"març",
			"abr.",
			"mai",
			"junh",
			"julh.",
			"ago.",
			"set.",
			"oct.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "H:mm DD/MM/YYYY";
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
