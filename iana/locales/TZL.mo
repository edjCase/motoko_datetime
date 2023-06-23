import Types "../Types";
module TZL {
	public let locale : Types.Locale = {
		id = "tzl";
		weekdays = [
			"Súladi",
			"Lúneçi",
			"Maitzi",
			"Márcuri",
			"Xhúadi",
			"Viénerçi",
			"Sáturi",
		];
		weekdaysShort = [
			"Súl",
			"Lún",
			"Mai",
			"Már",
			"Xhú",
			"Vié",
			"Sát",
		];
		weekdaysMin = [
			"Sú",
			"Lú",
			"Ma",
			"Má",
			"Xh",
			"Vi",
			"Sá",
		];
		months = [
			"Januar",
			"Fevraglh",
			"Març",
			"Avrïu",
			"Mai",
			"Gün",
			"Julia",
			"Guscht",
			"Setemvar",
			"Listopäts",
			"Noemvar",
			"Zecemvar",
		];
		monthsShort = [
			"Jan",
			"Fev",
			"Mar",
			"Avr",
			"Mai",
			"Gün",
			"Jul",
			"Gus",
			"Set",
			"Lis",
			"Noe",
			"Zec",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH.mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH.mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("d'a", "D'A");
				case ((1, _)) ("d'a", "D'A");
				case ((2, _)) ("d'a", "D'A");
				case ((3, _)) ("d'a", "D'A");
				case ((4, _)) ("d'a", "D'A");
				case ((5, _)) ("d'a", "D'A");
				case ((6, _)) ("d'a", "D'A");
				case ((7, _)) ("d'a", "D'A");
				case ((8, _)) ("d'a", "D'A");
				case ((9, _)) ("d'a", "D'A");
				case ((10, _)) ("d'a", "D'A");
				case ((11, _)) ("d'a", "D'A");
				case ((12, _)) ("d'o", "D'O");
				case ((13, _)) ("d'o", "D'O");
				case ((14, _)) ("d'o", "D'O");
				case ((15, _)) ("d'o", "D'O");
				case ((16, _)) ("d'o", "D'O");
				case ((17, _)) ("d'o", "D'O");
				case ((18, _)) ("d'o", "D'O");
				case ((19, _)) ("d'o", "D'O");
				case ((20, _)) ("d'o", "D'O");
				case ((21, _)) ("d'o", "D'O");
				case ((22, _)) ("d'o", "D'O");
				case ((23, _)) ("d'o", "D'O");
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
