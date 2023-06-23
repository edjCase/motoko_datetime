import Types "../Types";
module GOM_DEVA {
	public let locale : Types.Locale = {
		id = "gom-deva";
		weekdays = [
			"आयतार",
			"सोमार",
			"मंगळार",
			"बुधवार",
			"बिरेस्तार",
			"सुक्रार",
			"शेनवार",
		];
		weekdaysShort = [
			"आयत.",
			"सोम.",
			"मंगळ.",
			"बुध.",
			"ब्रेस्त.",
			"सुक्र.",
			"शेन.",
		];
		weekdaysMin = [
			"आ",
			"सो",
			"मं",
			"बु",
			"ब्रे",
			"सु",
			"शे",
		];
		months = [
			"जानेवारी",
			"फेब्रुवारी",
			"मार्च",
			"एप्रील",
			"मे",
			"जून",
			"जुलय",
			"ऑगस्ट",
			"सप्टेंबर",
			"ऑक्टोबर",
			"नोव्हेंबर",
			"डिसेंबर",
		];
		monthsShort = [
			"जाने.",
			"फेब्रु.",
			"मार्च",
			"एप्री.",
			"मे",
			"जून",
			"जुल.",
			"ऑग.",
			"सप्टें.",
			"ऑक्टो.",
			"नोव्हें.",
			"डिसें.",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 3;
		timeFormat = "A h:mm [वाजतां]";
		dateFormat = "DD-MM-YYYY";
		dateTimeFormat = "A h:mm [वाजतां] DD-MM-YYYY";
		longDateFormat = "DD-MM-YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("राती", "राती");
				case ((1, _)) ("राती", "राती");
				case ((2, _)) ("राती", "राती");
				case ((3, _)) ("राती", "राती");
				case ((4, _)) ("सकाळीं", "सकाळीं");
				case ((5, _)) ("सकाळीं", "सकाळीं");
				case ((6, _)) ("सकाळीं", "सकाळीं");
				case ((7, _)) ("सकाळीं", "सकाळीं");
				case ((8, _)) ("सकाळीं", "सकाळीं");
				case ((9, _)) ("सकाळीं", "सकाळीं");
				case ((10, _)) ("सकाळीं", "सकाळीं");
				case ((11, _)) ("सकाळीं", "सकाळीं");
				case ((12, _)) ("दनपारां", "दनपारां");
				case ((13, _)) ("दनपारां", "दनपारां");
				case ((14, _)) ("दनपारां", "दनपारां");
				case ((15, _)) ("दनपारां", "दनपारां");
				case ((16, _)) ("सांजे", "सांजे");
				case ((17, _)) ("सांजे", "सांजे");
				case ((18, _)) ("सांजे", "सांजे");
				case ((19, _)) ("सांजे", "सांजे");
				case ((20, _)) ("राती", "राती");
				case ((21, _)) ("राती", "राती");
				case ((22, _)) ("राती", "राती");
				case ((23, _)) ("राती", "राती");
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
