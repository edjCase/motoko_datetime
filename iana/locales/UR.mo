import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module UR {
	public let locale : Types.Locale = {
		id = "ur";
		weekdays = [
			"اتوار",
			"پیر",
			"منگل",
			"بدھ",
			"جمعرات",
			"جمعہ",
			"ہفتہ",
		];
		weekdaysShort = [
			"اتوار",
			"پیر",
			"منگل",
			"بدھ",
			"جمعرات",
			"جمعہ",
			"ہفتہ",
		];
		weekdaysMin = [
			"اتوار",
			"پیر",
			"منگل",
			"بدھ",
			"جمعرات",
			"جمعہ",
			"ہفتہ",
		];
		months = [
			"جنوری",
			"فروری",
			"مارچ",
			"اپریل",
			"مئی",
			"جون",
			"جولائی",
			"اگست",
			"ستمبر",
			"اکتوبر",
			"نومبر",
			"دسمبر",
		];
		monthsShort = [
			"جنوری",
			"فروری",
			"مارچ",
			"اپریل",
			"مئی",
			"جون",
			"جولائی",
			"اگست",
			"ستمبر",
			"اکتوبر",
			"نومبر",
			"دسمبر",
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
