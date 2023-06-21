import Types "../Types";
module UTC {
	public let region : Types.Region = {
		id = "UTC";
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
