import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module EU {
	public let locale : Types.Locale = {
		id = "eu";
		weekdays = [
			"igandea",
			"astelehena",
			"asteartea",
			"asteazkena",
			"osteguna",
			"ostirala",
			"larunbata",
		];
		weekdaysShort = [
			"ig.",
			"al.",
			"ar.",
			"az.",
			"og.",
			"ol.",
			"lr.",
		];
		weekdaysMin = [
			"ig",
			"al",
			"ar",
			"az",
			"og",
			"ol",
			"lr",
		];
		months = [
			"urtarrila",
			"otsaila",
			"martxoa",
			"apirila",
			"maiatza",
			"ekaina",
			"uztaila",
			"abuztua",
			"iraila",
			"urria",
			"azaroa",
			"abendua",
		];
		monthsShort = [
			"urt.",
			"ots.",
			"mar.",
			"api.",
			"mai.",
			"eka.",
			"uzt.",
			"abu.",
			"ira.",
			"urr.",
			"aza.",
			"abe.",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
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
