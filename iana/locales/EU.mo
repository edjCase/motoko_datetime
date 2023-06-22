import Types "../Types";
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
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "YYYY-MM-DD";
		dateTimeFormat = "HH:mm YYYY-MM-DD";
		longDateFormat = "YYYY-MM-DD";
	};
};
