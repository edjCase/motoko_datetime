import Types "../Types";
module BM {
	public let locale : Types.Locale = {
		id = "bm";
		weekdays = [
			"Kari",
			"Ntɛnɛn",
			"Tarata",
			"Araba",
			"Alamisa",
			"Juma",
			"Sibiri",
		];
		weekdaysShort = [
			"Kar",
			"Ntɛ",
			"Tar",
			"Ara",
			"Ala",
			"Jum",
			"Sib",
		];
		weekdaysMin = [
			"Ka",
			"Nt",
			"Ta",
			"Ar",
			"Al",
			"Ju",
			"Si",
		];
		months = [
			"Zanwuyekalo",
			"Fewuruyekalo",
			"Marisikalo",
			"Awirilikalo",
			"Mɛkalo",
			"Zuwɛnkalo",
			"Zuluyekalo",
			"Utikalo",
			"Sɛtanburukalo",
			"ɔkutɔburukalo",
			"Nowanburukalo",
			"Desanburukalo",
		];
		monthsShort = [
			"Zan",
			"Few",
			"Mar",
			"Awi",
			"Mɛ",
			"Zuw",
			"Zul",
			"Uti",
			"Sɛt",
			"ɔku",
			"Now",
			"Des",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
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
