import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module BN {
	public let locale : Types.Locale = {
		id = "bn";
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
