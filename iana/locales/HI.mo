import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module HI {
	public let locale : Types.Locale = {
		id = "hi";
		weekdays = [
			"रविवार",
			"सोमवार",
			"मंगलवार",
			"बुधवार",
			"गुरूवार",
			"शुक्रवार",
			"शनिवार",
		];
		weekdaysShort = [
			"रवि",
			"सोम",
			"मंगल",
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
			"जनवरी",
			"फरवरी",
			"मार्च",
			"अप्रैल",
			"मई",
			"जून",
			"जुलाई",
			"अगस्त",
			"सितंबर",
			"अक्टूबर",
			"नवंबर",
			"दिसंबर",
		];
		monthsShort = [
			"जन.",
			"फ़र.",
			"मार्च",
			"अप्रै.",
			"मई",
			"जून",
			"जुल.",
			"अग.",
			"सित.",
			"अक्टू.",
			"नव.",
			"दिस.",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "A h:mm बजे";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm बजे DD/MM/YYYY";
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
