import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module UZ_LATN {
	public let locale : Types.Locale = {
		id = "uz-latn";
		weekdays = [
			"Yakshanba",
			"Dushanba",
			"Seshanba",
			"Chorshanba",
			"Payshanba",
			"Juma",
			"Shanba",
		];
		weekdaysShort = [
			"Yak",
			"Dush",
			"Sesh",
			"Chor",
			"Pay",
			"Jum",
			"Shan",
		];
		weekdaysMin = [
			"Ya",
			"Du",
			"Se",
			"Cho",
			"Pa",
			"Ju",
			"Sha",
		];
		months = [
			"Yanvar",
			"Fevral",
			"Mart",
			"Aprel",
			"May",
			"Iyun",
			"Iyul",
			"Avgust",
			"Sentabr",
			"Oktabr",
			"Noyabr",
			"Dekabr",
		];
		monthsShort = [
			"Yan",
			"Fev",
			"Mar",
			"Apr",
			"May",
			"Iyun",
			"Iyul",
			"Avg",
			"Sen",
			"Okt",
			"Noy",
			"Dek",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
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
