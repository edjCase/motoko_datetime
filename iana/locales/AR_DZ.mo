import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module AR_DZ {
	public let locale : Types.Locale = {
		id = "ar-dz";
		weekdays = [
			"الأحد",
			"الإثنين",
			"الثلاثاء",
			"الأربعاء",
			"الخميس",
			"الجمعة",
			"السبت",
		];
		weekdaysShort = [
			"أحد",
			"إثنين",
			"ثلاثاء",
			"أربعاء",
			"خميس",
			"جمعة",
			"سبت",
		];
		weekdaysMin = [
			"ح",
			"ن",
			"ث",
			"ر",
			"خ",
			"ج",
			"س",
		];
		months = [
			"جانفي",
			"فيفري",
			"مارس",
			"أفريل",
			"ماي",
			"جوان",
			"جويلية",
			"أوت",
			"سبتمبر",
			"أكتوبر",
			"نوفمبر",
			"ديسمبر",
		];
		monthsShort = [
			"جانفي",
			"فيفري",
			"مارس",
			"أفريل",
			"ماي",
			"جوان",
			"جويلية",
			"أوت",
			"سبتمبر",
			"أكتوبر",
			"نوفمبر",
			"ديسمبر",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "D/‏M/‏YYYY";
		dateTimeFormat = "HH:mm D/‏M/‏YYYY";
		longDateFormat = "D/‏M/‏YYYY";
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
