import Types "../Types";
module UTC {
	public module UTC {
		public let region : Types.Region = {
			id = "UTC";
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
