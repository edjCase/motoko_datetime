import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module GA {
	public let locale : Types.Locale = {
		id = "ga";
		weekdays = [
			"Dé Domhnaigh",
			"Dé Luain",
			"Dé Máirt",
			"Dé Céadaoin",
			"Déardaoin",
			"Dé hAoine",
			"Dé Sathairn",
		];
		weekdaysShort = [
			"Domh",
			"Luan",
			"Máirt",
			"Céad",
			"Déar",
			"Aoine",
			"Sath",
		];
		weekdaysMin = [
			"Do",
			"Lu",
			"Má",
			"Cé",
			"Dé",
			"A",
			"Sa",
		];
		months = [
			"Eanáir",
			"Feabhra",
			"Márta",
			"Aibreán",
			"Bealtaine",
			"Meitheamh",
			"Iúil",
			"Lúnasa",
			"Meán Fómhair",
			"Deireadh Fómhair",
			"Samhain",
			"Nollaig",
		];
		monthsShort = [
			"Ean",
			"Feabh",
			"Márt",
			"Aib",
			"Beal",
			"Meith",
			"Iúil",
			"Lún",
			"M.F.",
			"D.F.",
			"Samh",
			"Noll",
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
