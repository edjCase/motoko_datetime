import Types "../Types";
module Greenwich {
	public let region : Types.Region = {
		id = "Greenwich";
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
