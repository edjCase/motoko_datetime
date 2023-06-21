import Types "../Types";
module UCT {
	public let region : Types.Region = {
		id = "UCT";
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
