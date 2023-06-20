import InternalTypes "../internal/Types";
import DateTime "DateTime";
import IanaTypes = "../iana/Types";
import Text "mo:base/Text";
import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Components "Components";
import Iter "mo:base/Iter";
import Float "mo:base/Float";
import Prelude "mo:base/Prelude";
import IanaData "../iana/Data";

module {
    type Locale = IanaTypes.Locale;

    public class IanaTimeZone(code : Text) : InternalTypes.DynamicTimeZone {

        let ?locale : ?Locale = getLocale(code) else Debug.trap("Unknown IANA timezone code: " # code);

        public func toOffsetSeconds(dateTime : InternalTypes.Components) : Int {
            let ?utcTime = Components.toTime(dateTime) else Debug.trap("Invalid datetime components: " # debug_show (dateTime));
            let utcSeconds = utcTime / 1000000;
            label f for (data in Iter.fromArray(locale.data)) {
                switch (data.until) {
                    case (?u) {
                        if (utcSeconds > u) {
                            continue f;
                        };
                    };
                    case (null) {
                        // Skip
                    };
                };
                return -1 * Float.toInt(data.offset * 60.0);
            };
            Prelude.unreachable();
        };
    };

    private func getLocale(code : Text) : ?Locale {
        let parts = Text.split(code, #char('/'));
        var locales : [Locale] = IanaData.data;
        var locale : ?Locale = null;
        for (part in parts) {
            locale := Array.find<Locale>(locales, func(item) = item.id == part);
            switch (locale) {
                case (?l) {
                    locales := l.locales;
                };
                case (null) return null;
            };
        };
        return locale;
    };

};
