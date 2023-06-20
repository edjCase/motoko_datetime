import InternalTypes "../internal/Types";
import DateTime "DateTime";
import Data "../iana/Data";

module {
    public class IanaTimeZone(code : Text) : InternalTypes.DynamicTimeZone {
        public func getOffsetSeconds(dateTime : InternalTypes.Components) : Int {
            let a = Data.data[0];
            return 0; // TODO
        };
    };
};
