import Types "../Types";
module KN {
	public let locale : Types.Locale = {
		id = "kn";
		weekdays = [
			"ಭಾನುವಾರ",
			"ಸೋಮವಾರ",
			"ಮಂಗಳವಾರ",
			"ಬುಧವಾರ",
			"ಗುರುವಾರ",
			"ಶುಕ್ರವಾರ",
			"ಶನಿವಾರ",
		];
		weekdaysShort = [
			"ಭಾನು",
			"ಸೋಮ",
			"ಮಂಗಳ",
			"ಬುಧ",
			"ಗುರು",
			"ಶುಕ್ರ",
			"ಶನಿ",
		];
		weekdaysMin = [
			"ಭಾ",
			"ಸೋ",
			"ಮಂ",
			"ಬು",
			"ಗು",
			"ಶು",
			"ಶ",
		];
		months = [
			"ಜನವರಿ",
			"ಫೆಬ್ರವರಿ",
			"ಮಾರ್ಚ್",
			"ಏಪ್ರಿಲ್",
			"ಮೇ",
			"ಜೂನ್",
			"ಜುಲೈ",
			"ಆಗಸ್ಟ್",
			"ಸೆಪ್ಟೆಂಬರ್",
			"ಅಕ್ಟೋಬರ್",
			"ನವೆಂಬರ್",
			"ಡಿಸೆಂಬರ್",
		];
		monthsShort = [
			"ಜನ",
			"ಫೆಬ್ರ",
			"ಮಾರ್ಚ್",
			"ಏಪ್ರಿಲ್",
			"ಮೇ",
			"ಜೂನ್",
			"ಜುಲೈ",
			"ಆಗಸ್ಟ್",
			"ಸೆಪ್ಟೆಂ",
			"ಅಕ್ಟೋ",
			"ನವೆಂ",
			"ಡಿಸೆಂ",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "A h:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("ರಾತ್ರಿ", "ರಾತ್ರಿ");
				case ((1, _)) ("ರಾತ್ರಿ", "ರಾತ್ರಿ");
				case ((2, _)) ("ರಾತ್ರಿ", "ರಾತ್ರಿ");
				case ((3, _)) ("ರಾತ್ರಿ", "ರಾತ್ರಿ");
				case ((4, _)) ("ಬೆಳಿಗ್ಗೆ", "ಬೆಳಿಗ್ಗೆ");
				case ((5, _)) ("ಬೆಳಿಗ್ಗೆ", "ಬೆಳಿಗ್ಗೆ");
				case ((6, _)) ("ಬೆಳಿಗ್ಗೆ", "ಬೆಳಿಗ್ಗೆ");
				case ((7, _)) ("ಬೆಳಿಗ್ಗೆ", "ಬೆಳಿಗ್ಗೆ");
				case ((8, _)) ("ಬೆಳಿಗ್ಗೆ", "ಬೆಳಿಗ್ಗೆ");
				case ((9, _)) ("ಬೆಳಿಗ್ಗೆ", "ಬೆಳಿಗ್ಗೆ");
				case ((10, _)) ("ಮಧ್ಯಾಹ್ನ", "ಮಧ್ಯಾಹ್ನ");
				case ((11, _)) ("ಮಧ್ಯಾಹ್ನ", "ಮಧ್ಯಾಹ್ನ");
				case ((12, _)) ("ಮಧ್ಯಾಹ್ನ", "ಮಧ್ಯಾಹ್ನ");
				case ((13, _)) ("ಮಧ್ಯಾಹ್ನ", "ಮಧ್ಯಾಹ್ನ");
				case ((14, _)) ("ಮಧ್ಯಾಹ್ನ", "ಮಧ್ಯಾಹ್ನ");
				case ((15, _)) ("ಮಧ್ಯಾಹ್ನ", "ಮಧ್ಯಾಹ್ನ");
				case ((16, _)) ("ಮಧ್ಯಾಹ್ನ", "ಮಧ್ಯಾಹ್ನ");
				case ((17, _)) ("ಸಂಜೆ", "ಸಂಜೆ");
				case ((18, _)) ("ಸಂಜೆ", "ಸಂಜೆ");
				case ((19, _)) ("ಸಂಜೆ", "ಸಂಜೆ");
				case ((20, _)) ("ರಾತ್ರಿ", "ರಾತ್ರಿ");
				case ((21, _)) ("ರಾತ್ರಿ", "ರಾತ್ರಿ");
				case ((22, _)) ("ರಾತ್ರಿ", "ರಾತ್ರಿ");
				case ((23, _)) ("ರಾತ್ರಿ", "ರಾತ್ರಿ");
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
