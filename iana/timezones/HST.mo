import Types "../Types";
module HST {
	public let locale : Types.Locale = {
		id = "HST";
		rules = [
			{
				abbreviation = "HST";
				expiration = null;
				isDaylightsSavings = false;
				offsetSeconds = -36000;
			},
		];
	};
};
