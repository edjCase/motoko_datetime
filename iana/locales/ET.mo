import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module ET {
	public let locale : Types.Locale = {
		id = "et";
		weekdays = [
			"pühapäev",
			"esmaspäev",
			"teisipäev",
			"kolmapäev",
			"neljapäev",
			"reede",
			"laupäev",
		];
		weekdaysShort = [
			"P",
			"E",
			"T",
			"K",
			"N",
			"R",
			"L",
		];
		weekdaysMin = [
			"P",
			"E",
			"T",
			"K",
			"N",
			"R",
			"L",
		];
		months = [
			"jaanuar",
			"veebruar",
			"märts",
			"aprill",
			"mai",
			"juuni",
			"juuli",
			"august",
			"september",
			"oktoober",
			"november",
			"detsember",
		];
		monthsShort = [
			"jaan",
			"veebr",
			"märts",
			"apr",
			"mai",
			"juuni",
			"juuli",
			"aug",
			"sept",
			"okt",
			"nov",
			"dets",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
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
