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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("ekuseni", "ekuseni");
				case ((1, _)) ("ekuseni", "ekuseni");
				case ((2, _)) ("ekuseni", "ekuseni");
				case ((3, _)) ("ekuseni", "ekuseni");
				case ((4, _)) ("ekuseni", "ekuseni");
				case ((5, _)) ("ekuseni", "ekuseni");
				case ((6, _)) ("ekuseni", "ekuseni");
				case ((7, _)) ("ekuseni", "ekuseni");
				case ((8, _)) ("ekuseni", "ekuseni");
				case ((9, _)) ("ekuseni", "ekuseni");
				case ((10, _)) ("ekuseni", "ekuseni");
				case ((11, _)) ("emini", "emini");
				case ((12, _)) ("emini", "emini");
				case ((13, _)) ("emini", "emini");
				case ((14, _)) ("emini", "emini");
				case ((15, _)) ("entsambama", "entsambama");
				case ((16, _)) ("entsambama", "entsambama");
				case ((17, _)) ("entsambama", "entsambama");
				case ((18, _)) ("entsambama", "entsambama");
				case ((19, _)) ("ebusuku", "ebusuku");
				case ((20, _)) ("ebusuku", "ebusuku");
				case ((21, _)) ("ebusuku", "ebusuku");
				case ((22, _)) ("ebusuku", "ebusuku");
				case ((23, _)) ("ebusuku", "ebusuku");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
