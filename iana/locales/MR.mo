import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
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
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "A h:mm वाजता";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm वाजता DD/MM/YYYY";
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
