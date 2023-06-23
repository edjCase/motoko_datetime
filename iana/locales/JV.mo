import Types "../Types";
module JV {
	public let locale : Types.Locale = {
		id = "jv";
		weekdays = [
			"Minggu",
			"Senen",
			"Seloso",
			"Rebu",
			"Kemis",
			"Jemuwah",
			"Septu",
		];
		weekdaysShort = [
			"Min",
			"Sen",
			"Sel",
			"Reb",
			"Kem",
			"Jem",
			"Sep",
		];
		weekdaysMin = [
			"Mg",
			"Sn",
			"Sl",
			"Rb",
			"Km",
			"Jm",
			"Sp",
		];
		months = [
			"Januari",
			"Februari",
			"Maret",
			"April",
			"Mei",
			"Juni",
			"Juli",
			"Agustus",
			"September",
			"Oktober",
			"Nopember",
			"Desember",
		];
		monthsShort = [
			"Jan",
			"Feb",
			"Mar",
			"Apr",
			"Mei",
			"Jun",
			"Jul",
			"Ags",
			"Sep",
			"Okt",
			"Nop",
			"Des",
		];
		firstDayOfWeek = 1;
		firstDayOfYear = 7;
		timeFormat = "HH.mm";
		dateFormat = "DD/MM/YYYY";
		dateTimeFormat = "HH.mm DD/MM/YYYY";
		longDateFormat = "DD/MM/YYYY";
		meridiems = func (hour : Nat, minute : Nat, isLower : Bool) : Bool {
			let (lower, upper) = switch ((hour, minute)) {
				case ((0, _)) ("enjing", "enjing");
				case ((1, _)) ("enjing", "enjing");
				case ((2, _)) ("enjing", "enjing");
				case ((3, _)) ("enjing", "enjing");
				case ((4, _)) ("enjing", "enjing");
				case ((5, _)) ("enjing", "enjing");
				case ((6, _)) ("enjing", "enjing");
				case ((7, _)) ("enjing", "enjing");
				case ((8, _)) ("enjing", "enjing");
				case ((9, _)) ("enjing", "enjing");
				case ((10, _)) ("enjing", "enjing");
				case ((11, _)) ("siyang", "siyang");
				case ((12, _)) ("siyang", "siyang");
				case ((13, _)) ("siyang", "siyang");
				case ((14, _)) ("siyang", "siyang");
				case ((15, _)) ("sonten", "sonten");
				case ((16, _)) ("sonten", "sonten");
				case ((17, _)) ("sonten", "sonten");
				case ((18, _)) ("sonten", "sonten");
				case ((19, _)) ("ndalu", "ndalu");
				case ((20, _)) ("ndalu", "ndalu");
				case ((21, _)) ("ndalu", "ndalu");
				case ((22, _)) ("ndalu", "ndalu");
				case ((23, _)) ("ndalu", "ndalu");
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
