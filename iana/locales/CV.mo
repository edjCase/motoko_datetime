import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module CV {
	public let locale : Types.Locale = {
		id = "cv";
		weekdays = [
			"вырсарникун",
			"тунтикун",
			"ытларикун",
			"юнкун",
			"кӗҫнерникун",
			"эрнекун",
			"шӑматкун",
		];
		weekdaysShort = [
			"выр",
			"тун",
			"ытл",
			"юн",
			"кӗҫ",
			"эрн",
			"шӑм",
		];
		weekdaysMin = [
			"вр",
			"тн",
			"ыт",
			"юн",
			"кҫ",
			"эр",
			"шм",
		];
		months = [
			"кӑрлач",
			"нарӑс",
			"пуш",
			"ака",
			"май",
			"ҫӗртме",
			"утӑ",
			"ҫурла",
			"авӑн",
			"юпа",
			"чӳк",
			"раштав",
		];
		monthsShort = [
			"кӑр",
			"нар",
			"пуш",
			"ака",
			"май",
			"ҫӗр",
			"утӑ",
			"ҫур",
			"авн",
			"юпа",
			"чӳк",
			"раш",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD-MM-YYYY";
		dateTimeFormat = "HH:mm DD-MM-YYYY";
		longDateFormat = "DD-MM-YYYY";
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
