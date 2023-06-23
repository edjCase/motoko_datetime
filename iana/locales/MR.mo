import Types "../Types";
module MR {
	public let locale : Types.Locale = {
		id = "mr";
		weekdays = [
			"रविवार",
			"सोमवार",
			"मंगळवार",
			"बुधवार",
			"गुरूवार",
			"शुक्रवार",
			"शनिवार",
		];
		weekdaysShort = [
			"रवि",
			"सोम",
			"मंगळ",
			"बुध",
			"गुरू",
			"शुक्र",
			"शनि",
		];
		weekdaysMin = [
			"र",
			"सो",
			"मं",
			"बु",
			"गु",
			"शु",
			"श",
		];
		months = [
			"जानेवारी",
			"फेब्रुवारी",
			"मार्च",
			"एप्रिल",
			"मे",
			"जून",
			"जुलै",
			"ऑगस्ट",
			"सप्टेंबर",
			"ऑक्टोबर",
			"नोव्हेंबर",
			"डिसेंबर",
		];
		monthsShort = [
			"जाने.",
			"फेब्रु.",
			"मार्च.",
			"एप्रि.",
			"मे.",
			"जून.",
			"जुलै.",
			"ऑग.",
			"सप्टें.",
			"ऑक्टो.",
			"नोव्हें.",
			"डिसें.",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "A h:mm वाजता";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm वाजता DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("पहाटे", "पहाटे");
				case ((1, _)) ("पहाटे", "पहाटे");
				case ((2, _)) ("पहाटे", "पहाटे");
				case ((3, _)) ("पहाटे", "पहाटे");
				case ((4, _)) ("पहाटे", "पहाटे");
				case ((5, _)) ("पहाटे", "पहाटे");
				case ((6, _)) ("सकाळी", "सकाळी");
				case ((7, _)) ("सकाळी", "सकाळी");
				case ((8, _)) ("सकाळी", "सकाळी");
				case ((9, _)) ("सकाळी", "सकाळी");
				case ((10, _)) ("सकाळी", "सकाळी");
				case ((11, _)) ("सकाळी", "सकाळी");
				case ((12, _)) ("दुपारी", "दुपारी");
				case ((13, _)) ("दुपारी", "दुपारी");
				case ((14, _)) ("दुपारी", "दुपारी");
				case ((15, _)) ("दुपारी", "दुपारी");
				case ((16, _)) ("दुपारी", "दुपारी");
				case ((17, _)) ("सायंकाळी", "सायंकाळी");
				case ((18, _)) ("सायंकाळी", "सायंकाळी");
				case ((19, _)) ("सायंकाळी", "सायंकाळी");
				case ((20, _)) ("रात्री", "रात्री");
				case ((21, _)) ("रात्री", "रात्री");
				case ((22, _)) ("रात्री", "रात्री");
				case ((23, _)) ("रात्री", "रात्री");
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
