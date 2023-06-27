import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module VI {
	public let locale : Types.Locale = {
		id = "vi";
		weekdays = [
			"chủ nhật",
			"thứ hai",
			"thứ ba",
			"thứ tư",
			"thứ năm",
			"thứ sáu",
			"thứ bảy",
		];
		weekdaysShort = [
			"CN",
			"T2",
			"T3",
			"T4",
			"T5",
			"T6",
			"T7",
		];
		weekdaysMin = [
			"CN",
			"T2",
			"T3",
			"T4",
			"T5",
			"T6",
			"T7",
		];
		months = [
			"tháng 1",
			"tháng 2",
			"tháng 3",
			"tháng 4",
			"tháng 5",
			"tháng 6",
			"tháng 7",
			"tháng 8",
			"tháng 9",
			"tháng 10",
			"tháng 11",
			"tháng 12",
		];
		monthsShort = [
			"Thg 01",
			"Thg 02",
			"Thg 03",
			"Thg 04",
			"Thg 05",
			"Thg 06",
			"Thg 07",
			"Thg 08",
			"Thg 09",
			"Thg 10",
			"Thg 11",
			"Thg 12",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 4;
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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("sa", "SA");
				case ((1, _)) ("sa", "SA");
				case ((2, _)) ("sa", "SA");
				case ((3, _)) ("sa", "SA");
				case ((4, _)) ("sa", "SA");
				case ((5, _)) ("sa", "SA");
				case ((6, _)) ("sa", "SA");
				case ((7, _)) ("sa", "SA");
				case ((8, _)) ("sa", "SA");
				case ((9, _)) ("sa", "SA");
				case ((10, _)) ("sa", "SA");
				case ((11, _)) ("sa", "SA");
				case ((12, _)) ("ch", "CH");
				case ((13, _)) ("ch", "CH");
				case ((14, _)) ("ch", "CH");
				case ((15, _)) ("ch", "CH");
				case ((16, _)) ("ch", "CH");
				case ((17, _)) ("ch", "CH");
				case ((18, _)) ("ch", "CH");
				case ((19, _)) ("ch", "CH");
				case ((20, _)) ("ch", "CH");
				case ((21, _)) ("ch", "CH");
				case ((22, _)) ("ch", "CH");
				case ((23, _)) ("ch", "CH");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
