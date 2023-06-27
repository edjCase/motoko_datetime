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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("לפנות בוקר", "לפנות בוקר");
				case ((1, _)) ("לפנות בוקר", "לפנות בוקר");
				case ((2, _)) ("לפנות בוקר", "לפנות בוקר");
				case ((3, _)) ("לפנות בוקר", "לפנות בוקר");
				case ((4, _)) ("לפנות בוקר", "לפנות בוקר");
				case ((5, _)) ("בבוקר", "בבוקר");
				case ((6, _)) ("בבוקר", "בבוקר");
				case ((7, _)) ("בבוקר", "בבוקר");
				case ((8, _)) ("בבוקר", "בבוקר");
				case ((9, _)) ("בבוקר", "בבוקר");
				case ((10, _)) ("לפנה"צ", "לפני הצהריים");
				case ((11, _)) ("לפנה"צ", "לפני הצהריים");
				case ((12, _)) ("אחה"צ", "אחרי הצהריים");
				case ((13, _)) ("אחה"צ", "אחרי הצהריים");
				case ((14, _)) ("אחה"צ", "אחרי הצהריים");
				case ((15, _)) ("אחה"צ", "אחרי הצהריים");
				case ((16, _)) ("אחה"צ", "אחרי הצהריים");
				case ((17, _)) ("אחה"צ", "אחרי הצהריים");
				case ((18, _)) ("בערב", "בערב");
				case ((19, _)) ("בערב", "בערב");
				case ((20, _)) ("בערב", "בערב");
				case ((21, _)) ("בערב", "בערב");
				case ((22, _)) ("בערב", "בערב");
				case ((23, _)) ("בערב", "בערב");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
