import Types "../Types";
import Prelude "mo:base/Prelude";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
module KA {
	public let locale : Types.Locale = {
		id = "ka";
		weekdays = [
			"კვირა",
			"ორშაბათი",
			"სამშაბათი",
			"ოთხშაბათი",
			"ხუთშაბათი",
			"პარასკევი",
			"შაბათი",
		];
		weekdaysShort = [
			"კვი",
			"ორშ",
			"სამ",
			"ოთხ",
			"ხუთ",
			"პარ",
			"შაბ",
		];
		weekdaysMin = [
			"კვ",
			"ორ",
			"სა",
			"ოთ",
			"ხუ",
			"პა",
			"შა",
		];
		months = [
			"იანვარი",
			"თებერვალი",
			"მარტი",
			"აპრილი",
			"მაისი",
			"ივნისი",
			"ივლისი",
			"აგვისტო",
			"სექტემბერი",
			"ოქტომბერი",
			"ნოემბერი",
			"დეკემბერი",
		];
		monthsShort = [
			"იან",
			"თებ",
			"მარ",
			"აპრ",
			"მაი",
			"ივნ",
			"ივლ",
			"აგვ",
			"სექ",
			"ოქტ",
			"ნოე",
			"დეკ",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
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
