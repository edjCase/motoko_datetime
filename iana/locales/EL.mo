import Types "../Types";
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
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("πμ", "ΠΜ");
				case ((1, _)) ("πμ", "ΠΜ");
				case ((2, _)) ("πμ", "ΠΜ");
				case ((3, _)) ("πμ", "ΠΜ");
				case ((4, _)) ("πμ", "ΠΜ");
				case ((5, _)) ("πμ", "ΠΜ");
				case ((6, _)) ("πμ", "ΠΜ");
				case ((7, _)) ("πμ", "ΠΜ");
				case ((8, _)) ("πμ", "ΠΜ");
				case ((9, _)) ("πμ", "ΠΜ");
				case ((10, _)) ("πμ", "ΠΜ");
				case ((11, _)) ("πμ", "ΠΜ");
				case ((12, _)) ("μμ", "ΜΜ");
				case ((13, _)) ("μμ", "ΜΜ");
				case ((14, _)) ("μμ", "ΜΜ");
				case ((15, _)) ("μμ", "ΜΜ");
				case ((16, _)) ("μμ", "ΜΜ");
				case ((17, _)) ("μμ", "ΜΜ");
				case ((18, _)) ("μμ", "ΜΜ");
				case ((19, _)) ("μμ", "ΜΜ");
				case ((20, _)) ("μμ", "ΜΜ");
				case ((21, _)) ("μμ", "ΜΜ");
				case ((22, _)) ("μμ", "ΜΜ");
				case ((23, _)) ("μμ", "ΜΜ");
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
