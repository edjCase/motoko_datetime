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
		firstDayOfWeek = 0;
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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("రాత్రి", "రాత్రి");
				case ((1, _)) ("రాత్రి", "రాత్రి");
				case ((2, _)) ("రాత్రి", "రాత్రి");
				case ((3, _)) ("రాత్రి", "రాత్రి");
				case ((4, _)) ("ఉదయం", "ఉదయం");
				case ((5, _)) ("ఉదయం", "ఉదయం");
				case ((6, _)) ("ఉదయం", "ఉదయం");
				case ((7, _)) ("ఉదయం", "ఉదయం");
				case ((8, _)) ("ఉదయం", "ఉదయం");
				case ((9, _)) ("ఉదయం", "ఉదయం");
				case ((10, _)) ("మధ్యాహ్నం", "మధ్యాహ్నం");
				case ((11, _)) ("మధ్యాహ్నం", "మధ్యాహ్నం");
				case ((12, _)) ("మధ్యాహ్నం", "మధ్యాహ్నం");
				case ((13, _)) ("మధ్యాహ్నం", "మధ్యాహ్నం");
				case ((14, _)) ("మధ్యాహ్నం", "మధ్యాహ్నం");
				case ((15, _)) ("మధ్యాహ్నం", "మధ్యాహ్నం");
				case ((16, _)) ("మధ్యాహ్నం", "మధ్యాహ్నం");
				case ((17, _)) ("సాయంత్రం", "సాయంత్రం");
				case ((18, _)) ("సాయంత్రం", "సాయంత్రం");
				case ((19, _)) ("సాయంత్రం", "సాయంత్రం");
				case ((20, _)) ("రాత్రి", "రాత్రి");
				case ((21, _)) ("రాత్రి", "రాత్రి");
				case ((22, _)) ("రాత్రి", "రాత్రి");
				case ((23, _)) ("రాత్రి", "రాత్రి");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
