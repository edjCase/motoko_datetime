import Types "../Types";
module Universal {
	public let locale : Types.Locale = {
		id = "Universal";
		rules = [
			{
				abbreviation = "UTC";
				expiration = null;
				isDaylightsSavings = false;
				offsetSeconds = 0;
			},
		];
	};
};
