import Types "../Types";
module GMT0 {
	public let region : Types.Region = {
		id = "GMT0";
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
