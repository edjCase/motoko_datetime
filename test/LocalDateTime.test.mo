import Iter "mo:base/Iter";
import { test } "mo:test";
import LocalDateTime "../src/LocalDateTime";
import Components "../src/Components";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Types "../src/Types";

test(
    "compare, equal, timeBetween",
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
                tz1 = #seconds(0);
                c2 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                tz2 = #seconds(0);
                expected = #equal;
                diff = 0;
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
                tz1 = #seconds(0);
                c2 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 1;
                };
                tz2 = #seconds(0);
                expected = #less;
                diff = -1;
            },
            {
                c1 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 1;
                };
                tz1 = #seconds(0);
                c2 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                tz2 = #seconds(0);
                expected = #greater;
                diff = 1;
            },
            {
                c1 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 1;
                };
                tz1 = #seconds(0);
                c2 = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 1;
                };
                tz2 = #seconds(0);
                expected = #equal;
                diff = 0;
            },
            {
                c1 = {
                    year = 2020;
                    month = 3;
                    day = 2;
                    hour = 5;
                    minute = 6;
                    nanosecond = 1;
                };
                tz1 = #seconds(0);
                c2 = {
                    year = 2020;
                    month = 3;
                    day = 2;
                    hour = 5;
                    minute = 6;
                    nanosecond = 1;
                };
                tz2 = #seconds(0);
                expected = #equal;
                diff = 0;
            },
            {
                c1 = {
                    year = 2020;
                    month = 3;
                    day = 2;
                    hour = 5;
                    minute = 6;
                    nanosecond = 1;
                };
                tz1 = #seconds(0);
                c2 = {
                    year = 2020;
                    month = 3;
                    day = 2;
                    hour = 5;
                    minute = 6;
                    nanosecond = 0;
                };
                tz2 = #seconds(0);
                expected = #greater;
                diff = 1;
            },
            {
                c1 = {
                    year = 2020;
                    month = 3;
                    day = 2;
                    hour = 5;
                    minute = 6;
                    nanosecond = 1_000_000_000;
                };
                tz1 = #seconds(1);
                c2 = {
                    year = 2020;
                    month = 3;
                    day = 2;
                    hour = 5;
                    minute = 6;
                    nanosecond = 0;
                };
                tz2 = #seconds(0);
                expected = #equal;
                diff = 0;
            },
            {
                c1 = {
                    year = 2020;
                    month = 3;
                    day = 2;
                    hour = 5;
                    minute = 6;
                    nanosecond = 1_000_000_000;
                };
                tz1 = #seconds(1);
                c2 = {
                    year = 2020;
                    month = 3;
                    day = 2;
                    hour = 5;
                    minute = 6;
                    nanosecond = 0;
                };
                tz2 = #seconds(-1);
                expected = #less;
                diff = -1_000_000_000;
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let a = LocalDateTime.LocalDateTime(testCase.c1, #fixed(testCase.tz1));
            let b = LocalDateTime.LocalDateTime(testCase.c2, #fixed(testCase.tz2));
            let order = a.compare(b);

            let expected = testCase.expected;
            if (order != expected) {
                Debug.print("Failed a.compare(b)");
                Debug.print("a: " # debug_show (a.toText()));
                Debug.print("b: " # debug_show (b.toText()));
                Debug.print("Expected " # debug_show (expected));
                Debug.print("Actual " # debug_show (order));
                assert false;
            };
            let expectedEqual = expected == #equal;
            let areEqual = a.equal(b);
            if (areEqual != expectedEqual) {
                Debug.print("Failed a.equal(b)");
                Debug.print("a: " # debug_show (a.toText()));
                Debug.print("b: " # debug_show (b.toText()));
                Debug.print("Expected " # debug_show (expected));
                Debug.print("Actual " # debug_show (order));
                assert false;
            };

            let diff = a.timeBetween(b);
            if (diff != testCase.diff) {
                Debug.print("Failed a.timeBetween(b)");
                Debug.print("a: " # debug_show (a.toText()));
                Debug.print("b: " # debug_show (b.toText()));
                Debug.print("Expected " # debug_show (testCase.diff));
                Debug.print("Actual " # debug_show (diff));
                assert false;
            };
        };
    },
);

test(
    "isInLeapYear",
    func() {

        let testCases = [
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 1;
                };
                timeZone = #seconds(0);
                expected = false;
            },
            {
                dateTime = {
                    year = 2020;
                    month = 5;
                    day = 30;
                    hour = 9;
                    minute = 58;
                    nanosecond = 53_000_000_000;
                };
                timeZone = #hours(-7);
                expected = true;
            },
            {
                dateTime = {
                    year = 2023;
                    month = 5;
                    day = 30;
                    hour = 16;
                    minute = 58;
                    nanosecond = 53_000_000_000;
                };
                timeZone = #seconds(0);
                expected = false;
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {

            let dateTime = LocalDateTime.LocalDateTime(testCase.dateTime, #fixed(testCase.timeZone));
            let isInLeapYear = dateTime.isInLeapYear();
            let expected = testCase.expected;
            if (isInLeapYear != expected) {
                Debug.print("Expected isInLeapYear: " # debug_show (expected) # " but got " # debug_show (isInLeapYear) # " for " # dateTime.toText());
                assert false;
            };
        };
    },
);

test(
    "add",
    func() {

        let testCases = [
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #nanoseconds(+5);
                expected = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 5;
                };
            },
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #milliseconds(+6);
                expected = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 6_000_000;
                };
            },
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #seconds(+4);
                expected = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 4_000_000_000;
                };
            },
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #minutes(+2);
                expected = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 2;
                    nanosecond = 0;
                };
            },
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #hours(+3);
                expected = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 3;
                    minute = 0;
                    nanosecond = 0;
                };
            },
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #days(+1);
                expected = {
                    year = 1970;
                    month = 1;
                    day = 2;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
            },
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #weeks(+8);
                expected = {
                    year = 1970;
                    month = 2;
                    day = 26;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
            },
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #months(+7);
                expected = {
                    year = 1970;
                    month = 8;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
            },
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #years(+9);
                expected = {
                    year = 1979;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
            },
            {
                dateTime = {
                    year = 2020;
                    month = 3;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #nanoseconds(-1);
                expected = {
                    year = 2020;
                    month = 2;
                    day = 29;
                    hour = 23;
                    minute = 59;
                    nanosecond = 59_999_999_999;
                };
            },
            {
                dateTime = {
                    year = 2021;
                    month = 3;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #nanoseconds(-1);
                expected = {
                    year = 2021;
                    month = 2;
                    day = 28;
                    hour = 23;
                    minute = 59;
                    nanosecond = 59_999_999_999;
                };
            },
            {
                dateTime = {
                    year = 2021;
                    month = 3;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                addValue = #weeks(-46);
                expected = {
                    year = 2020;
                    month = 4;
                    day = 13;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual = LocalDateTime.LocalDateTime(testCase.dateTime, #fixed(#seconds(0))).add(testCase.addValue).toComponents();

            if (actual != testCase.expected) {
                Debug.print("Failed a.add(b)");
                Debug.print("a: " # debug_show (testCase.dateTime));
                Debug.print("b: " # debug_show (testCase.addValue));
                Debug.print("Expected " # debug_show (testCase.expected));
                Debug.print("Actual " # debug_show (actual));
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
    "fromTextFormatted",
    func() {
        let testCases = [
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                timeZone = #seconds(0);
                expectediso = "1970-01-01T00:00:00.000000000Z";
            },
            {
                dateTime = {
                    year = 1970;
                    month = 1;
                    day = 1;
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                timeZone = #seconds(-25_320);
                expectediso = "1970-01-01T00:00:00.000000000-07:02";
            },
            {
                dateTime = {
                    year = 2023;
                    month = 06;
                    day = 07;
                    hour = 04;
                    minute = 11;
                    nanosecond = 40_787_000_000;
                };
                timeZone = #hours(8);
                expectediso = "2023-06-07T04:11:40.787000000+08:00";
            },
        ];
        let timeZoneNameParser = func(tzName : Text) : ?Types.TimeZone = null;
        for (testCase in Iter.fromArray(testCases)) {
            let fromTextResult = LocalDateTime.fromText(testCase.expectediso, "YYYY-MM-DDTHH:mm:ss.SSSSSSSSSZ", #fixed(#seconds(0)));
            switch (fromTextResult) {
                case (null) {
                    Debug.print("Failed to parse ISO 8601 datetime: " # debug_show (testCase.expectediso));
                    assert false;
                };
                case (?actualDateTime) {
                    let expected = LocalDateTime.LocalDateTime(testCase.dateTime, #fixed(testCase.timeZone));

                    if (not expected.equal(actualDateTime)) {
                        Debug.print("Text: " # debug_show (testCase.expectediso));
                        Debug.print("Expected: " # debug_show (expected.toText()));
                        Debug.print("Actual:   " # debug_show (actualDateTime.toText()));
                        assert false;
                    };
                };
            };
        };
    },
);

test(
    "advanceToDayOfWeek",
    func() {
        let testCases = [
            {
                dateTime = LocalDateTime.LocalDateTime(
                    {
                        year = 1970;
                        month = 1;
                        day = 1;
                        hour = 0;
                        minute = 0;
                        nanosecond = 0;
                    },
                    #fixed(#seconds(0)),
                );
                options : LocalDateTime.AdvanceDayOfWeekOptions = {
                    addWeekOnMatchingDay = true;
                    resetToStartOfDay = true;
                };
                dayOfWeek = #sunday;
                expected = LocalDateTime.LocalDateTime(
                    {
                        year = 1970;
                        month = 1;
                        day = 4;
                        hour = 0;
                        minute = 0;
                        nanosecond = 0;
                    },
                    #fixed(#seconds(0)),
                );
            },
            {
                dateTime = LocalDateTime.LocalDateTime(
                    {
                        year = 1970;
                        month = 1;
                        day = 1;
                        hour = 0;
                        minute = 0;
                        nanosecond = 5;
                    },
                    #fixed(#seconds(0)),
                );
                options : LocalDateTime.AdvanceDayOfWeekOptions = {
                    addWeekOnMatchingDay = true;
                    resetToStartOfDay = true;
                };
                dayOfWeek = #sunday;
                expected = LocalDateTime.LocalDateTime(
                    {
                        year = 1970;
                        month = 1;
                        day = 4;
                        hour = 0;
                        minute = 0;
                        nanosecond = 0;
                    },
                    #fixed(#seconds(0)),
                );
            },
            {
                dateTime = LocalDateTime.LocalDateTime(
                    {
                        year = 1970;
                        month = 1;
                        day = 1;
                        hour = 0;
                        minute = 0;
                        nanosecond = 5;
                    },
                    #fixed(#seconds(0)),
                );
                options : LocalDateTime.AdvanceDayOfWeekOptions = {
                    addWeekOnMatchingDay = true;
                    resetToStartOfDay = false;
                };
                dayOfWeek = #sunday;
                expected = LocalDateTime.LocalDateTime(
                    {
                        year = 1970;
                        month = 1;
                        day = 4;
                        hour = 0;
                        minute = 0;
                        nanosecond = 5;
                    },
                    #fixed(#seconds(0)),
                );
            },
            {
                dateTime = LocalDateTime.LocalDateTime(
                    {
                        year = 1970;
                        month = 1;
                        day = 5;
                        hour = 0;
                        minute = 0;
                        nanosecond = 0;
                    },
                    #fixed(#seconds(0)),
                );
                options : LocalDateTime.AdvanceDayOfWeekOptions = {
                    addWeekOnMatchingDay = true;
                    resetToStartOfDay = false;
                };
                dayOfWeek = #sunday;
                expected = LocalDateTime.LocalDateTime(
                    {
                        year = 1970;
                        month = 1;
                        day = 11;
                        hour = 0;
                        minute = 0;
                        nanosecond = 0;
                    },
                    #fixed(#seconds(0)),
                );
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual : LocalDateTime.LocalDateTime = testCase.dateTime.advanceToDayOfWeek(testCase.dayOfWeek, testCase.options);
            if (actual.compare(testCase.expected) != #equal) {
                Debug.print("Date: " # debug_show (testCase.dateTime.toText()));
                Debug.print("Day Of Week: " # debug_show (testCase.dayOfWeek));
                Debug.print("Expected: " # debug_show (testCase.expected.toTime()));
                Debug.print("Actual:   " # debug_show (actual.toTime()));
                assert false;
            };
        };
    },
);
