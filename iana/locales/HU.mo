import Types "../Types";
module HU {
	public let locale : Types.Locale = {
		id = "hu";
		weekdays = [
			"vasárnap",
			"hétfő",
			"kedd",
			"szerda",
			"csütörtök",
			"péntek",
			"szombat",
		];
		weekdaysShort = [
			"vas",
			"hét",
			"kedd",
			"sze",
			"csüt",
			"pén",
			"szo",
		];
		weekdaysMin = [
			"v",
			"h",
			"k",
			"sze",
			"cs",
			"p",
			"szo",
		];
		months = [
			"január",
			"február",
			"március",
			"április",
			"május",
			"június",
			"július",
			"augusztus",
			"szeptember",
			"október",
			"november",
			"december",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"márc.",
			"ápr.",
			"máj.",
			"jún.",
			"júl.",
			"aug.",
			"szept.",
			"okt.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "YYYY.MM.DD.";
		dateTimeFormat = "H:mm YYYY.MM.DD.";
		longDateFormat = "YYYY.MM.DD.";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("de", "DE");
				case ((1, _)) ("de", "DE");
				case ((2, _)) ("de", "DE");
				case ((3, _)) ("de", "DE");
				case ((4, _)) ("de", "DE");
				case ((5, _)) ("de", "DE");
				case ((6, _)) ("de", "DE");
				case ((7, _)) ("de", "DE");
				case ((8, _)) ("de", "DE");
				case ((9, _)) ("de", "DE");
				case ((10, _)) ("de", "DE");
				case ((11, _)) ("de", "DE");
				case ((12, _)) ("du", "DU");
				case ((13, _)) ("du", "DU");
				case ((14, _)) ("du", "DU");
				case ((15, _)) ("du", "DU");
				case ((16, _)) ("du", "DU");
				case ((17, _)) ("du", "DU");
				case ((18, _)) ("du", "DU");
				case ((19, _)) ("du", "DU");
				case ((20, _)) ("du", "DU");
				case ((21, _)) ("du", "DU");
				case ((22, _)) ("du", "DU");
				case ((23, _)) ("du", "DU");
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
