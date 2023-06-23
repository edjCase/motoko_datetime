import Types "../Types";
module AF {
	public let locale : Types.Locale = {
		id = "af";
		weekdays = [
			"Sondag",
			"Maandag",
			"Dinsdag",
			"Woensdag",
			"Donderdag",
			"Vrydag",
			"Saterdag",
		];
		weekdaysShort = [
			"Son",
			"Maa",
			"Din",
			"Woe",
			"Don",
			"Vry",
			"Sat",
		];
		weekdaysMin = [
			"So",
			"Ma",
			"Di",
			"Wo",
			"Do",
			"Vr",
			"Sa",
		];
		months = [
			"Januarie",
			"Februarie",
			"Maart",
			"April",
			"Mei",
			"Junie",
			"Julie",
			"Augustus",
			"September",
			"Oktober",
			"November",
			"Desember",
		];
		monthsShort = [
			"Jan",
			"Feb",
			"Mrt",
			"Apr",
			"Mei",
			"Jun",
			"Jul",
			"Aug",
			"Sep",
			"Okt",
			"Nov",
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
				case ((0, _)) ("vm", "VM");
				case ((1, _)) ("vm", "VM");
				case ((2, _)) ("vm", "VM");
				case ((3, _)) ("vm", "VM");
				case ((4, _)) ("vm", "VM");
				case ((5, _)) ("vm", "VM");
				case ((6, _)) ("vm", "VM");
				case ((7, _)) ("vm", "VM");
				case ((8, _)) ("vm", "VM");
				case ((9, _)) ("vm", "VM");
				case ((10, _)) ("vm", "VM");
				case ((11, _)) ("vm", "VM");
				case ((12, _)) ("nm", "NM");
				case ((13, _)) ("nm", "NM");
				case ((14, _)) ("nm", "NM");
				case ((15, _)) ("nm", "NM");
				case ((16, _)) ("nm", "NM");
				case ((17, _)) ("nm", "NM");
				case ((18, _)) ("nm", "NM");
				case ((19, _)) ("nm", "NM");
				case ((20, _)) ("nm", "NM");
				case ((21, _)) ("nm", "NM");
				case ((22, _)) ("nm", "NM");
				case ((23, _)) ("nm", "NM");
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
