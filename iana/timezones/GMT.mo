import Types "../Types";
module GMT {
	public let locale : Types.Locale = {
		id = "GMT";
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
