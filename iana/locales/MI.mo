import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module MI {
	public let locale : Types.Locale = {
		id = "mi";
		weekdays = [
			"Rātapu",
			"Mane",
			"Tūrei",
			"Wenerei",
			"Tāite",
			"Paraire",
			"Hātarei",
		];
		weekdaysShort = [
			"Ta",
			"Ma",
			"Tū",
			"We",
			"Tāi",
			"Pa",
			"Hā",
		];
		weekdaysMin = [
			"Ta",
			"Ma",
			"Tū",
			"We",
			"Tāi",
			"Pa",
			"Hā",
		];
		months = [
			"Kohi-tāte",
			"Hui-tanguru",
			"Poutū-te-rangi",
			"Paenga-whāwhā",
			"Haratua",
			"Pipiri",
			"Hōngoingoi",
			"Here-turi-kōkā",
			"Mahuru",
			"Whiringa-ā-nuku",
			"Whiringa-ā-rangi",
			"Hakihea",
		];
		monthsShort = [
			"Kohi",
			"Hui",
			"Pou",
			"Pae",
			"Hara",
			"Pipi",
			"Hōngoi",
			"Here",
			"Mahu",
			"Whi-nu",
			"Whi-ra",
			"Haki",
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
