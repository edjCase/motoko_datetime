import Types "../Types";
module GMT {
	public let region : Types.Region = {
		id = "GMT";
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
