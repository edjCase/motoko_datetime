import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TH {
	public let locale : Types.Locale = {
		id = "th";
		weekdays = [
			"อาทิตย์",
			"จันทร์",
			"อังคาร",
			"พุธ",
			"พฤหัสบดี",
			"ศุกร์",
			"เสาร์",
		];
		weekdaysShort = [
			"อาทิตย์",
			"จันทร์",
			"อังคาร",
			"พุธ",
			"พฤหัส",
			"ศุกร์",
			"เสาร์",
		];
		weekdaysMin = [
			"อา.",
			"จ.",
			"อ.",
			"พ.",
			"พฤ.",
			"ศ.",
			"ส.",
		];
		months = [
			"มกราคม",
			"กุมภาพันธ์",
			"มีนาคม",
			"เมษายน",
			"พฤษภาคม",
			"มิถุนายน",
			"กรกฎาคม",
			"สิงหาคม",
			"กันยายน",
			"ตุลาคม",
			"พฤศจิกายน",
			"ธันวาคม",
		];
		monthsShort = [
			"ม.ค.",
			"ก.พ.",
			"มี.ค.",
			"เม.ย.",
			"พ.ค.",
			"มิ.ย.",
			"ก.ค.",
			"ส.ค.",
			"ก.ย.",
			"ต.ค.",
			"พ.ย.",
			"ธ.ค.",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
		timeFormat = "H:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "H:mm DD/MM/YYYY";
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
