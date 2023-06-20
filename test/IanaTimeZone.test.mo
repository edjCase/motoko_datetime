import IanaTimeZone "../src/IanaTimeZone";
import { test } "mo:test";
import InternalTypes "../internal/Types";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

type DynamicTimeZone = InternalTypes.DynamicTimeZone;

let testCases = [
    {
        id = "America/New_York";
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
        id = "Africa/Accra";
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
        id = "America/Santiago";
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
            let dynamicTimeZone : DynamicTimeZone = IanaTimeZone.IanaTimeZone(testCase.id);
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
