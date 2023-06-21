import Types "../Types";
module Greenwich {
	public let locale : Types.Locale = {
		id = "Greenwich";
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
