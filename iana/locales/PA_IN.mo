import Types "../Types";
module PA_IN {
	public let locale : Types.Locale = {
		id = "pa-in";
		weekdays = [
			"ਐਤਵਾਰ",
			"ਸੋਮਵਾਰ",
			"ਮੰਗਲਵਾਰ",
			"ਬੁਧਵਾਰ",
			"ਵੀਰਵਾਰ",
			"ਸ਼ੁੱਕਰਵਾਰ",
			"ਸ਼ਨੀਚਰਵਾਰ",
		];
		weekdaysShort = [
			"ਐਤ",
			"ਸੋਮ",
			"ਮੰਗਲ",
			"ਬੁਧ",
			"ਵੀਰ",
			"ਸ਼ੁਕਰ",
			"ਸ਼ਨੀ",
		];
		weekdaysMin = [
			"ਐਤ",
			"ਸੋਮ",
			"ਮੰਗਲ",
			"ਬੁਧ",
			"ਵੀਰ",
			"ਸ਼ੁਕਰ",
			"ਸ਼ਨੀ",
		];
		months = [
			"ਜਨਵਰੀ",
			"ਫ਼ਰਵਰੀ",
			"ਮਾਰਚ",
			"ਅਪ੍ਰੈਲ",
			"ਮਈ",
			"ਜੂਨ",
			"ਜੁਲਾਈ",
			"ਅਗਸਤ",
			"ਸਤੰਬਰ",
			"ਅਕਤੂਬਰ",
			"ਨਵੰਬਰ",
			"ਦਸੰਬਰ",
		];
		monthsShort = [
			"ਜਨਵਰੀ",
			"ਫ਼ਰਵਰੀ",
			"ਮਾਰਚ",
			"ਅਪ੍ਰੈਲ",
			"ਮਈ",
			"ਜੂਨ",
			"ਜੁਲਾਈ",
			"ਅਗਸਤ",
			"ਸਤੰਬਰ",
			"ਅਕਤੂਬਰ",
			"ਨਵੰਬਰ",
			"ਦਸੰਬਰ",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "A h:mm ਵਜੇ";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm ਵਜੇ DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("ਰਾਤ", "ਰਾਤ");
				case ((1, _)) ("ਰਾਤ", "ਰਾਤ");
				case ((2, _)) ("ਰਾਤ", "ਰਾਤ");
				case ((3, _)) ("ਰਾਤ", "ਰਾਤ");
				case ((4, _)) ("ਸਵੇਰ", "ਸਵੇਰ");
				case ((5, _)) ("ਸਵੇਰ", "ਸਵੇਰ");
				case ((6, _)) ("ਸਵੇਰ", "ਸਵੇਰ");
				case ((7, _)) ("ਸਵੇਰ", "ਸਵੇਰ");
				case ((8, _)) ("ਸਵੇਰ", "ਸਵੇਰ");
				case ((9, _)) ("ਸਵੇਰ", "ਸਵੇਰ");
				case ((10, _)) ("ਦੁਪਹਿਰ", "ਦੁਪਹਿਰ");
				case ((11, _)) ("ਦੁਪਹਿਰ", "ਦੁਪਹਿਰ");
				case ((12, _)) ("ਦੁਪਹਿਰ", "ਦੁਪਹਿਰ");
				case ((13, _)) ("ਦੁਪਹਿਰ", "ਦੁਪਹਿਰ");
				case ((14, _)) ("ਦੁਪਹਿਰ", "ਦੁਪਹਿਰ");
				case ((15, _)) ("ਦੁਪਹਿਰ", "ਦੁਪਹਿਰ");
				case ((16, _)) ("ਦੁਪਹਿਰ", "ਦੁਪਹਿਰ");
				case ((17, _)) ("ਸ਼ਾਮ", "ਸ਼ਾਮ");
				case ((18, _)) ("ਸ਼ਾਮ", "ਸ਼ਾਮ");
				case ((19, _)) ("ਸ਼ਾਮ", "ਸ਼ਾਮ");
				case ((20, _)) ("ਰਾਤ", "ਰਾਤ");
				case ((21, _)) ("ਰਾਤ", "ਰਾਤ");
				case ((22, _)) ("ਰਾਤ", "ਰਾਤ");
				case ((23, _)) ("ਰਾਤ", "ਰਾਤ");
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
