import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
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
		firstDayOfWeek = #sunday;
		firstDayOfYear = 3;
		timeFormat = "A h:mm [वाजतां]";
		dateFormat = "DD-MM-YYYY";
		dateTimeFormat = "A h:mm [वाजतां] DD-MM-YYYY";
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
