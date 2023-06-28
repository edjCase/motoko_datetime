import Types "../Types";
module Greenwich {
	public module Greenwich {
		public let region : Types.Region = {
			id = "Greenwich";
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
