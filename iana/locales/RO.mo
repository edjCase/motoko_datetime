import Types "../Types";
module RO {
	public let locale : Types.Locale = {
		id = "ro";
		weekdays = [
			"duminică",
			"luni",
			"marți",
			"miercuri",
			"joi",
			"vineri",
			"sâmbătă",
		];
		weekdaysShort = [
			"Dum",
			"Lun",
			"Mar",
			"Mie",
			"Joi",
			"Vin",
			"Sâm",
		];
		weekdaysMin = [
			"Du",
			"Lu",
			"Ma",
			"Mi",
			"Jo",
			"Vi",
			"Sâ",
		];
		months = [
			"ianuarie",
			"februarie",
			"martie",
			"aprilie",
			"mai",
			"iunie",
			"iulie",
			"august",
			"septembrie",
			"octombrie",
			"noiembrie",
			"decembrie",
		];
		monthsShort = [
			"ian.",
			"feb.",
			"mart.",
			"apr.",
			"mai",
			"iun.",
			"iul.",
			"aug.",
			"sept.",
			"oct.",
			"nov.",
			"dec.",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
	};
};
