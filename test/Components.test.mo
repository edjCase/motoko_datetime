import Iter "mo:base/Iter";
import { test } "mo:test";
import DateTime "../src/DateTime";
import Components "../src/Components";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Types "../internal/Types";
import Time "mo:base/Time";
import TimeZone "../src/TimeZone";
import EN "../iana/locales/EN";
import JA "../iana/locales/JA";

test(
    "epoch",
    func() {
        let expected : Components.Components = {
            year = 1970;
            month = 1;
            day = 1;
            hour = 0;
            minute = 0;
            nanosecond = 0;
        };
        let actual = Components.epoch;
        assert (expected == actual);
    },
);

test(
    "compare",
    func() {
        let testCases = [
            {
                c1 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                c2 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                order = #equal;
            },
            {
                c1 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                c2 = {
                    year = 1970;
                    month = 2;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                order = #less;
            },
            {
                c1 = {
                    year = 1970;
                    month = 2;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                c2 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                order = #greater;
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual = Components.compare(testCase.c1, testCase.c2);
            assert (testCase.order == actual);
        };
    },
);

test(
    "toTime and fromTime",
    func() {
        let testCases = [
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                expected = 0;
            },
            {
                components = {
                    year = 1990;
                    month = 11;
                    day = 12;
                    hour = 4;
                    minute = 2;
                    nanosecond = 12345;
                };
                expected = 658_382_520_000_012_345;
            },
            {
                components = {
                    year = -10;
                    month = 3;
                    day = 4;
                    hour = 4;
                    minute = 1;
                    nanosecond = 2;
                };
                expected = -62_477_380_739_999_999_998;
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual : Time.Time = Components.toTime(testCase.components);
            let matched = testCase.expected == actual;
            if (not matched) {
                Debug.print("Expected: " # debug_show (testCase.expected));
                Debug.print("Actual:   " # debug_show (actual));
                assert false;
            };
            let actualComponents = Components.fromTime(actual);
            let matched2 = testCase.components == actualComponents;

            if (not matched2) {
                Debug.print("Expected: " # debug_show (testCase.components));
                Debug.print("Actual:   " # debug_show (actualComponents));
                assert false;
            };
        };
    },
);

test(
    "isValid",
    func() {
        let testCases = [
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = true;
            },
            {
                components = {
                    year = 1970;
                    month = 2;
                    day = 28;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = true;
            },
            {
                components = {
                    year = 1970;
                    month = 2;
                    day = 29; // Invalid day
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = false;
            },
            {
                components = {
                    year = 2000;
                    month = 2;
                    day = 29; // Leap Day
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = true;
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 23;
                    minute = 59;
                    nanosecond = 59_999_999_999;
                };
                isValid = true;
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 24; // Invalid hour
                    minute = 59;
                    nanosecond = 59_999_999_999;
                };
                isValid = false;
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 23;
                    minute = 60; // Invalid minute
                    nanosecond = 59_999_999_999;
                };
                isValid = false;
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 23;
                    minute = 59;
                    nanosecond = 60_000_000_000; // Invalid nanosecond
                };
                isValid = false;
            },
            {
                components = {
                    year = -1000;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = true;
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual : Bool = Components.isValid(testCase.components);
            let matched = testCase.isValid == actual;
            if (not matched) {
                Debug.print("Components: " # debug_show (testCase.components));
                Debug.print("Expected: " # debug_show (testCase.isValid));
                Debug.print("Actual:   " # debug_show (actual));
                assert false;
            };
        };
    },
);

test(
    "getOffsetSeconds",
    func() {
        let testCases = [
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = true;
            },
            {
                components = {
                    year = 1970;
                    month = 2;
                    day = 28;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = true;
            },
            {
                components = {
                    year = 1970;
                    month = 2;
                    day = 29; // Invalid day
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = false;
            },
            {
                components = {
                    year = 2000;
                    month = 2;
                    day = 29; // Leap Day
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = true;
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 23;
                    minute = 59;
                    nanosecond = 59_999_999_999;
                };
                isValid = true;
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 24; // Invalid hour
                    minute = 59;
                    nanosecond = 59_999_999_999;
                };
                isValid = false;
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 23;
                    minute = 60; // Invalid minute
                    nanosecond = 59_999_999_999;
                };
                isValid = false;
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 23;
                    minute = 59;
                    nanosecond = 60_000_000_000; // Invalid nanosecond
                };
                isValid = false;
            },
            {
                components = {
                    year = -1000;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                isValid = true;
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual : Bool = Components.isValid(testCase.components);
            let matched = testCase.isValid == actual;
            if (not matched) {
                Debug.print("Components: " # debug_show (testCase.components));
                Debug.print("Expected: " # debug_show (testCase.isValid));
                Debug.print("Actual:   " # debug_show (actual));
                assert false;
            };
        };
    },
);

func assertText(expected : Text, actual : Text) {
    if (expected != actual) {
        Debug.print("Expected: " # debug_show (expected));
        Debug.print("Actual:   " # debug_show (actual));
        assert false;
    };
};

test(
    "toTextFormatted and fromTextFormatted",
    func() {
        let testCases = [
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                timeZone = #fixed(#seconds(0));
                expected = [
                    (#iso8601, "1970-01-01T00:00:00.000000000Z"),
                    (#custom({ format = "D/M/YYYY, HH:mm:ss Z"; locale = EN.locale }), "1/1/1970, 00:00:00 +00:00"),
                ];
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                timeZone = #fixed(#seconds(-25_320));
                expected = [
                    (#iso8601, "1970-01-01T00:00:00.000000000-07:02"),
                    (#custom({ format = "D/M/YYYY, HH:mm:ss Z"; locale = JA.locale }), "1/1/1970, 00:00:00 -07:02"),
                ];
            },
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                timeZone = #fixed(#seconds(-25_321));
                expected = [
                    (#iso8601, "1970-01-01T00:00:00.000000000-07:02:01"),
                    (#custom({ format = "D/M/YYYY, HH:mm:ss Z"; locale = EN.locale }), "1/1/1970, 00:00:00 -07:02:01"),
                ];
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            for ((format, expectedText) in Iter.fromArray(testCase.expected)) {
                let actual : Text = Components.toTextFormatted(testCase.components, testCase.timeZone, format);
                assertText(expectedText, actual);

                let fromTextResult = Components.fromTextFormatted(expectedText, format);
                switch (fromTextResult) {
                    case (null) {
                        let formatName = switch (format) {
                            case (#iso8601) "ISO";
                            case (#custom({ format })) format;
                        };
                        Debug.print("Failed to parse '" # formatName # "' datetime: " # debug_show (expectedText));
                        assert false;
                    };
                    case (?r) {

                        let timeZoneEqual = switch ((testCase.timeZone, r.timeZoneDescriptor)) {
                            case ((#fixed(f1), de)) {
                                let offset1 = TimeZone.toFixedOffsetSeconds(f1);
                                let offset2 = switch (de) {
                                    case (#fixed(f2)) {
                                        offset1 == TimeZone.toFixedOffsetSeconds(f2);
                                    };
                                    case (#utc) {
                                        offset1 == 0;
                                    };
                                    case (#name(d2)) {
                                        false;
                                    };
                                    case (#unspecified) {
                                        false;
                                    };
                                };
                            };
                        };
                        if (testCase.components != r.components or not timeZoneEqual) {
                            Debug.print("Text: " # debug_show (expectedText));
                            Debug.print("Expected: " # debug_show (testCase.components) # " - " # debug_show (testCase.timeZone));
                            Debug.print("Actual:   " # debug_show (r.components) # " - " # debug_show (r.timeZoneDescriptor));
                            assert false;
                        };
                    };
                };
            };
        };
    },
);

test(
    "addTime",
    func() {
        let testCases = [
            {
                components = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                timeToAdd = 123;
                expectedComponents = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 123;
                };
            },
            {
                components = {
                    year = 1980;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                timeToAdd = 123_456_789_012_345_678;
                expectedComponents = {
                    year = 1983;
                    month = 11;
                    day = 29;
                    hour = 21;
                    minute = 33;
                    nanosecond = 9_012_345_678;
                };
            },
            {
                components = {
                    year = 1971;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                timeToAdd = -123_456_789_012_345_678;
                expectedComponents = {
                    year = 1967;
                    month = 2;
                    day = 2;
                    hour = 2;
                    minute = 26;
                    nanosecond = 50_987_654_322;
                };
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual : Components.Components = Components.addTime(testCase.components, testCase.timeToAdd);
            let matched = testCase.expectedComponents == actual;
            if (not matched) {
                Debug.print("Components: " # debug_show (testCase.components));
                Debug.print("Time to add: " # debug_show (testCase.timeToAdd));
                Debug.print("Expected: " # debug_show (testCase.expectedComponents));
                Debug.print("Actual:   " # debug_show (actual));
                assert false;
            };
        };
    },
);
