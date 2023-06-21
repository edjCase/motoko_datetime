import Types "../Types";
module GMT0 {
	public let locale : Types.Locale = {
		id = "GMT0";
		rules = [
			{
				abbreviation = "GMT";
				expiration = null;
				isDaylightsSavings = false;
				offsetSeconds = 0;
			},
		];
	};
};
