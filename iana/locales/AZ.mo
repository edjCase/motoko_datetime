import Types "../Types";
module AZ {
	public let locale : Types.Locale = {
		id = "az";
		weekdays = [
			"Bazar",
			"Bazar ertəsi",
			"Çərşənbə axşamı",
			"Çərşənbə",
			"Cümə axşamı",
			"Cümə",
			"Şənbə",
		];
		weekdaysShort = [
			"Baz",
			"BzE",
			"ÇAx",
			"Çər",
			"CAx",
			"Cüm",
			"Şən",
		];
		weekdaysMin = [
			"Bz",
			"BE",
			"ÇA",
			"Çə",
			"CA",
			"Cü",
			"Şə",
		];
		months = [
			"yanvar",
			"fevral",
			"mart",
			"aprel",
			"may",
			"iyun",
			"iyul",
			"avqust",
			"sentyabr",
			"oktyabr",
			"noyabr",
			"dekabr",
		];
		monthsShort = [
			"yan",
			"fev",
			"mar",
			"apr",
			"may",
			"iyn",
			"iyl",
			"avq",
			"sen",
			"okt",
			"noy",
			"dek",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("gecə", "gecə");
				case ((1, _)) ("gecə", "gecə");
				case ((2, _)) ("gecə", "gecə");
				case ((3, _)) ("gecə", "gecə");
				case ((4, _)) ("səhər", "səhər");
				case ((5, _)) ("səhər", "səhər");
				case ((6, _)) ("səhər", "səhər");
				case ((7, _)) ("səhər", "səhər");
				case ((8, _)) ("səhər", "səhər");
				case ((9, _)) ("səhər", "səhər");
				case ((10, _)) ("səhər", "səhər");
				case ((11, _)) ("səhər", "səhər");
				case ((12, _)) ("gündüz", "gündüz");
				case ((13, _)) ("gündüz", "gündüz");
				case ((14, _)) ("gündüz", "gündüz");
				case ((15, _)) ("gündüz", "gündüz");
				case ((16, _)) ("gündüz", "gündüz");
				case ((17, _)) ("axşam", "axşam");
				case ((18, _)) ("axşam", "axşam");
				case ((19, _)) ("axşam", "axşam");
				case ((20, _)) ("axşam", "axşam");
				case ((21, _)) ("axşam", "axşam");
				case ((22, _)) ("axşam", "axşam");
				case ((23, _)) ("axşam", "axşam");
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
