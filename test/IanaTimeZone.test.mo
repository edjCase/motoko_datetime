import IanaTimeZone "../src/IanaTimeZone";
import { test } "mo:test";
import InternalTypes "../internal/Types";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
import America "../iana/timezones/America";
import Africa "../iana/timezones/Africa";

type DynamicTimeZone = InternalTypes.DynamicTimeZone;

let testCases = [
    {
        data = America.New_York.data;
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
        data = Africa.Accra.data;
        dateTime = {
            year = 1911;
            month = 12;
            day = 1;
            hour = 0;
            minute = 0;
            second = 0;
            nanosecond = 0;
        };
        expected = -968;
    },
    {
        data = America.Santiago.data;
        dateTime = {
            year = 1910;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            second = 0;
            nanosecond = 0;
        };
        expected = -16965;
    },
];

test(
    "toOffsetSeconds",
    func() {
        for (testCase in Iter.fromArray(testCases)) {
            let dynamicTimeZone : DynamicTimeZone = IanaTimeZone.IanaTimeZone(testCase.data);
            let dateTime = testCase.dateTime;
            let actual = dynamicTimeZone.toOffsetSeconds(dateTime);
            if (actual != testCase.expected) {
                Debug.print("toOffsetSeconds failed for data: " # debug_show (testCase.data) # " and dateTime: " # debug_show (dateTime));
                Debug.print("Expected: " # debug_show (testCase.expected));
                Debug.print("Actual: " # debug_show (actual));
                assert false;
            };
        };
    },
);
