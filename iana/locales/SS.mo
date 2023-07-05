import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module SS {
	public let locale : Types.Locale = {
		id = "ss";
		weekdays = [
			"Lisontfo",
			"Umsombuluko",
			"Lesibili",
			"Lesitsatfu",
			"Lesine",
			"Lesihlanu",
			"Umgcibelo",
		];
		weekdaysShort = [
			"Lis",
			"Umb",
			"Lsb",
			"Les",
			"Lsi",
			"Lsh",
			"Umg",
		];
		weekdaysMin = [
			"Li",
			"Us",
			"Lb",
			"Lt",
			"Ls",
			"Lh",
			"Ug",
		];
		months = [
			"Bhimbidvwane",
			"Indlovana",
			"Indlov'lenkhulu",
			"Mabasa",
			"Inkhwekhweti",
			"Inhlaba",
			"Kholwane",
			"Ingci",
			"Inyoni",
			"Imphala",
			"Lweti",
			"Ingongoni",
		];
		monthsShort = [
			"Bhi",
			"Ina",
			"Inu",
			"Mab",
			"Ink",
			"Inh",
			"Kho",
			"Igc",
			"Iny",
			"Imp",
			"Lwe",
			"Igo",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "h:mm A";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "h:mm A DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
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
