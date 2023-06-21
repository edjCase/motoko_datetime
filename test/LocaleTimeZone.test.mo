import LocaleTimeZone "../src/LocaleTimeZone";
import { test } "mo:test";
import InternalTypes "../internal/Types";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
import America "../iana/timezones/America";
import Africa "../iana/timezones/Africa";

type DynamicTimeZone = InternalTypes.DynamicTimeZone;

let testCases = [
    {
        locale = America.New_York.locale;
        dateTime = {
            year = 2020;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            second = 0;
            nanosecond = 0;
        };
        expected = -18000;
    },
    {
        locale = Africa.Accra.locale;
        dateTime = {
            year = 1942;
            month = 12;
            day = 1;
            hour = 0;
            minute = 0;
            second = 0;
            nanosecond = 0;
        };
        expected = 1200;
    },
    {
        locale = America.Santiago.locale;
        dateTime = {
            year = 1910;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            second = 0;
            nanosecond = 0;
        };
        expected = -16966;
    },
];

test(
    "toOffsetSeconds",
    func() {
        for (testCase in Iter.fromArray(testCases)) {
            let dynamicTimeZone : DynamicTimeZone = LocaleTimeZone.LocaleTimeZone(testCase.locale);
            let dateTime = testCase.dateTime;
            let actual = dynamicTimeZone.toOffsetSeconds(dateTime);
            if (actual != testCase.expected) {
                Debug.print("toOffsetSeconds failed");
                Debug.print("Expected: " # debug_show (testCase.expected));
                Debug.print("Actual: " # debug_show (actual));
                assert false;
            };
        };
    },
);
