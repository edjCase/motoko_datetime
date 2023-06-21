import Types "../Types";
module Universal {
	public let region : Types.Region = {
		id = "Universal";
		timeZoneRules = [
			{
				abbreviation = "UTC";
				expiration = null;
				isDaylightsSavings = false;
				offsetSeconds = 0;
			},
		];
	};
};
