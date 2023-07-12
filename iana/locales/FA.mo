import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module FA {
	public let locale : Types.Locale = {
		id = "fa";
		weekdays = [
			"یک‌شنبه",
			"دوشنبه",
			"سه‌شنبه",
			"چهارشنبه",
			"پنج‌شنبه",
			"جمعه",
			"شنبه",
		];
		weekdaysShort = [
			"یک‌شنبه",
			"دوشنبه",
			"سه‌شنبه",
			"چهارشنبه",
			"پنج‌شنبه",
			"جمعه",
			"شنبه",
		];
		weekdaysMin = [
			"ی",
			"د",
			"س",
			"چ",
			"پ",
			"ج",
			"ش",
		];
		months = [
			"ژانویه",
			"فوریه",
			"مارس",
			"آوریل",
			"مه",
			"ژوئن",
			"ژوئیه",
			"اوت",
			"سپتامبر",
			"اکتبر",
			"نوامبر",
			"دسامبر",
		];
		monthsShort = [
			"ژانویه",
			"فوریه",
			"مارس",
			"آوریل",
			"مه",
			"ژوئن",
			"ژوئیه",
			"اوت",
			"سپتامبر",
			"اکتبر",
			"نوامبر",
			"دسامبر",
		];
		firstDayOfWeek = #saturday;
		firstDayOfYear = 12;
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
