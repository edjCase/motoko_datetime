import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module AR_MA {
	public let locale : Types.Locale = {
		id = "ar-ma";
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
			"احد",
			"اثنين",
			"ثلاثاء",
			"اربعاء",
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
			"يناير",
			"فبراير",
			"مارس",
			"أبريل",
			"ماي",
			"يونيو",
			"يوليوز",
			"غشت",
			"شتنبر",
			"أكتوبر",
			"نونبر",
			"دجنبر",
		];
		monthsShort = [
			"يناير",
			"فبراير",
			"مارس",
			"أبريل",
			"ماي",
			"يونيو",
			"يوليوز",
			"غشت",
			"شتنبر",
			"أكتوبر",
			"نونبر",
			"دجنبر",
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
