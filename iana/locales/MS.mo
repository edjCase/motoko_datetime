import Types "../Types";
module MS {
	public let locale : Types.Locale = {
		id = "ms";
		weekdays = [
			"Ahad",
			"Isnin",
			"Selasa",
			"Rabu",
			"Khamis",
			"Jumaat",
			"Sabtu",
		];
		weekdaysShort = [
			"Ahd",
			"Isn",
			"Sel",
			"Rab",
			"Kha",
			"Jum",
			"Sab",
		];
		weekdaysMin = [
			"Ah",
			"Is",
			"Sl",
			"Rb",
			"Km",
			"Jm",
			"Sb",
		];
		months = [
			"Januari",
			"Februari",
			"Mac",
			"April",
			"Mei",
			"Jun",
			"Julai",
			"Ogos",
			"September",
			"Oktober",
			"November",
			"Disember",
		];
		monthsShort = [
			"Jan",
			"Feb",
			"Mac",
			"Apr",
			"Mei",
			"Jun",
			"Jul",
			"Ogs",
			"Sep",
			"Okt",
			"Nov",
			"Dis",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH.mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH.mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("pagi", "pagi");
				case ((1, _)) ("pagi", "pagi");
				case ((2, _)) ("pagi", "pagi");
				case ((3, _)) ("pagi", "pagi");
				case ((4, _)) ("pagi", "pagi");
				case ((5, _)) ("pagi", "pagi");
				case ((6, _)) ("pagi", "pagi");
				case ((7, _)) ("pagi", "pagi");
				case ((8, _)) ("pagi", "pagi");
				case ((9, _)) ("pagi", "pagi");
				case ((10, _)) ("pagi", "pagi");
				case ((11, _)) ("tengahari", "tengahari");
				case ((12, _)) ("tengahari", "tengahari");
				case ((13, _)) ("tengahari", "tengahari");
				case ((14, _)) ("tengahari", "tengahari");
				case ((15, _)) ("petang", "petang");
				case ((16, _)) ("petang", "petang");
				case ((17, _)) ("petang", "petang");
				case ((18, _)) ("petang", "petang");
				case ((19, _)) ("malam", "malam");
				case ((20, _)) ("malam", "malam");
				case ((21, _)) ("malam", "malam");
				case ((22, _)) ("malam", "malam");
				case ((23, _)) ("malam", "malam");
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
