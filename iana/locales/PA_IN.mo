import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module PA_IN {
	public let locale : Types.Locale = {
		id = "pa-in";
		weekdays = [
			"ਐਤਵਾਰ",
			"ਸੋਮਵਾਰ",
			"ਮੰਗਲਵਾਰ",
			"ਬੁਧਵਾਰ",
			"ਵੀਰਵਾਰ",
			"ਸ਼ੁੱਕਰਵਾਰ",
			"ਸ਼ਨੀਚਰਵਾਰ",
		];
		weekdaysShort = [
			"ਐਤ",
			"ਸੋਮ",
			"ਮੰਗਲ",
			"ਬੁਧ",
			"ਵੀਰ",
			"ਸ਼ੁਕਰ",
			"ਸ਼ਨੀ",
		];
		weekdaysMin = [
			"ਐਤ",
			"ਸੋਮ",
			"ਮੰਗਲ",
			"ਬੁਧ",
			"ਵੀਰ",
			"ਸ਼ੁਕਰ",
			"ਸ਼ਨੀ",
		];
		months = [
			"ਜਨਵਰੀ",
			"ਫ਼ਰਵਰੀ",
			"ਮਾਰਚ",
			"ਅਪ੍ਰੈਲ",
			"ਮਈ",
			"ਜੂਨ",
			"ਜੁਲਾਈ",
			"ਅਗਸਤ",
			"ਸਤੰਬਰ",
			"ਅਕਤੂਬਰ",
			"ਨਵੰਬਰ",
			"ਦਸੰਬਰ",
		];
		monthsShort = [
			"ਜਨਵਰੀ",
			"ਫ਼ਰਵਰੀ",
			"ਮਾਰਚ",
			"ਅਪ੍ਰੈਲ",
			"ਮਈ",
			"ਜੂਨ",
			"ਜੁਲਾਈ",
			"ਅਗਸਤ",
			"ਸਤੰਬਰ",
			"ਅਕਤੂਬਰ",
			"ਨਵੰਬਰ",
			"ਦਸੰਬਰ",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "A h:mm ਵਜੇ";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm ਵਜੇ DD/MM/YYYY";
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
