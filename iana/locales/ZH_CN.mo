import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module ZH_CN {
	public let locale : Types.Locale = {
		id = "zh-cn";
		weekdays = [
			"星期日",
			"星期一",
			"星期二",
			"星期三",
			"星期四",
			"星期五",
			"星期六",
		];
		weekdaysShort = [
			"周日",
			"周一",
			"周二",
			"周三",
			"周四",
			"周五",
			"周六",
		];
		weekdaysMin = [
			"日",
			"一",
			"二",
			"三",
			"四",
			"五",
			"六",
		];
		months = [
			"一月",
			"二月",
			"三月",
			"四月",
			"五月",
			"六月",
			"七月",
			"八月",
			"九月",
			"十月",
			"十一月",
			"十二月",
		];
		monthsShort = [
			"1月",
			"2月",
			"3月",
			"4月",
			"5月",
			"6月",
			"7月",
			"8月",
			"9月",
			"10月",
			"11月",
			"12月",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
		timeFormat = "HH:mm";
		dateFormat = "YYYY/MM/DD";
		dateTimeFormat = "HH:mm YYYY/MM/DD";
		longDateFormat = "YYYY/MM/DD";
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
