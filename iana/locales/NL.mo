import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module NL {
	public let locale : Types.Locale = {
		id = "nl";
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
