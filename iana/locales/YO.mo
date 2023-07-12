import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module YO {
	public let locale : Types.Locale = {
		id = "yo";
		weekdays = [
			"Àìkú",
			"Ajé",
			"Ìsẹ́gun",
			"Ọjọ́rú",
			"Ọjọ́bọ",
			"Ẹtì",
			"Àbámẹ́ta",
		];
		weekdaysShort = [
			"Àìk",
			"Ajé",
			"Ìsẹ́",
			"Ọjr",
			"Ọjb",
			"Ẹtì",
			"Àbá",
		];
		weekdaysMin = [
			"Àì",
			"Aj",
			"Ìs",
			"Ọr",
			"Ọb",
			"Ẹt",
			"Àb",
		];
		months = [
			"Sẹ́rẹ́",
			"Èrèlè",
			"Ẹrẹ̀nà",
			"Ìgbé",
			"Èbibi",
			"Òkùdu",
			"Agẹmo",
			"Ògún",
			"Owewe",
			"Ọ̀wàrà",
			"Bélú",
			"Ọ̀pẹ̀̀",
		];
		monthsShort = [
			"Sẹ́r",
			"Èrl",
			"Ẹrn",
			"Ìgb",
			"Èbi",
			"Òkù",
			"Agẹ",
			"Ògú",
			"Owe",
			"Ọ̀wà",
			"Bél",
			"Ọ̀pẹ̀̀",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
		timeFormat = "h:mm A";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "h:mm A DD/MM/YYYY";
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
