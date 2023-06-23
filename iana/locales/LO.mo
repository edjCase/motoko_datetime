import Types "../Types";
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
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((1, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((2, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((3, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((4, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((5, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((6, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((7, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((8, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((9, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((10, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((11, _)) ("ຕອນເຊົ້າ", "ຕອນເຊົ້າ");
				case ((12, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((13, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((14, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((15, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((16, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((17, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((18, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((19, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((20, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((21, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((22, _)) ("ຕອນແລງ", "ຕອນແລງ");
				case ((23, _)) ("ຕອນແລງ", "ຕອນແລງ");
			};
			if (isLower) lower else upper;
		};
		eras = [
			{
				start = -62135568422000000;
				end = null;
				offset = 1;
				fullName = "Anno Domini";
				narrowName = "AD";
				abbreviatedName = "AD";
			},
			{
				start = null;
				end = -62135654822000000;
				offset = 1;
				fullName = "Before Christ";
				narrowName = "BC";
				abbreviatedName = "BC";
			},
		];
	};
};
