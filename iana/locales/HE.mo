import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module HE {
	public let locale : Types.Locale = {
		id = "he";
		weekdays = [
			"ראשון",
			"שני",
			"שלישי",
			"רביעי",
			"חמישי",
			"שישי",
			"שבת",
		];
		weekdaysShort = [
			"א׳",
			"ב׳",
			"ג׳",
			"ד׳",
			"ה׳",
			"ו׳",
			"ש׳",
		];
		weekdaysMin = [
			"א",
			"ב",
			"ג",
			"ד",
			"ה",
			"ו",
			"ש",
		];
		months = [
			"ינואר",
			"פברואר",
			"מרץ",
			"אפריל",
			"מאי",
			"יוני",
			"יולי",
			"אוגוסט",
			"ספטמבר",
			"אוקטובר",
			"נובמבר",
			"דצמבר",
		];
		monthsShort = [
			"ינו׳",
			"פבר׳",
			"מרץ",
			"אפר׳",
			"מאי",
			"יוני",
			"יולי",
			"אוג׳",
			"ספט׳",
			"אוק׳",
			"נוב׳",
			"דצמ׳",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
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
