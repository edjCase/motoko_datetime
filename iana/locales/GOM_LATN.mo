import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
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
		firstDayOfWeek = #sunday;
		firstDayOfYear = 3;
		timeFormat = "A h:mm [vazta]";
		dateFormat = "DD-MM-YYYY";
		dateTimeFormat = "A h:mm [vazta] DD-MM-YYYY";
		longDateFormat = "DD-MM-YYYY";
		eras = [
			{
				start = ?-62135568422000000;
				end = null;
				offset = 1;
				fullName = "Anno Domini";
				narrowName = "AD";
				abbreviatedName = "AD";
			},
			{
				start = null;
				end = ?-62135654822000000;
				offset = 1;
				fullName = "Before Christ";
				narrowName = "BC";
				abbreviatedName = "BC";
			},
		];
	};
};
