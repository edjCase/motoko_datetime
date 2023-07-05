import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module KM {
	public let locale : Types.Locale = {
		id = "km";
		weekdays = [
			"អាទិត្យ",
			"ច័ន្ទ",
			"អង្គារ",
			"ពុធ",
			"ព្រហស្បតិ៍",
			"សុក្រ",
			"សៅរ៍",
		];
		weekdaysShort = [
			"អា",
			"ច",
			"អ",
			"ព",
			"ព្រ",
			"សុ",
			"ស",
		];
		weekdaysMin = [
			"អា",
			"ច",
			"អ",
			"ព",
			"ព្រ",
			"សុ",
			"ស",
		];
		months = [
			"មករា",
			"កុម្ភៈ",
			"មីនា",
			"មេសា",
			"ឧសភា",
			"មិថុនា",
			"កក្កដា",
			"សីហា",
			"កញ្ញា",
			"តុលា",
			"វិច្ឆិកា",
			"ធ្នូ",
		];
		monthsShort = [
			"មករា",
			"កុម្ភៈ",
			"មីនា",
			"មេសា",
			"ឧសភា",
			"មិថុនា",
			"កក្កដា",
			"សីហា",
			"កញ្ញា",
			"តុលា",
			"វិច្ឆិកា",
			"ធ្នូ",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
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
