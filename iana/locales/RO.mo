import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module RO {
	public let locale : Types.Locale = {
		id = "ro";
		weekdays = [
			"duminică",
			"luni",
			"marți",
			"miercuri",
			"joi",
			"vineri",
			"sâmbătă",
		];
		weekdaysShort = [
			"Dum",
			"Lun",
			"Mar",
			"Mie",
			"Joi",
			"Vin",
			"Sâm",
		];
		weekdaysMin = [
			"Du",
			"Lu",
			"Ma",
			"Mi",
			"Jo",
			"Vi",
			"Sâ",
		];
		months = [
			"ianuarie",
			"februarie",
			"martie",
			"aprilie",
			"mai",
			"iunie",
			"iulie",
			"august",
			"septembrie",
			"octombrie",
			"noiembrie",
			"decembrie",
		];
		monthsShort = [
			"ian.",
			"feb.",
			"mart.",
			"apr.",
			"mai",
			"iun.",
			"iul.",
			"aug.",
			"sept.",
			"oct.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
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
