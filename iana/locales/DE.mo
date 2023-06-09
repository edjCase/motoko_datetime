import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module DE {
	public let locale : Types.Locale = {
		id = "de";
		weekdays = [
			"Sonntag",
			"Montag",
			"Dienstag",
			"Mittwoch",
			"Donnerstag",
			"Freitag",
			"Samstag",
		];
		weekdaysShort = [
			"So.",
			"Mo.",
			"Di.",
			"Mi.",
			"Do.",
			"Fr.",
			"Sa.",
		];
		weekdaysMin = [
			"So",
			"Mo",
			"Di",
			"Mi",
			"Do",
			"Fr",
			"Sa",
		];
		months = [
			"Januar",
			"Februar",
			"März",
			"April",
			"Mai",
			"Juni",
			"Juli",
			"August",
			"September",
			"Oktober",
			"November",
			"Dezember",
		];
		monthsShort = [
			"Jan.",
			"Feb.",
			"März",
			"Apr.",
			"Mai",
			"Juni",
			"Juli",
			"Aug.",
			"Sep.",
			"Okt.",
			"Nov.",
			"Dez.",
		];
		firstDayOfWeek = #monday;
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
