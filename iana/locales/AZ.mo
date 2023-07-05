import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module AZ {
	public let locale : Types.Locale = {
		id = "az";
		weekdays = [
			"Bazar",
			"Bazar ertəsi",
			"Çərşənbə axşamı",
			"Çərşənbə",
			"Cümə axşamı",
			"Cümə",
			"Şənbə",
		];
		weekdaysShort = [
			"Baz",
			"BzE",
			"ÇAx",
			"Çər",
			"CAx",
			"Cüm",
			"Şən",
		];
		weekdaysMin = [
			"Bz",
			"BE",
			"ÇA",
			"Çə",
			"CA",
			"Cü",
			"Şə",
		];
		months = [
			"yanvar",
			"fevral",
			"mart",
			"aprel",
			"may",
			"iyun",
			"iyul",
			"avqust",
			"sentyabr",
			"oktyabr",
			"noyabr",
			"dekabr",
		];
		monthsShort = [
			"yan",
			"fev",
			"mar",
			"apr",
			"may",
			"iyn",
			"iyl",
			"avq",
			"sen",
			"okt",
			"noy",
			"dek",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH:mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH:mm DD.MM.YYYY";
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
