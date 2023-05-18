import InternalTypes "../internal/Types";
import DateTime "DateTime";

module {
    public class IanaTimeZone(code : Text) : InternalTypes.DynamicTimeZone {
        public func getOffsetSeconds(dateTime : InternalTypes.Components) : Int {
            return 0; // TODO
        };
    };
};
