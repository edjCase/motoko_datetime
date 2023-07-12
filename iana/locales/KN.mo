import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
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
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "A h:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm DD/MM/YYYY";
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
