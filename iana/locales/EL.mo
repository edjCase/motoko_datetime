import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module EL {
	public let locale : Types.Locale = {
		id = "el";
		weekdays = [
			"Κυριακή",
			"Δευτέρα",
			"Τρίτη",
			"Τετάρτη",
			"Πέμπτη",
			"Παρασκευή",
			"Σάββατο",
		];
		weekdaysShort = [
			"Κυρ",
			"Δευ",
			"Τρι",
			"Τετ",
			"Πεμ",
			"Παρ",
			"Σαβ",
		];
		weekdaysMin = [
			"Κυ",
			"Δε",
			"Τρ",
			"Τε",
			"Πε",
			"Πα",
			"Σα",
		];
		months = [
			"Ιανουάριος",
			"Φεβρουάριος",
			"Μάρτιος",
			"Απρίλιος",
			"Μάιος",
			"Ιούνιος",
			"Ιούλιος",
			"Αύγουστος",
			"Σεπτέμβριος",
			"Οκτώβριος",
			"Νοέμβριος",
			"Δεκέμβριος",
		];
		monthsShort = [
			"Ιαν",
			"Φεβ",
			"Μαρ",
			"Απρ",
			"Μαϊ",
			"Ιουν",
			"Ιουλ",
			"Αυγ",
			"Σεπ",
			"Οκτ",
			"Νοε",
			"Δεκ",
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
