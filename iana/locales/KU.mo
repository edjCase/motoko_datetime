import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module KU {
	public let locale : Types.Locale = {
		id = "ku";
		weekdays = [
			"یه‌كشه‌ممه‌",
			"دووشه‌ممه‌",
			"سێشه‌ممه‌",
			"چوارشه‌ممه‌",
			"پێنجشه‌ممه‌",
			"هه‌ینی",
			"شه‌ممه‌",
		];
		weekdaysShort = [
			"یه‌كشه‌م",
			"دووشه‌م",
			"سێشه‌م",
			"چوارشه‌م",
			"پێنجشه‌م",
			"هه‌ینی",
			"شه‌ممه‌",
		];
		weekdaysMin = [
			"ی",
			"د",
			"س",
			"چ",
			"پ",
			"ه",
			"ش",
		];
		months = [
			"کانونی دووەم",
			"شوبات",
			"ئازار",
			"نیسان",
			"ئایار",
			"حوزەیران",
			"تەمموز",
			"ئاب",
			"ئەیلوول",
			"تشرینی یەكەم",
			"تشرینی دووەم",
			"كانونی یەکەم",
		];
		monthsShort = [
			"کانونی دووەم",
			"شوبات",
			"ئازار",
			"نیسان",
			"ئایار",
			"حوزەیران",
			"تەمموز",
			"ئاب",
			"ئەیلوول",
			"تشرینی یەكەم",
			"تشرینی دووەم",
			"كانونی یەکەم",
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
	};
};
