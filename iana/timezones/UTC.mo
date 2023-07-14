import Types "../Types";
module UTC {
	public module UTC {
		public let data : Types.TimeZoneData = {
			id = "UTC";
			rules = [
				{
					abbreviation = "UTC";
					expiration = null;
					offsetSeconds = 0;
				},
			];
		};
	};
}
