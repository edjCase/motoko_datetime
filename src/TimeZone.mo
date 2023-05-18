import InternalTypes "../internal/Types";
module {

    public type TimeZone = InternalTypes.TimeZone;
    public type Offset = InternalTypes.FixedTimeZone;

    public func utc() : TimeZone {
        return #fixed(#seconds(0));
    };

    public func withFixedOffset(offset: Offset) : TimeZone {
        return #fixed(offset);
    };

    public func fromDescriptor(descriptor: Text) : TimeZone {
        if(descriptor == "Z") {
            utc()
        } else {
            // TODO
            utc();
        }
    }
}