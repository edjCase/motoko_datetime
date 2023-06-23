import Types "../Types";
module X_PSEUDO {
	public let locale : Types.Locale = {
		id = "x-pseudo";
		weekdays = [
			"S~úñdá~ý",
			"Mó~ñdáý~",
			"Túé~sdáý~",
			"Wéd~ñésd~áý",
			"T~húrs~dáý",
			"~Fríd~áý",
			"S~átúr~dáý",
		];
		weekdaysShort = [
			"S~úñ",
			"~Móñ",
			"~Túé",
			"~Wéd",
			"~Thú",
			"~Frí",
			"~Sát",
		];
		weekdaysMin = [
			"S~ú",
			"Mó~",
			"Tú",
			"~Wé",
			"T~h",
			"Fr~",
			"Sá",
		];
		months = [
			"J~áñúá~rý",
			"F~ébrú~árý",
			"~Márc~h",
			"Áp~ríl",
			"~Máý",
			"~Júñé~",
			"Júl~ý",
			"Áú~gúst~",
			"Sép~témb~ér",
			"Ó~ctób~ér",
			"Ñ~óvém~bér",
			"~Décé~mbér",
		];
		monthsShort = [
			"J~áñ",
			"~Féb",
			"~Már",
			"~Ápr",
			"~Máý",
			"~Júñ",
			"~Júl",
			"~Áúg",
			"~Sép",
			"~Óct",
			"~Ñóv",
			"~Déc",
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
