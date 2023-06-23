import Types "../Types";
module BR {
	public let locale : Types.Locale = {
		id = "br";
		weekdays = [
			"Sul",
			"Lun",
			"Meurzh",
			"Mercʼher",
			"Yaou",
			"Gwener",
			"Sadorn",
		];
		weekdaysShort = [
			"Sul",
			"Lun",
			"Meu",
			"Mer",
			"Yao",
			"Gwe",
			"Sad",
		];
		weekdaysMin = [
			"Su",
			"Lu",
			"Me",
			"Mer",
			"Ya",
			"Gw",
			"Sa",
		];
		months = [
			"Genver",
			"Cʼhwevrer",
			"Meurzh",
			"Ebrel",
			"Mae",
			"Mezheven",
			"Gouere",
			"Eost",
			"Gwengolo",
			"Here",
			"Du",
			"Kerzu",
		];
		monthsShort = [
			"Gen",
			"Cʼhwe",
			"Meu",
			"Ebr",
			"Mae",
			"Eve",
			"Gou",
			"Eos",
			"Gwe",
			"Her",
			"Du",
			"Ker",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("a.m.", "a.m.");
				case ((1, _)) ("a.m.", "a.m.");
				case ((2, _)) ("a.m.", "a.m.");
				case ((3, _)) ("a.m.", "a.m.");
				case ((4, _)) ("a.m.", "a.m.");
				case ((5, _)) ("a.m.", "a.m.");
				case ((6, _)) ("a.m.", "a.m.");
				case ((7, _)) ("a.m.", "a.m.");
				case ((8, _)) ("a.m.", "a.m.");
				case ((9, _)) ("a.m.", "a.m.");
				case ((10, _)) ("a.m.", "a.m.");
				case ((11, _)) ("a.m.", "a.m.");
				case ((12, _)) ("g.m.", "g.m.");
				case ((13, _)) ("g.m.", "g.m.");
				case ((14, _)) ("g.m.", "g.m.");
				case ((15, _)) ("g.m.", "g.m.");
				case ((16, _)) ("g.m.", "g.m.");
				case ((17, _)) ("g.m.", "g.m.");
				case ((18, _)) ("g.m.", "g.m.");
				case ((19, _)) ("g.m.", "g.m.");
				case ((20, _)) ("g.m.", "g.m.");
				case ((21, _)) ("g.m.", "g.m.");
				case ((22, _)) ("g.m.", "g.m.");
				case ((23, _)) ("g.m.", "g.m.");
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
