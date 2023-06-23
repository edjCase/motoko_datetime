import Types "../Types";
module BN_BD {
	public let locale : Types.Locale = {
		id = "bn-bd";
		weekdays = [
			"রবিবার",
			"সোমবার",
			"মঙ্গলবার",
			"বুধবার",
			"বৃহস্পতিবার",
			"শুক্রবার",
			"শনিবার",
		];
		weekdaysShort = [
			"রবি",
			"সোম",
			"মঙ্গল",
			"বুধ",
			"বৃহস্পতি",
			"শুক্র",
			"শনি",
		];
		weekdaysMin = [
			"রবি",
			"সোম",
			"মঙ্গল",
			"বুধ",
			"বৃহ",
			"শুক্র",
			"শনি",
		];
		months = [
			"জানুয়ারি",
			"ফেব্রুয়ারি",
			"মার্চ",
			"এপ্রিল",
			"মে",
			"জুন",
			"জুলাই",
			"আগস্ট",
			"সেপ্টেম্বর",
			"অক্টোবর",
			"নভেম্বর",
			"ডিসেম্বর",
		];
		monthsShort = [
			"জানু",
			"ফেব্রু",
			"মার্চ",
			"এপ্রিল",
			"মে",
			"জুন",
			"জুলাই",
			"আগস্ট",
			"সেপ্ট",
			"অক্টো",
			"নভে",
			"ডিসে",
		];
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "A h:mm সময়";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "A h:mm সময় DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("রাত", "রাত");
				case ((1, _)) ("রাত", "রাত");
				case ((2, _)) ("রাত", "রাত");
				case ((3, _)) ("রাত", "রাত");
				case ((4, _)) ("ভোর", "ভোর");
				case ((5, _)) ("ভোর", "ভোর");
				case ((6, _)) ("সকাল", "সকাল");
				case ((7, _)) ("সকাল", "সকাল");
				case ((8, _)) ("সকাল", "সকাল");
				case ((9, _)) ("সকাল", "সকাল");
				case ((10, _)) ("সকাল", "সকাল");
				case ((11, _)) ("সকাল", "সকাল");
				case ((12, _)) ("দুপুর", "দুপুর");
				case ((13, _)) ("দুপুর", "দুপুর");
				case ((14, _)) ("দুপুর", "দুপুর");
				case ((15, _)) ("বিকাল", "বিকাল");
				case ((16, _)) ("বিকাল", "বিকাল");
				case ((17, _)) ("বিকাল", "বিকাল");
				case ((18, _)) ("সন্ধ্যা", "সন্ধ্যা");
				case ((19, _)) ("সন্ধ্যা", "সন্ধ্যা");
				case ((20, _)) ("রাত", "রাত");
				case ((21, _)) ("রাত", "রাত");
				case ((22, _)) ("রাত", "রাত");
				case ((23, _)) ("রাত", "রাত");
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
