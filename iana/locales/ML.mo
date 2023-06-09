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
		firstDayOfWeek = #sunday;
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
	};
};
