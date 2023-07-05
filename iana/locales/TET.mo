import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TET {
	public let locale : Types.Locale = {
		id = "tet";
		weekdays = [
			"Domingu",
			"Segunda",
			"Tersa",
			"Kuarta",
			"Kinta",
			"Sesta",
			"Sabadu",
		];
		weekdaysShort = [
			"Dom",
			"Seg",
			"Ters",
			"Kua",
			"Kint",
			"Sest",
			"Sab",
		];
		weekdaysMin = [
			"Do",
			"Seg",
			"Te",
			"Ku",
			"Ki",
			"Ses",
			"Sa",
		];
		months = [
			"Janeiru",
			"Fevereiru",
			"Marsu",
			"Abril",
			"Maiu",
			"Juñu",
			"Jullu",
			"Agustu",
			"Setembru",
			"Outubru",
			"Novembru",
			"Dezembru",
		];
		monthsShort = [
			"Jan",
			"Fev",
			"Mar",
			"Abr",
			"Mai",
			"Jun",
			"Jul",
			"Ago",
			"Set",
			"Out",
			"Nov",
			"Dez",
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
