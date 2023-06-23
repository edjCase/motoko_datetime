import Types "../Types";
module TR {
	public let locale : Types.Locale = {
		id = "tr";
		weekdays = [
			"Pazar",
			"Pazartesi",
			"Salı",
			"Çarşamba",
			"Perşembe",
			"Cuma",
			"Cumartesi",
		];
		weekdaysShort = [
			"Paz",
			"Pzt",
			"Sal",
			"Çar",
			"Per",
			"Cum",
			"Cmt",
		];
		weekdaysMin = [
			"Pz",
			"Pt",
			"Sa",
			"Ça",
			"Pe",
			"Cu",
			"Ct",
		];
		months = [
			"Ocak",
			"Şubat",
			"Mart",
			"Nisan",
			"Mayıs",
			"Haziran",
			"Temmuz",
			"Ağustos",
			"Eylül",
			"Ekim",
			"Kasım",
			"Aralık",
		];
		monthsShort = [
			"Oca",
			"Şub",
			"Mar",
			"Nis",
			"May",
			"Haz",
			"Tem",
			"Ağu",
			"Eyl",
			"Eki",
			"Kas",
			"Ara",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("öö", "ÖÖ");
				case ((1, _)) ("öö", "ÖÖ");
				case ((2, _)) ("öö", "ÖÖ");
				case ((3, _)) ("öö", "ÖÖ");
				case ((4, _)) ("öö", "ÖÖ");
				case ((5, _)) ("öö", "ÖÖ");
				case ((6, _)) ("öö", "ÖÖ");
				case ((7, _)) ("öö", "ÖÖ");
				case ((8, _)) ("öö", "ÖÖ");
				case ((9, _)) ("öö", "ÖÖ");
				case ((10, _)) ("öö", "ÖÖ");
				case ((11, _)) ("öö", "ÖÖ");
				case ((12, _)) ("ös", "ÖS");
				case ((13, _)) ("ös", "ÖS");
				case ((14, _)) ("ös", "ÖS");
				case ((15, _)) ("ös", "ÖS");
				case ((16, _)) ("ös", "ÖS");
				case ((17, _)) ("ös", "ÖS");
				case ((18, _)) ("ös", "ÖS");
				case ((19, _)) ("ös", "ÖS");
				case ((20, _)) ("ös", "ÖS");
				case ((21, _)) ("ös", "ÖS");
				case ((22, _)) ("ös", "ÖS");
				case ((23, _)) ("ös", "ÖS");
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
