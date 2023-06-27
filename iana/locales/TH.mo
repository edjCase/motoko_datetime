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
		firstDayOfWeek = 0;
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
		getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {
			let (lower, upper) : (Text, Text) = switch ((hour, minute)) {
				case ((0, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((1, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((2, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((3, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((4, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((5, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((6, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((7, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((8, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((9, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((10, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((11, _)) ("ก่อนเที่ยง", "ก่อนเที่ยง");
				case ((12, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((13, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((14, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((15, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((16, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((17, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((18, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((19, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((20, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((21, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((22, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case ((23, _)) ("หลังเที่ยง", "หลังเที่ยง");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
