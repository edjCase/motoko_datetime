import Types "../Types";
module SQ {
	public let locale : Types.Locale = {
		id = "sq";
		weekdays = [
			"E Diel",
			"E Hënë",
			"E Martë",
			"E Mërkurë",
			"E Enjte",
			"E Premte",
			"E Shtunë",
		];
		weekdaysShort = [
			"Die",
			"Hën",
			"Mar",
			"Mër",
			"Enj",
			"Pre",
			"Sht",
		];
		weekdaysMin = [
			"D",
			"H",
			"Ma",
			"Më",
			"E",
			"P",
			"Sh",
		];
		months = [
			"Janar",
			"Shkurt",
			"Mars",
			"Prill",
			"Maj",
			"Qershor",
			"Korrik",
			"Gusht",
			"Shtator",
			"Tetor",
			"Nëntor",
			"Dhjetor",
		];
		monthsShort = [
			"Jan",
			"Shk",
			"Mar",
			"Pri",
			"Maj",
			"Qer",
			"Kor",
			"Gus",
			"Sht",
			"Tet",
			"Nën",
			"Dhj",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("PD", "PD");
				case ((1, _)) ("PD", "PD");
				case ((2, _)) ("PD", "PD");
				case ((3, _)) ("PD", "PD");
				case ((4, _)) ("PD", "PD");
				case ((5, _)) ("PD", "PD");
				case ((6, _)) ("PD", "PD");
				case ((7, _)) ("PD", "PD");
				case ((8, _)) ("PD", "PD");
				case ((9, _)) ("PD", "PD");
				case ((10, _)) ("PD", "PD");
				case ((11, _)) ("PD", "PD");
				case ((12, _)) ("MD", "MD");
				case ((13, _)) ("MD", "MD");
				case ((14, _)) ("MD", "MD");
				case ((15, _)) ("MD", "MD");
				case ((16, _)) ("MD", "MD");
				case ((17, _)) ("MD", "MD");
				case ((18, _)) ("MD", "MD");
				case ((19, _)) ("MD", "MD");
				case ((20, _)) ("MD", "MD");
				case ((21, _)) ("MD", "MD");
				case ((22, _)) ("MD", "MD");
				case ((23, _)) ("MD", "MD");
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
