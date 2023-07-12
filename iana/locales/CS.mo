import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module CS {
	public let locale : Types.Locale = {
		id = "cs";
		weekdays = [
			"neděle",
			"pondělí",
			"úterý",
			"středa",
			"čtvrtek",
			"pátek",
			"sobota",
		];
		weekdaysShort = [
			"ne",
			"po",
			"út",
			"st",
			"čt",
			"pá",
			"so",
		];
		weekdaysMin = [
			"ne",
			"po",
			"út",
			"st",
			"čt",
			"pá",
			"so",
		];
		months = [
			"ledna",
			"února",
			"března",
			"dubna",
			"května",
			"června",
			"července",
			"srpna",
			"září",
			"října",
			"listopadu",
			"prosince",
		];
		monthsShort = [
			"led",
			"úno",
			"bře",
			"dub",
			"kvě",
			"čvn",
			"čvc",
			"srp",
			"zář",
			"říj",
			"lis",
			"pro",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
		timeFormat = "H:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "H:mm DD.MM.YYYY";
		longDateFormat = "DD.MM.YYYY";
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
