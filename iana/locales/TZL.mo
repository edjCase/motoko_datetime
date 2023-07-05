import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TZL {
	public let locale : Types.Locale = {
		id = "tzl";
		weekdays = [
			"Súladi",
			"Lúneçi",
			"Maitzi",
			"Márcuri",
			"Xhúadi",
			"Viénerçi",
			"Sáturi",
		];
		weekdaysShort = [
			"Súl",
			"Lún",
			"Mai",
			"Már",
			"Xhú",
			"Vié",
			"Sát",
		];
		weekdaysMin = [
			"Sú",
			"Lú",
			"Ma",
			"Má",
			"Xh",
			"Vi",
			"Sá",
		];
		months = [
			"Januar",
			"Fevraglh",
			"Març",
			"Avrïu",
			"Mai",
			"Gün",
			"Julia",
			"Guscht",
			"Setemvar",
			"Listopäts",
			"Noemvar",
			"Zecemvar",
		];
		monthsShort = [
			"Jan",
			"Fev",
			"Mar",
			"Avr",
			"Mai",
			"Gün",
			"Jul",
			"Gus",
			"Set",
			"Lis",
			"Noe",
			"Zec",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH.mm";
		dateFormat = "DD.MM.YYYY";
		dateTimeFormat = "HH.mm DD.MM.YYYY";
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
