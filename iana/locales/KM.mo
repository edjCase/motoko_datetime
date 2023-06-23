import Types "../Types";
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
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("ព្រឹក", "ព្រឹក");
				case ((1, _)) ("ព្រឹក", "ព្រឹក");
				case ((2, _)) ("ព្រឹក", "ព្រឹក");
				case ((3, _)) ("ព្រឹក", "ព្រឹក");
				case ((4, _)) ("ព្រឹក", "ព្រឹក");
				case ((5, _)) ("ព្រឹក", "ព្រឹក");
				case ((6, _)) ("ព្រឹក", "ព្រឹក");
				case ((7, _)) ("ព្រឹក", "ព្រឹក");
				case ((8, _)) ("ព្រឹក", "ព្រឹក");
				case ((9, _)) ("ព្រឹក", "ព្រឹក");
				case ((10, _)) ("ព្រឹក", "ព្រឹក");
				case ((11, _)) ("ព្រឹក", "ព្រឹក");
				case ((12, _)) ("ល្ងាច", "ល្ងាច");
				case ((13, _)) ("ល្ងាច", "ល្ងាច");
				case ((14, _)) ("ល្ងាច", "ល្ងាច");
				case ((15, _)) ("ល្ងាច", "ល្ងាច");
				case ((16, _)) ("ល្ងាច", "ល្ងាច");
				case ((17, _)) ("ល្ងាច", "ល្ងាច");
				case ((18, _)) ("ល្ងាច", "ល្ងាច");
				case ((19, _)) ("ល្ងាច", "ល្ងាច");
				case ((20, _)) ("ល្ងាច", "ល្ងាច");
				case ((21, _)) ("ល្ងាច", "ល្ងាច");
				case ((22, _)) ("ល្ងាច", "ល្ងាច");
				case ((23, _)) ("ល្ងាច", "ល្ងាច");
			};
			if (isLower) lower else upper;
		};
		eras = [
			{
				start = -62135568422000000;
				end = null;
				offset = 1;
				fullName = "Anno Domini";
				narrowName = "AD";
				abbreviatedName = "AD";
			},
			{
				start = null;
				end = -62135654822000000;
				offset = 1;
				fullName = "Before Christ";
				narrowName = "BC";
				abbreviatedName = "BC";
			},
		];
	};
};
