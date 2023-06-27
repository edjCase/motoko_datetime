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
		firstDayOfWeek = 6;
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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((1, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((2, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((3, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((4, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((5, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((6, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((7, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((8, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((9, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((10, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((11, _)) ("قبل از ظهر", "قبل از ظهر");
				case ((12, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((13, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((14, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((15, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((16, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((17, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((18, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((19, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((20, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((21, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((22, _)) ("بعد از ظهر", "بعد از ظهر");
				case ((23, _)) ("بعد از ظهر", "بعد از ظهر");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
