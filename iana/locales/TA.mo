import Types "../Types";
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
		firstDayOfWeek = 0;
		firstDayOfYear = 6;
		timeFormat = "HH:mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH:mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) (" யாமம்", " யாமம்");
				case ((1, _)) (" யாமம்", " யாமம்");
				case ((2, _)) (" வைகறை", " வைகறை");
				case ((3, _)) (" வைகறை", " வைகறை");
				case ((4, _)) (" வைகறை", " வைகறை");
				case ((5, _)) (" வைகறை", " வைகறை");
				case ((6, _)) (" காலை", " காலை");
				case ((7, _)) (" காலை", " காலை");
				case ((8, _)) (" காலை", " காலை");
				case ((9, _)) (" காலை", " காலை");
				case ((10, _)) (" நண்பகல்", " நண்பகல்");
				case ((11, _)) (" நண்பகல்", " நண்பகல்");
				case ((12, _)) (" நண்பகல்", " நண்பகல்");
				case ((13, _)) (" நண்பகல்", " நண்பகல்");
				case ((14, _)) (" எற்பாடு", " எற்பாடு");
				case ((15, _)) (" எற்பாடு", " எற்பாடு");
				case ((16, _)) (" எற்பாடு", " எற்பாடு");
				case ((17, _)) (" எற்பாடு", " எற்பாடு");
				case ((18, _)) (" மாலை", " மாலை");
				case ((19, _)) (" மாலை", " மாலை");
				case ((20, _)) (" மாலை", " மாலை");
				case ((21, _)) (" மாலை", " மாலை");
				case ((22, _)) (" யாமம்", " யாமம்");
				case ((23, _)) (" யாமம்", " யாமம்");
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
