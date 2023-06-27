import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module KU {
	public let locale : Types.Locale = {
		id = "ku";
		weekdays = [
			"یه‌كشه‌ممه‌",
			"دووشه‌ممه‌",
			"سێشه‌ممه‌",
			"چوارشه‌ممه‌",
			"پێنجشه‌ممه‌",
			"هه‌ینی",
			"شه‌ممه‌",
		];
		weekdaysShort = [
			"یه‌كشه‌م",
			"دووشه‌م",
			"سێشه‌م",
			"چوارشه‌م",
			"پێنجشه‌م",
			"هه‌ینی",
			"شه‌ممه‌",
		];
		weekdaysMin = [
			"ی",
			"د",
			"س",
			"چ",
			"پ",
			"ه",
			"ش",
		];
		months = [
			"کانونی دووەم",
			"شوبات",
			"ئازار",
			"نیسان",
			"ئایار",
			"حوزەیران",
			"تەمموز",
			"ئاب",
			"ئەیلوول",
			"تشرینی یەكەم",
			"تشرینی دووەم",
			"كانونی یەکەم",
		];
		monthsShort = [
			"کانونی دووەم",
			"شوبات",
			"ئازار",
			"نیسان",
			"ئایار",
			"حوزەیران",
			"تەمموز",
			"ئاب",
			"ئەیلوول",
			"تشرینی یەكەم",
			"تشرینی دووەم",
			"كانونی یەکەم",
		];
		firstDayOfWeek = 6;
		firstDayOfYear = 12;
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
				case ((0, _)) ("به‌یانی", "به‌یانی");
				case ((1, _)) ("به‌یانی", "به‌یانی");
				case ((2, _)) ("به‌یانی", "به‌یانی");
				case ((3, _)) ("به‌یانی", "به‌یانی");
				case ((4, _)) ("به‌یانی", "به‌یانی");
				case ((5, _)) ("به‌یانی", "به‌یانی");
				case ((6, _)) ("به‌یانی", "به‌یانی");
				case ((7, _)) ("به‌یانی", "به‌یانی");
				case ((8, _)) ("به‌یانی", "به‌یانی");
				case ((9, _)) ("به‌یانی", "به‌یانی");
				case ((10, _)) ("به‌یانی", "به‌یانی");
				case ((11, _)) ("به‌یانی", "به‌یانی");
				case ((12, _)) ("ئێواره‌", "ئێواره‌");
				case ((13, _)) ("ئێواره‌", "ئێواره‌");
				case ((14, _)) ("ئێواره‌", "ئێواره‌");
				case ((15, _)) ("ئێواره‌", "ئێواره‌");
				case ((16, _)) ("ئێواره‌", "ئێواره‌");
				case ((17, _)) ("ئێواره‌", "ئێواره‌");
				case ((18, _)) ("ئێواره‌", "ئێواره‌");
				case ((19, _)) ("ئێواره‌", "ئێواره‌");
				case ((20, _)) ("ئێواره‌", "ئێواره‌");
				case ((21, _)) ("ئێواره‌", "ئێواره‌");
				case ((22, _)) ("ئێواره‌", "ئێواره‌");
				case ((23, _)) ("ئێواره‌", "ئێواره‌");
				case (_) Prelude.unreachable();
			};
			if (isLower) lower else upper;
		};
		getOrdinal = func (num : Nat) : Text {
			Prelude.unreachable();
		};
	};
};
