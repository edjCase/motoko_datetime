import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TE {
	public let locale : Types.Locale = {
		id = "te";
		weekdays = [
			"ఆదివారం",
			"సోమవారం",
			"మంగళవారం",
			"బుధవారం",
			"గురువారం",
			"శుక్రవారం",
			"శనివారం",
		];
		weekdaysShort = [
			"ఆది",
			"సోమ",
			"మంగళ",
			"బుధ",
			"గురు",
			"శుక్ర",
			"శని",
		];
		weekdaysMin = [
			"ఆ",
			"సో",
			"మం",
			"బు",
			"గు",
			"శు",
			"శ",
		];
		months = [
			"జనవరి",
			"ఫిబ్రవరి",
			"మార్చి",
			"ఏప్రిల్",
			"మే",
			"జూన్",
			"జులై",
			"ఆగస్టు",
			"సెప్టెంబర్",
			"అక్టోబర్",
			"నవంబర్",
			"డిసెంబర్",
		];
		monthsShort = [
			"జన.",
			"ఫిబ్ర.",
			"మార్చి",
			"ఏప్రి.",
			"మే",
			"జూన్",
			"జులై",
			"ఆగ.",
			"సెప్.",
			"అక్టో.",
			"నవ.",
			"డిసె.",
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
