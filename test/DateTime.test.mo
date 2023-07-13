import Iter "mo:base/Iter";
import { test } "mo:test";
import DateTime "../src/DateTime";
import Components "../src/Components";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Types "../internal/Types";

test(
    "equal",
    func() {
        let testCases = [
            (0, 0, true),
            (0, 1, false),
            (1, 0, false),
            (1, 1, true),
            (999_999_999_999_999_999, 999_999_999_999_999_999, true),
            (999_999_999_999_999_998, 999_999_999_999_999_999, false),
        ];
        for (testCase in Iter.fromArray(testCases)) {

            let a = DateTime.fromTime(testCase.0);
            let b = DateTime.fromTime(testCase.1);
            let areEqual = a.equal(b);
            let areEqualStatic = DateTime.equal(a, b);
            if (areEqual != areEqualStatic) {
                Debug.print("equal and DateTime.equal returned different results");
                assert false;
            };
            if (areEqual != testCase.2) {
                let t = if (testCase.2) "equal" else "not equal";
                Debug.print("Expected " # t # ": " # a.toText() # " and " # b.toText());
                assert false;
            };
        };
    },
);

test(
    "compare",
    func() {
        let testCases = [
            (0, 0, #equal),
            (0, 1, #less),
            (1, 0, #greater),
            (1, 1, #equal),
            (999_999_999_999_999_999, 999_999_999_999_999_999, #equal),
            (999_999_999_999_999_998, 999_999_999_999_999_999, #less),
        ];
        for (testCase in Iter.fromArray(testCases)) {

            let a = DateTime.fromTime(testCase.0);
            let b = DateTime.fromTime(testCase.1);
            let result = a.compare(b);
            let resultStatic = DateTime.compare(a, b);
            if (result != resultStatic) {
                Debug.print("compare and DateTime.compare returned different results");
                assert false;
            };
            if (result != testCase.2) {
                Debug.print("Expected " # debug_show (testCase.2) # ": " # a.toText() # " and " # b.toText());
                assert false;
            };
        };
    },
);

test(
    "isInLeapYear",
    func() {

        let testCases = [
            (0, false),
            (1_590_857_933_000_000_000, true),
            (1_685_465_933_000_000_000, false),
        ];
        for (testCase in Iter.fromArray(testCases)) {

            let dateTime = DateTime.fromTime(testCase.0);
            let isInLeapYear = dateTime.isInLeapYear();
            if (isInLeapYear != testCase.1) {
                Debug.print("Expected isInLeapYear: " # debug_show (testCase.1) # " but got " # debug_show (isInLeapYear) # " for " # dateTime.toText());
                assert false;
            };
        };
    },
);

test(
    "timeBetween",
    func() {

        let testCases = [
            (0, 1, -1),
            (1_590_857_933_000_000_000, 1_590_757_933_000_000_001, 99_999_999_999_999),
            (1_685_465_933_000_000_000, 1_700_000_000_000_000_000, -14_534_067_000_000_000),
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let dateTime1 = DateTime.fromTime(testCase.0);
            let dateTime2 = DateTime.fromTime(testCase.1);
            let timeBetween = dateTime1.timeBetween(dateTime2);
            if (timeBetween != testCase.2) {
                Debug.print("Expected: " # debug_show (testCase.2) # " but got " # debug_show (timeBetween) # " for " # dateTime1.toText() # " and " # dateTime2.toText());
                assert false;
            };
        };
    },
);

test(
    "add",
    func() {

        let testCases : [(Int, Types.Duration, Int)] = [
            (+0, #nanoseconds(+5), +5),
            (+0, #milliseconds(+6), +6_000_000),
            (+0, #seconds(+4), +4_000_000_000),
            (+0, #minutes(+2), +120_000_000_000),
            (+0, #hours(+3), +10_800_000_000_000),
            (+0, #days(+1), +86_400_000_000_000),
            (+0, #weeks(+8), +4_838_400_000_000_000),
            (+0, #months(+7), +18_316_800_000_000_000),
            (+0, #years(+9), +283_996_800_000_000_000),

            (+123_456_789_000_000, #nanoseconds(+5), +123_456_789_000_005),
            (+123_456_789_000_000, #months(+7), +18_440_256_789_000_000),

            (+123_456_789_000_000, #nanoseconds(-5_000_000), +123_456_784_000_000),
            (-123_456_789_000_000, #nanoseconds(-5_000_000), -123_456_794_000_000),
            (-123_456_789_000_000, #years(-3), -94_817_856_789_000_000),
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual = DateTime.fromTime(testCase.0).add(testCase.1);
            let newTime = actual.toTime();
            if (newTime != testCase.2) {
                Debug.print("Case " # debug_show (testCase.0) # " + " # debug_show (testCase.1));
                Debug.print("Expected: " # debug_show (testCase.2) # " but got " # debug_show (newTime));
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
                dateTime = DateTime.DateTime(0);
                timeZoneDescriptor = #utc;
                expectediso = "1970-01-01T00:00:00.000000000Z";
            },
            {
                dateTime = DateTime.DateTime(+25_320_000_000_000);
                timeZoneDescriptor = #seconds(-25320);
                expectediso = "1970-01-01T00:00:00.000000000-07:02";
            },
            {
                dateTime = DateTime.DateTime(+1_686_082_300_787_000_000);
                timeZoneDescriptor = #hours(8);
                expectediso = "2023-06-07T04:11:40.787000000+08:00";
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let fromTextResult = DateTime.fromTextFormatted(testCase.expectediso, #iso);
            switch (fromTextResult) {
                case (null) {
                    Debug.print("Failed to parse ISO 8601 datetime: " # debug_show (testCase.expectediso));
                    assert false;
                };
                case (?actualDateTime) {
                    let matched2 = testCase.dateTime.equal(actualDateTime);

                    if (not matched2) {
                        Debug.print("Text: " # debug_show (testCase.expectediso));
                        Debug.print("Expected: " # debug_show (testCase.dateTime.toTime()));
                        Debug.print("Actual:   " # debug_show (actualDateTime.toTime()));
                        assert false;
                    };
                };
            };
        };
    },
);

test(
    "dayOfWeek, weekOfYear, weekYear, dayOfYear",
    func() {
        let testCases = [
            {
                dateTime = DateTime.DateTime(0);
                expected = {
                    weekOfYear = 0;
                    weekYear = 1969;
                    dayOfWeek = #thursday;
                    dayOfYear = 1;
                };
            },
            {
                dateTime = DateTime.DateTime(+25_320_000_000_000);
                expected = {
                    weekOfYear = 0;
                    weekYear = 1969;
                    dayOfWeek = #thursday;
                    dayOfYear = 1;
                };
            },
            {
                dateTime = DateTime.DateTime(+1_686_082_300_787_000_000);
                expected = {
                    weekOfYear = 23;
                    weekYear = 2023;
                    dayOfWeek = #tuesday;
                    dayOfYear = 157;
                };
            },
            {
                dateTime = DateTime.DateTime(+1_786_582_300_787_000_000);
                expected = {
                    weekOfYear = 33;
                    weekYear = 2026;
                    dayOfWeek = #thursday;
                    dayOfYear = 225;
                };
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {

            let actual : Components.DayOfWeek = testCase.dateTime.dayOfWeek();
            if (testCase.expected.dayOfWeek != actual) {
                Debug.print("Failed to get correct day of week");
                Debug.print("DateTime: " # debug_show (testCase.dateTime.toText()));
                Debug.print("Expected: " # debug_show (testCase.expected.dayOfWeek));
                Debug.print("Actual:   " # debug_show (actual));
                assert false;
            };

            let actualWeekOfYear : Int = testCase.dateTime.weekOfYear();
            if (testCase.expected.weekOfYear != actualWeekOfYear) {
                Debug.print("Failed to get correct week of year");
                Debug.print("DateTime: " # debug_show (testCase.dateTime.toText()));
                Debug.print("Expected: " # debug_show (testCase.expected.weekOfYear));
                Debug.print("Actual:   " # debug_show (actualWeekOfYear));
                assert false;
            };

            let actualWeekYear : Int = testCase.dateTime.weekYear();
            if (testCase.expected.weekYear != actualWeekYear) {
                Debug.print("Failed to get correct week year");
                Debug.print("DateTime: " # debug_show (testCase.dateTime.toText()));
                Debug.print("Expected: " # debug_show (testCase.expected.weekYear));
                Debug.print("Actual:   " # debug_show (actualWeekYear));
                assert false;
            };

            let actualDayOfYear : Int = testCase.dateTime.dayOfYear();
            if (testCase.expected.dayOfYear != actualDayOfYear) {
                Debug.print("Failed to get correct day of year");
                Debug.print("DateTime: " # debug_show (testCase.dateTime.toText()));
                Debug.print("Expected: " # debug_show (testCase.expected.dayOfYear));
                Debug.print("Actual:   " # debug_show (actualDayOfYear));
                assert false;
            };
        };
    },
);

test(
    "weekOfYear",
    func() {
        let testCases = [
            {
                dateTime = DateTime.DateTime(0);
                expected = 0;
            },
            {
                dateTime = DateTime.DateTime(+25_320_000_000_000);
                expected = 0;
            },
            {
                dateTime = DateTime.DateTime(+1_672_790_400_000_000_000);
                expected = 1;
            },
            {
                dateTime = DateTime.DateTime(+1_686_082_300_787_000_000);
                expected = 23;
            },
            {
                dateTime = DateTime.DateTime(+1_786_582_300_787_000_000);
                expected = 33;
            },
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual = testCase.dateTime.weekOfYear();

            if (actual != testCase.expected) {
                Debug.print("Date: " # debug_show (testCase.dateTime.toText()));
                Debug.print("Expected: " # debug_show (testCase.expected));
                Debug.print("Actual:   " # debug_show (actual));
                assert false;
            };
        };
    },
);
