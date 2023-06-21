import Types "../Types";
module GMT_0 {
	public let locale : Types.Locale = {
		id = "GMT-0";
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
