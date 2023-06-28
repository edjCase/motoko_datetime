import Types "../Types";
module Iceland {
	public module Iceland {
		public let region : Types.Region = {
			id = "Iceland";
			timeZoneRules = [
				{
					abbreviation = "LMT";
					expiration = ?-1830383032000;
					offsetSeconds = -968;
				},
				{
					abbreviation = "GMT";
					expiration = null;
					offsetSeconds = 0;
				},
			];
		};
	};
}
