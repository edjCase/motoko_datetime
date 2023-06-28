import Types "../Types";
module Universal {
	public module Universal {
		public let region : Types.Region = {
			id = "Universal";
			timeZoneRules = [
				{
					abbreviation = "UTC";
					expiration = null;
					offsetSeconds = 0;
				},
			];
		};
	};
}
