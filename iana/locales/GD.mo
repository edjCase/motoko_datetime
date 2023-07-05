import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module GD {
	public let locale : Types.Locale = {
		id = "gd";
		weekdays = [
			"Didòmhnaich",
			"Diluain",
			"Dimàirt",
			"Diciadain",
			"Diardaoin",
			"Dihaoine",
			"Disathairne",
		];
		weekdaysShort = [
			"Did",
			"Dil",
			"Dim",
			"Dic",
			"Dia",
			"Dih",
			"Dis",
		];
		weekdaysMin = [
			"Dò",
			"Lu",
			"Mà",
			"Ci",
			"Ar",
			"Ha",
			"Sa",
		];
		months = [
			"Am Faoilleach",
			"An Gearran",
			"Am Màrt",
			"An Giblean",
			"An Cèitean",
			"An t-Ògmhios",
			"An t-Iuchar",
			"An Lùnastal",
			"An t-Sultain",
			"An Dàmhair",
			"An t-Samhain",
			"An Dùbhlachd",
		];
		monthsShort = [
			"Faoi",
			"Gear",
			"Màrt",
			"Gibl",
			"Cèit",
			"Ògmh",
			"Iuch",
			"Lùn",
			"Sult",
			"Dàmh",
			"Samh",
			"Dùbh",
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
