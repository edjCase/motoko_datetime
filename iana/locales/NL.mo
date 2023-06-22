import Types "../Types";
module NL {
	public let locale : Types.Locale = {
		id = "NL";
		weekdays = [
			"zondag",
			"maandag",
			"dinsdag",
			"woensdag",
			"donderdag",
			"vrijdag",
			"zaterdag",
		];
		weekdaysShort = [
			"zo.",
			"ma.",
			"di.",
			"wo.",
			"do.",
			"vr.",
			"za.",
		];
		weekdaysMin = [
			"zo",
			"ma",
			"di",
			"wo",
			"do",
			"vr",
			"za",
		];
		months = [
			"januari",
			"februari",
			"maart",
			"april",
			"mei",
			"juni",
			"juli",
			"augustus",
			"september",
			"oktober",
			"november",
			"december",
		];
		monthsShort = [
			"jan.",
			"feb.",
			"mrt.",
			"apr.",
			"mei",
			"jun.",
			"jul.",
			"aug.",
			"sep.",
			"okt.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "DD-MM-YYYY";
		dateTimeFormat = "HH:mm DD-MM-YYYY";
		longDateFormat = "DD-MM-YYYY";
	};
};
