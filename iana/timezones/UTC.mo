import Types "../Types";
module UTC {
	public let locale : Types.Locale = {
		id = "UTC";
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
