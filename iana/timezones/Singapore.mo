import Types "../Types";
module Singapore {
	public let region : Types.Region = {
		id = "Singapore";
		timeZoneRules = [
			{
				abbreviation = "SMT";
				expiration = ?-2038200925000;
				isDaylightsSavings = false;
				offsetSeconds = 24925;
			},
			{
				abbreviation = "+07";
				expiration = ?-1167634800000;
				isDaylightsSavings = false;
				offsetSeconds = 25200;
			},
			{
				abbreviation = "+0720";
				expiration = ?-1073028000000;
				isDaylightsSavings = true;
				offsetSeconds = 26400;
			},
			{
				abbreviation = "+0720";
				expiration = ?-894180000000;
				isDaylightsSavings = false;
				offsetSeconds = 26400;
			},
			{
				abbreviation = "+0730";
				expiration = ?-879665400000;
				isDaylightsSavings = false;
				offsetSeconds = 27000;
			},
			{
				abbreviation = "+09";
				expiration = ?-767005200000;
				isDaylightsSavings = false;
				offsetSeconds = 32400;
			},
			{
				abbreviation = "+0730";
				expiration = ?378664200000;
				isDaylightsSavings = false;
				offsetSeconds = 27000;
			},
			{
				abbreviation = "+08";
				expiration = null;
				isDaylightsSavings = false;
				offsetSeconds = 28800;
			},
		];
	};
};
