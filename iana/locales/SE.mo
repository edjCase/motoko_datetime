import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SE {
	public let locale : Types.Locale = {
		id = "se";
		weekdays = [
			"sotnabeaivi",
			"vuossárga",
			"maŋŋebárga",
			"gaskavahkku",
			"duorastat",
			"bearjadat",
			"lávvardat",
		];
		weekdaysShort = [
			"sotn",
			"vuos",
			"maŋ",
			"gask",
			"duor",
			"bear",
			"láv",
		];
		weekdaysMin = [
			"s",
			"v",
			"m",
			"g",
			"d",
			"b",
			"L",
		];
		months = [
			"ođđajagemánnu",
			"guovvamánnu",
			"njukčamánnu",
			"cuoŋománnu",
			"miessemánnu",
			"geassemánnu",
			"suoidnemánnu",
			"borgemánnu",
			"čakčamánnu",
			"golggotmánnu",
			"skábmamánnu",
			"juovlamánnu",
		];
		monthsShort = [
			"ođđj",
			"guov",
			"njuk",
			"cuo",
			"mies",
			"geas",
			"suoi",
			"borg",
			"čakč",
			"golg",
			"skáb",
			"juov",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
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
