import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TLH {
	public let locale : Types.Locale = {
		id = "tlh";
		weekdays = [
			"lojmItjaj",
			"DaSjaj",
			"povjaj",
			"ghItlhjaj",
			"loghjaj",
			"buqjaj",
			"ghInjaj",
		];
		weekdaysShort = [
			"lojmItjaj",
			"DaSjaj",
			"povjaj",
			"ghItlhjaj",
			"loghjaj",
			"buqjaj",
			"ghInjaj",
		];
		weekdaysMin = [
			"lojmItjaj",
			"DaSjaj",
			"povjaj",
			"ghItlhjaj",
			"loghjaj",
			"buqjaj",
			"ghInjaj",
		];
		months = [
			"tera’ jar wa’",
			"tera’ jar cha’",
			"tera’ jar wej",
			"tera’ jar loS",
			"tera’ jar vagh",
			"tera’ jar jav",
			"tera’ jar Soch",
			"tera’ jar chorgh",
			"tera’ jar Hut",
			"tera’ jar wa’maH",
			"tera’ jar wa’maH wa’",
			"tera’ jar wa’maH cha’",
		];
		monthsShort = [
			"jar wa’",
			"jar cha’",
			"jar wej",
			"jar loS",
			"jar vagh",
			"jar jav",
			"jar Soch",
			"jar chorgh",
			"jar Hut",
			"jar wa’maH",
			"jar wa’maH wa’",
			"jar wa’maH cha’",
		];
		firstDayOfWeek = #monday;
		firstDayOfYear = 4;
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
