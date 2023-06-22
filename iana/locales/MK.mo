import Types "../Types";
module MK {
	public let locale : Types.Locale = {
		id = "MK";
		weekdays = [
			"недела",
			"понеделник",
			"вторник",
			"среда",
			"четврток",
			"петок",
			"сабота",
		];
		weekdaysShort = [
			"нед",
			"пон",
			"вто",
			"сре",
			"чет",
			"пет",
			"саб",
		];
		weekdaysMin = [
			"нe",
			"пo",
			"вт",
			"ср",
			"че",
			"пе",
			"сa",
		];
		months = [
			"јануари",
			"февруари",
			"март",
			"април",
			"мај",
			"јуни",
			"јули",
			"август",
			"септември",
			"октомври",
			"ноември",
			"декември",
		];
		monthsShort = [
			"јан",
			"фев",
			"мар",
			"апр",
			"мај",
			"јун",
			"јул",
			"авг",
			"сеп",
			"окт",
			"ное",
			"дек",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "D.MM.YYYY";
		dateTimeFormat = "H:mm D.MM.YYYY";
		longDateFormat = "D.MM.YYYY";
	};
};
