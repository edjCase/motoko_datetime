import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module KK {
	public let locale : Types.Locale = {
		id = "kk";
		weekdays = [
			"жексенбі",
			"дүйсенбі",
			"сейсенбі",
			"сәрсенбі",
			"бейсенбі",
			"жұма",
			"сенбі",
		];
		weekdaysShort = [
			"жек",
			"дүй",
			"сей",
			"сәр",
			"бей",
			"жұм",
			"сен",
		];
		weekdaysMin = [
			"жк",
			"дй",
			"сй",
			"ср",
			"бй",
			"жм",
			"сн",
		];
		months = [
			"қаңтар",
			"ақпан",
			"наурыз",
			"сәуір",
			"мамыр",
			"маусым",
			"шілде",
			"тамыз",
			"қыркүйек",
			"қазан",
			"қараша",
			"желтоқсан",
		];
		monthsShort = [
			"қаң",
			"ақп",
			"нау",
			"сәу",
			"мам",
			"мау",
			"шіл",
			"там",
			"қыр",
			"қаз",
			"қар",
			"жел",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
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
