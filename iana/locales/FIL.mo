import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module FIL {
	public let locale : Types.Locale = {
		id = "fil";
		weekdays = [
			"Linggo",
			"Lunes",
			"Martes",
			"Miyerkules",
			"Huwebes",
			"Biyernes",
			"Sabado",
		];
		weekdaysShort = [
			"Lin",
			"Lun",
			"Mar",
			"Miy",
			"Huw",
			"Biy",
			"Sab",
		];
		weekdaysMin = [
			"Li",
			"Lu",
			"Ma",
			"Mi",
			"Hu",
			"Bi",
			"Sab",
		];
		months = [
			"Enero",
			"Pebrero",
			"Marso",
			"Abril",
			"Mayo",
			"Hunyo",
			"Hulyo",
			"Agosto",
			"Setyembre",
			"Oktubre",
			"Nobyembre",
			"Disyembre",
		];
		monthsShort = [
			"Ene",
			"Peb",
			"Mar",
			"Abr",
			"May",
			"Hun",
			"Hul",
			"Ago",
			"Set",
			"Okt",
			"Nob",
			"Dis",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "MM/D/YYYY";
		dateTimeFormat = "HH:mm MM/D/YYYY";
		longDateFormat = "MM/D/YYYY";
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
