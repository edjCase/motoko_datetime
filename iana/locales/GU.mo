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
		firstDayOfWeek = 0;
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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("રાત", "રાત");
				case ((1, _)) ("રાત", "રાત");
				case ((2, _)) ("રાત", "રાત");
				case ((3, _)) ("રાત", "રાત");
				case ((4, _)) ("સવાર", "સવાર");
				case ((5, _)) ("સવાર", "સવાર");
				case ((6, _)) ("સવાર", "સવાર");
				case ((7, _)) ("સવાર", "સવાર");
				case ((8, _)) ("સવાર", "સવાર");
				case ((9, _)) ("સવાર", "સવાર");
				case ((10, _)) ("બપોર", "બપોર");
				case ((11, _)) ("બપોર", "બપોર");
				case ((12, _)) ("બપોર", "બપોર");
				case ((13, _)) ("બપોર", "બપોર");
				case ((14, _)) ("બપોર", "બપોર");
				case ((15, _)) ("બપોર", "બપોર");
				case ((16, _)) ("બપોર", "બપોર");
				case ((17, _)) ("સાંજ", "સાંજ");
				case ((18, _)) ("સાંજ", "સાંજ");
				case ((19, _)) ("સાંજ", "સાંજ");
				case ((20, _)) ("રાત", "રાત");
				case ((21, _)) ("રાત", "રાત");
				case ((22, _)) ("રાત", "રાત");
				case ((23, _)) ("રાત", "રાત");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
