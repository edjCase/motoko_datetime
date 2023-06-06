import Iter "mo:base/Iter";
import { test } "mo:test";
import LocalDateTime "../src/LocalDateTime";
import Components "../src/Components";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Types "../internal/Types";


test(
    "equal",
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
                expected = true;
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
                expected = false;
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
                expected = false;
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
                expected = true;
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
                expected = true;
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
                expected = false;
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
                expected = true;
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
                tz2 = #seconds(1);
                expected = false;
            }
        ];
        for (testCase in Iter.fromArray(testCases)){
            let a = LocalDateTime.LocalDateTime(testCase.c1, #fixed(testCase.tz1));
            let b = LocalDateTime.LocalDateTime(testCase.c2, #fixed(testCase.tz2));
            let areEqual = a.equal(b);
            let areEqualStatic = LocalDateTime.equal(a, b);
            if (areEqual != areEqualStatic) {
                Debug.print("equal and LocalDateTime.equal returned different results");
                assert false;
            };
            let expected = testCase.expected;
            if (areEqual != expected) {
                let t = if (expected) "equal" else "not equal";
                Debug.print("Expected " # t # ": " # a.toText() # " and " # b.toText());
                assert false;
            };
        };
    },
);

// TODO
// test(
//     "compare",
//     func() {
//         let testCases = [
//             (0, #seconds(0), 0, #seconds(0), #equal),
//             (0, #seconds(0), 1, #seconds(0), #less),
//             (1, #seconds(0), 0, #seconds(0), #greater),
//             (1, #seconds(0), 1, #seconds(0), #equal),
//             (999_999_999_999_999_999, #seconds(0), 999_999_999_999_999_999, #seconds(0), #equal),
//             (999_999_999_999_999_998, #seconds(0), 999_999_999_999_999_999, #seconds(0), #less)
//         ];
//         for (testCase in Iter.fromArray(testCases)){
            
//             let a = LocalDateTime.fromTime(testCase.0, #fixed(testCase.1));
//             let b = LocalDateTime.fromTime(testCase.2, #fixed(testCase.3));
//             let result = a.compare(b);
//             let resultStatic = LocalDateTime.compare(a, b);
//             if (result != resultStatic) {
//                 Debug.print("compare and LocalDateTime.compare returned different results");
//                 assert false;
//             };
//             let expected = testCase.4;
//             if (result != expected) {
//                 Debug.print("Expected " # debug_show(expected) # ": " # a.toText() # " and " # b.toText());
//                 assert false;
//             };
//         };
//     },
// );

// test(
//     "isInLeapYear",
//     func() {
        
//         let testCases = [
//             (0, #seconds(0), false),
//             (1_590_857_933_000_000_000, #seconds(0), true),
//             (1_685_465_933_000_000_000, #seconds(0), false)
//         ];
//         for (testCase in Iter.fromArray(testCases)){
            
//             let dateTime = LocalDateTime.fromTime(testCase.0, #fixed(testCase.1)); 
//             let isInLeapYear = dateTime.isInLeapYear();
//             let expected = testCase.2;
//             if (isInLeapYear != expected) {
//                 Debug.print("Expected isInLeapYear: " # debug_show(expected) # " but got " # debug_show(isInLeapYear) # " for " # dateTime.toText());
//                 assert false;
//             };
//         };
//     }
// );

// test(
//     "timeSince",
//     func() {
        
//         let testCases = [
//             (0, #seconds(0), 1, #seconds(0), -1),
//             (1_590_857_933_000_000_000, #seconds(0), 1_590_757_933_000_000_001, #seconds(0), 99_999_999_999_999),
//             (1_685_465_933_000_000_000, #seconds(0), 1_700_000_000_000_000_000, #seconds(0), -14_534_067_000_000_000)
//         ];
//         for (testCase in Iter.fromArray(testCases)) {
//             let dateTime1 = LocalDateTime.fromTime(testCase.0, #fixed(testCase.1));
//             let dateTime2 = LocalDateTime.fromTime(testCase.2, #fixed(testCase.3));
//             let timeSince = dateTime1.timeSince(dateTime2);
//             let expected = testCase.4;
//             if (timeSince != expected) {
//                 Debug.print("Expected: " # debug_show(expected) # " but got " # debug_show(timeSince) # " for " # dateTime1.toText() # " and " # dateTime2.toText());
//                 assert false;
//             };
//         };
//     }
// );

// test(
//     "add",
//     func() {
        
//         let testCases : [(Int, Types.Duration, Int)] = [
//             (+0, #nanoseconds(+5), +5),
//             (+0, #milliseconds(+6), +6_000_000),
//             (+0, #seconds(+4), +4_000_000_000),
//             (+0, #minutes(+2), +120_000_000_000),
//             (+0, #hours(+3), +10_800_000_000_000),
//             (+0, #days(+1), +86_400_000_000_000),
//             (+0, #weeks(+8), +4_838_400_000_000_000),
//             (+0, #months(+7), +18_316_800_000_000_000),
//             (+0, #years(+9), +283_996_800_000_000_000),

//             (+123_456_789_000_000, #nanoseconds(+5), +123_456_789_000_005),
//             (+123_456_789_000_000, #months(+7), +18_440_256_789_000_000),

//             (+123_456_789_000_000, #nanoseconds(-5_000_000), +123_456_784_000_000),
//             (-123_456_789_000_000, #nanoseconds(-5_000_000), -123_456_794_000_000),
//             (-123_456_789_000_000, #years(-3), -94_817_856_789_000_000),
//         ];
//         for (testCase in Iter.fromArray(testCases)) {            
//             let actual = LocalDateTime.fromTime(testCase.0).add(testCase.1);
//             let newTime = actual.toTime();
//             if (newTime != testCase.2) {
//                 Debug.print("Case " # debug_show(testCase.0) # " + " # debug_show(testCase.1));
//                 Debug.print("Expected: " # debug_show(testCase.2) # " but got " # debug_show(newTime));
//                 assert false;
//             };
//         };
//     }
// );


// func assertText(expected : Text, actual : Text) {
//     if (expected != actual) {
//         Debug.print("Expected: " # debug_show (expected));
//         Debug.print("Actual:   " # debug_show (actual));
//         assert false;
//     };
// };

// test(
//     "fromTextFormatted",
//     func() {
//         let testCases = [
//             {
//                 dateTime = LocalDateTime.LocalDateTime(0);
//                 timeZoneDescriptor = #utc;
//                 expectedIso8601 = "1970-01-01T00:00:00.000Z";
//             },
//             {
//                 dateTime = LocalDateTime.LocalDateTime(+25_320_000_000_000);
//                 timeZoneDescriptor = #hoursAndMinutes(-7, 2);
//                 expectedIso8601 = "1970-01-01T00:00:00.000-07:02";
//             },
//             {
//                 dateTime = LocalDateTime.LocalDateTime(+1_686_082_300_787_000_000);
//                 timeZoneDescriptor = #hoursAndMinutes(8, 0);
//                 expectedIso8601 = "2023-06-07T04:11:40.787+08:00";
//             },
//         ];
//         for (testCase in Iter.fromArray(testCases)) {
//             let fromTextResult = LocalDateTime.fromTextFormatted(testCase.expectedIso8601, #iso8601);
//             switch (fromTextResult) {
//                 case (null) {
//                     Debug.print("Failed to parse ISO 8601 datetime: " # debug_show (testCase.expectedIso8601));
//                     assert false;
//                 };
//                 case (?actualDateTime) {            
//                     let matched2 = testCase.dateTime.equal(actualDateTime);

//                     if (not matched2) {
//                         Debug.print("Text: " # debug_show (testCase.expectedIso8601));
//                         Debug.print("Expected: " # debug_show (testCase.dateTime.toTime()));
//                         Debug.print("Actual:   " # debug_show (actualDateTime.toTime()));
//                         assert false;
//                     };
//                 }
//             };
//         };
//     },
// );