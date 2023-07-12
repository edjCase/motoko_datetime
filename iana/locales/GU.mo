import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module GU {
	public let locale : Types.Locale = {
		id = "gu";
		weekdays = [
			"રવિવાર",
			"સોમવાર",
			"મંગળવાર",
			"બુધ્વાર",
			"ગુરુવાર",
			"શુક્રવાર",
			"શનિવાર",
		];
		weekdaysShort = [
			"રવિ",
			"સોમ",
			"મંગળ",
			"બુધ્",
			"ગુરુ",
			"શુક્ર",
			"શનિ",
		];
		weekdaysMin = [
			"ર",
			"સો",
			"મં",
			"બુ",
			"ગુ",
			"શુ",
			"શ",
		];
		months = [
			"જાન્યુઆરી",
			"ફેબ્રુઆરી",
			"માર્ચ",
			"એપ્રિલ",
			"મે",
			"જૂન",
			"જુલાઈ",
			"ઑગસ્ટ",
			"સપ્ટેમ્બર",
			"ઑક્ટ્બર",
			"નવેમ્બર",
			"ડિસેમ્બર",
		];
		monthsShort = [
			"જાન્યુ.",
			"ફેબ્રુ.",
			"માર્ચ",
			"એપ્રિ.",
			"મે",
			"જૂન",
			"જુલા.",
			"ઑગ.",
			"સપ્ટે.",
			"ઑક્ટ્.",
			"નવે.",
			"ડિસે.",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "A h:mm વાગ્યે";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm વાગ્યે DD/MM/YYYY";
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
