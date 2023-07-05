import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module BR {
	public let locale : Types.Locale = {
		id = "br";
		weekdays = [
			"Sul",
			"Lun",
			"Meurzh",
			"Mercʼher",
			"Yaou",
			"Gwener",
			"Sadorn",
		];
		weekdaysShort = [
			"Sul",
			"Lun",
			"Meu",
			"Mer",
			"Yao",
			"Gwe",
			"Sad",
		];
		weekdaysMin = [
			"Su",
			"Lu",
			"Me",
			"Mer",
			"Ya",
			"Gw",
			"Sa",
		];
		months = [
			"Genver",
			"Cʼhwevrer",
			"Meurzh",
			"Ebrel",
			"Mae",
			"Mezheven",
			"Gouere",
			"Eost",
			"Gwengolo",
			"Here",
			"Du",
			"Kerzu",
		];
		monthsShort = [
			"Gen",
			"Cʼhwe",
			"Meu",
			"Ebr",
			"Mae",
			"Eve",
			"Gou",
			"Eos",
			"Gwe",
			"Her",
			"Du",
			"Ker",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
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
