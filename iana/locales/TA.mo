import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module TA {
	public let locale : Types.Locale = {
		id = "ta";
		weekdays = [
			"ஞாயிற்றுக்கிழமை",
			"திங்கட்கிழமை",
			"செவ்வாய்கிழமை",
			"புதன்கிழமை",
			"வியாழக்கிழமை",
			"வெள்ளிக்கிழமை",
			"சனிக்கிழமை",
		];
		weekdaysShort = [
			"ஞாயிறு",
			"திங்கள்",
			"செவ்வாய்",
			"புதன்",
			"வியாழன்",
			"வெள்ளி",
			"சனி",
		];
		weekdaysMin = [
			"ஞா",
			"தி",
			"செ",
			"பு",
			"வி",
			"வெ",
			"ச",
		];
		months = [
			"ஜனவரி",
			"பிப்ரவரி",
			"மார்ச்",
			"ஏப்ரல்",
			"மே",
			"ஜூன்",
			"ஜூலை",
			"ஆகஸ்ட்",
			"செப்டெம்பர்",
			"அக்டோபர்",
			"நவம்பர்",
			"டிசம்பர்",
		];
		monthsShort = [
			"ஜனவரி",
			"பிப்ரவரி",
			"மார்ச்",
			"ஏப்ரல்",
			"மே",
			"ஜூன்",
			"ஜூலை",
			"ஆகஸ்ட்",
			"செப்டெம்பர்",
			"அக்டோபர்",
			"நவம்பர்",
			"டிசம்பர்",
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
