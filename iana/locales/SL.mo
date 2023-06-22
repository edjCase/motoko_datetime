import Types "../Types";
module SL {
	public let locale : Types.Locale = {
		id = "SL";
		weekdays = [
			"nedelja",
			"ponedeljek",
			"torek",
			"sreda",
			"četrtek",
			"petek",
			"sobota",
		];
		weekdaysShort = [
			"ned.",
			"pon.",
			"tor.",
			"sre.",
			"čet.",
			"pet.",
			"sob.",
		];
		weekdaysMin = [
			"ne",
			"po",
			"to",
			"sr",
			"če",
			"pe",
			"so",
		];
		months = [
			"januar",
			"februar",
			"marec",
			"april",
			"maj",
			"junij",
			"julij",
			"avgust",
			"september",
			"oktober",
			"november",
			"december",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"mar.",
			"apr.",
			"maj.",
			"jun.",
			"jul.",
			"avg.",
			"sep.",
			"okt.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "DD. MM. YYYY";
		dateTimeFormat = "H:mm DD. MM. YYYY";
		longDateFormat = "DD. MM. YYYY";
	};
};
