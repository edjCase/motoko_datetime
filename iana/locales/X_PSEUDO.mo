import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module X_PSEUDO {
	public let locale : Types.Locale = {
		id = "x-pseudo";
		weekdays = [
			"S~úñdá~ý",
			"Mó~ñdáý~",
			"Túé~sdáý~",
			"Wéd~ñésd~áý",
			"T~húrs~dáý",
			"~Fríd~áý",
			"S~átúr~dáý",
		];
		weekdaysShort = [
			"S~úñ",
			"~Móñ",
			"~Túé",
			"~Wéd",
			"~Thú",
			"~Frí",
			"~Sát",
		];
		weekdaysMin = [
			"S~ú",
			"Mó~",
			"Tú",
			"~Wé",
			"T~h",
			"Fr~",
			"Sá",
		];
		months = [
			"J~áñúá~rý",
			"F~ébrú~árý",
			"~Márc~h",
			"Áp~ríl",
			"~Máý",
			"~Júñé~",
			"Júl~ý",
			"Áú~gúst~",
			"Sép~témb~ér",
			"Ó~ctób~ér",
			"Ñ~óvém~bér",
			"~Décé~mbér",
		];
		monthsShort = [
			"J~áñ",
			"~Féb",
			"~Már",
			"~Ápr",
			"~Máý",
			"~Júñ",
			"~Júl",
			"~Áúg",
			"~Sép",
			"~Óct",
			"~Ñóv",
			"~Déc",
		];
		firstDayOfWeek = #monday;
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
