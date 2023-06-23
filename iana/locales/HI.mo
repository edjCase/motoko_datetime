import Types "../Types";
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
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "A h:mm बजे";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm बजे DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("रात", "रात");
				case ((1, _)) ("रात", "रात");
				case ((2, _)) ("रात", "रात");
				case ((3, _)) ("रात", "रात");
				case ((4, _)) ("सुबह", "सुबह");
				case ((5, _)) ("सुबह", "सुबह");
				case ((6, _)) ("सुबह", "सुबह");
				case ((7, _)) ("सुबह", "सुबह");
				case ((8, _)) ("सुबह", "सुबह");
				case ((9, _)) ("सुबह", "सुबह");
				case ((10, _)) ("दोपहर", "दोपहर");
				case ((11, _)) ("दोपहर", "दोपहर");
				case ((12, _)) ("दोपहर", "दोपहर");
				case ((13, _)) ("दोपहर", "दोपहर");
				case ((14, _)) ("दोपहर", "दोपहर");
				case ((15, _)) ("दोपहर", "दोपहर");
				case ((16, _)) ("दोपहर", "दोपहर");
				case ((17, _)) ("शाम", "शाम");
				case ((18, _)) ("शाम", "शाम");
				case ((19, _)) ("शाम", "शाम");
				case ((20, _)) ("रात", "रात");
				case ((21, _)) ("रात", "रात");
				case ((22, _)) ("रात", "रात");
				case ((23, _)) ("रात", "रात");
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
