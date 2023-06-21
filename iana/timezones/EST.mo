import Types "../Types";
module EST {
	public let region : Types.Region = {
		id = "EST";
		timeZoneRules = [
			{
				abbreviation = "EST";
				expiration = null;
				isDaylightsSavings = false;
				offsetSeconds = -18000;
			},
		];
	};
};
