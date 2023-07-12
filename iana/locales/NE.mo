import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module NE {
	public let locale : Types.Locale = {
		id = "ne";
		weekdays = [
			"आइतबार",
			"सोमबार",
			"मङ्गलबार",
			"बुधबार",
			"बिहिबार",
			"शुक्रबार",
			"शनिबार",
		];
		weekdaysShort = [
			"आइत.",
			"सोम.",
			"मङ्गल.",
			"बुध.",
			"बिहि.",
			"शुक्र.",
			"शनि.",
		];
		weekdaysMin = [
			"आ.",
			"सो.",
			"मं.",
			"बु.",
			"बि.",
			"शु.",
			"श.",
		];
		months = [
			"जनवरी",
			"फेब्रुवरी",
			"मार्च",
			"अप्रिल",
			"मई",
			"जुन",
			"जुलाई",
			"अगष्ट",
			"सेप्टेम्बर",
			"अक्टोबर",
			"नोभेम्बर",
			"डिसेम्बर",
		];
		monthsShort = [
			"जन.",
			"फेब्रु.",
			"मार्च",
			"अप्रि.",
			"मई",
			"जुन",
			"जुलाई.",
			"अग.",
			"सेप्ट.",
			"अक्टो.",
			"नोभे.",
			"डिसे.",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "Aको h:mm बजे";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "Aको h:mm बजे DD/MM/YYYY";
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
