import Types "../Types";
module GOM_LATN {
	public let locale : Types.Locale = {
		id = "gom-latn";
		weekdays = [
			"Aitar",
			"Somar",
			"Mongllar",
			"Budhvar",
			"Birestar",
			"Sukrar",
			"Son'var",
		];
		weekdaysShort = [
			"Ait.",
			"Som.",
			"Mon.",
			"Bud.",
			"Bre.",
			"Suk.",
			"Son.",
		];
		weekdaysMin = [
			"Ai",
			"Sm",
			"Mo",
			"Bu",
			"Br",
			"Su",
			"Sn",
		];
		months = [
			"Janer",
			"Febrer",
			"Mars",
			"Abril",
			"Mai",
			"Jun",
			"Julai",
			"Agost",
			"Setembr",
			"Otubr",
			"Novembr",
			"Dezembr",
		];
		monthsShort = [
			"Jan.",
			"Feb.",
			"Mars",
			"Abr.",
			"Mai",
			"Jun",
			"Jul.",
			"Ago.",
			"Set.",
			"Otu.",
			"Nov.",
			"Dez.",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 3;
		timeFormat = "A h:mm [vazta]";
		dateFormat = "DD-MM-YYYY";
		dateTimeFormat = "A h:mm [vazta] DD-MM-YYYY";
		longDateFormat = "DD-MM-YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("rati", "rati");
				case ((1, _)) ("rati", "rati");
				case ((2, _)) ("rati", "rati");
				case ((3, _)) ("rati", "rati");
				case ((4, _)) ("sokallim", "sokallim");
				case ((5, _)) ("sokallim", "sokallim");
				case ((6, _)) ("sokallim", "sokallim");
				case ((7, _)) ("sokallim", "sokallim");
				case ((8, _)) ("sokallim", "sokallim");
				case ((9, _)) ("sokallim", "sokallim");
				case ((10, _)) ("sokallim", "sokallim");
				case ((11, _)) ("sokallim", "sokallim");
				case ((12, _)) ("donparam", "donparam");
				case ((13, _)) ("donparam", "donparam");
				case ((14, _)) ("donparam", "donparam");
				case ((15, _)) ("donparam", "donparam");
				case ((16, _)) ("sanje", "sanje");
				case ((17, _)) ("sanje", "sanje");
				case ((18, _)) ("sanje", "sanje");
				case ((19, _)) ("sanje", "sanje");
				case ((20, _)) ("rati", "rati");
				case ((21, _)) ("rati", "rati");
				case ((22, _)) ("rati", "rati");
				case ((23, _)) ("rati", "rati");
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
