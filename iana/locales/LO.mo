import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module LO {
	public let locale : Types.Locale = {
		id = "lo";
		weekdays = [
			"ອາທິດ",
			"ຈັນ",
			"ອັງຄານ",
			"ພຸດ",
			"ພະຫັດ",
			"ສຸກ",
			"ເສົາ",
		];
		weekdaysShort = [
			"ທິດ",
			"ຈັນ",
			"ອັງຄານ",
			"ພຸດ",
			"ພະຫັດ",
			"ສຸກ",
			"ເສົາ",
		];
		weekdaysMin = [
			"ທ",
			"ຈ",
			"ອຄ",
			"ພ",
			"ພຫ",
			"ສກ",
			"ສ",
		];
		months = [
			"ມັງກອນ",
			"ກຸມພາ",
			"ມີນາ",
			"ເມສາ",
			"ພຶດສະພາ",
			"ມິຖຸນາ",
			"ກໍລະກົດ",
			"ສິງຫາ",
			"ກັນຍາ",
			"ຕຸລາ",
			"ພະຈິກ",
			"ທັນວາ",
		];
		monthsShort = [
			"ມັງກອນ",
			"ກຸມພາ",
			"ມີນາ",
			"ເມສາ",
			"ພຶດສະພາ",
			"ມິຖຸນາ",
			"ກໍລະກົດ",
			"ສິງຫາ",
			"ກັນຍາ",
			"ຕຸລາ",
			"ພະຈິກ",
			"ທັນວາ",
		];
		firstDayOfWeek = #sunday;
		firstDayOfYear = 6;
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
