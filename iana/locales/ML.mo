import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module ML {
	public let locale : Types.Locale = {
		id = "ml";
		weekdays = [
			"ഞായറാഴ്ച",
			"തിങ്കളാഴ്ച",
			"ചൊവ്വാഴ്ച",
			"ബുധനാഴ്ച",
			"വ്യാഴാഴ്ച",
			"വെള്ളിയാഴ്ച",
			"ശനിയാഴ്ച",
		];
		weekdaysShort = [
			"ഞായർ",
			"തിങ്കൾ",
			"ചൊവ്വ",
			"ബുധൻ",
			"വ്യാഴം",
			"വെള്ളി",
			"ശനി",
		];
		weekdaysMin = [
			"ഞാ",
			"തി",
			"ചൊ",
			"ബു",
			"വ്യാ",
			"വെ",
			"ശ",
		];
		months = [
			"ജനുവരി",
			"ഫെബ്രുവരി",
			"മാർച്ച്",
			"ഏപ്രിൽ",
			"മേയ്",
			"ജൂൺ",
			"ജൂലൈ",
			"ഓഗസ്റ്റ്",
			"സെപ്റ്റംബർ",
			"ഒക്ടോബർ",
			"നവംബർ",
			"ഡിസംബർ",
		];
		monthsShort = [
			"ജനു.",
			"ഫെബ്രു.",
			"മാർ.",
			"ഏപ്രി.",
			"മേയ്",
			"ജൂൺ",
			"ജൂലൈ.",
			"ഓഗ.",
			"സെപ്റ്റ.",
			"ഒക്ടോ.",
			"നവം.",
			"ഡിസം.",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "A h:mm -നു";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm -നു DD/MM/YYYY";
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
				case ((0, _)) ("രാത്രി", "രാത്രി");
				case ((1, _)) ("രാത്രി", "രാത്രി");
				case ((2, _)) ("രാത്രി", "രാത്രി");
				case ((3, _)) ("രാത്രി", "രാത്രി");
				case ((4, _)) ("രാവിലെ", "രാവിലെ");
				case ((5, _)) ("രാവിലെ", "രാവിലെ");
				case ((6, _)) ("രാവിലെ", "രാവിലെ");
				case ((7, _)) ("രാവിലെ", "രാവിലെ");
				case ((8, _)) ("രാവിലെ", "രാവിലെ");
				case ((9, _)) ("രാവിലെ", "രാവിലെ");
				case ((10, _)) ("രാവിലെ", "രാവിലെ");
				case ((11, _)) ("രാവിലെ", "രാവിലെ");
				case ((12, _)) ("ഉച്ച കഴിഞ്ഞ്", "ഉച്ച കഴിഞ്ഞ്");
				case ((13, _)) ("ഉച്ച കഴിഞ്ഞ്", "ഉച്ച കഴിഞ്ഞ്");
				case ((14, _)) ("ഉച്ച കഴിഞ്ഞ്", "ഉച്ച കഴിഞ്ഞ്");
				case ((15, _)) ("ഉച്ച കഴിഞ്ഞ്", "ഉച്ച കഴിഞ്ഞ്");
				case ((16, _)) ("ഉച്ച കഴിഞ്ഞ്", "ഉച്ച കഴിഞ്ഞ്");
				case ((17, _)) ("വൈകുന്നേരം", "വൈകുന്നേരം");
				case ((18, _)) ("വൈകുന്നേരം", "വൈകുന്നേരം");
				case ((19, _)) ("വൈകുന്നേരം", "വൈകുന്നേരം");
				case ((20, _)) ("രാത്രി", "രാത്രി");
				case ((21, _)) ("രാത്രി", "രാത്രി");
				case ((22, _)) ("രാത്രി", "രാത്രി");
				case ((23, _)) ("രാത്രി", "രാത്രി");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
