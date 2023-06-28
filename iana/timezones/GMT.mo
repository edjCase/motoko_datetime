import Types "../Types";
module GMT {
	public module GMT {
		public let region : Types.Region = {
			id = "GMT";
			timeZoneRules = [
				{
					abbreviation = "GMT";
					expiration = null;
					offsetSeconds = 0;
				},
			];
		};
	};
}
