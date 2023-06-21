import Types "../Types";
module GMT_0 {
	public let region : Types.Region = {
		id = "GMT-0";
		timeZoneRules = [
			{
				abbreviation = "GMT";
				expiration = null;
				isDaylightsSavings = false;
				offsetSeconds = 0;
			},
		];
	};
};
