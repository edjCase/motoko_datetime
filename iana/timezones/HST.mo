import Types "../Types";
module HST {
	public let region : Types.Region = {
		id = "HST";
		timeZoneRules = [
			{
				abbreviation = "HST";
				expiration = null;
				isDaylightsSavings = false;
				offsetSeconds = -36000;
			},
		];
	};
};
