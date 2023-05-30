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
            (999_999_999_999_999_998, 999_999_999_999_999_999, false)
        ];
        for (testCase in Iter.fromArray(testCases)){
            
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
            (999_999_999_999_999_998, 999_999_999_999_999_999, #less)
        ];
        for (testCase in Iter.fromArray(testCases)){
            
            let a = DateTime.fromTime(testCase.0);
            let b = DateTime.fromTime(testCase.1);
            let result = a.compare(b);
            let resultStatic = DateTime.compare(a, b);
            if (result != resultStatic) {
                Debug.print("compare and DateTime.compare returned different results");
                assert false;
            };
            if (result != testCase.2) {
                Debug.print("Expected " # debug_show(testCase.2) # ": " # a.toText() # " and " # b.toText());
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
            (1_685_465_933_000_000_000, false)
        ];
        for (testCase in Iter.fromArray(testCases)){
            
            let dateTime = DateTime.fromTime(testCase.0);
            let isInLeapYear = dateTime.isInLeapYear();
            if (isInLeapYear != testCase.1) {
                Debug.print("Expected isInLeapYear: " # debug_show(testCase.1) # " but got " # debug_show(isInLeapYear) # " for " # dateTime.toText());
                assert false;
            };
        };
    }
);

test(
    "timeSince",
    func() {
        
        let testCases = [
            (0, 1, -1),
            (1_590_857_933_000_000_000, 1_590_757_933_000_000_001, 99_999_999_999_999),
            (1_685_465_933_000_000_000, 1_700_000_000_000_000_000, -14_534_067_000_000_000)
        ];
        for (testCase in Iter.fromArray(testCases)) {            
            let dateTime1 = DateTime.fromTime(testCase.0);
            let dateTime2 = DateTime.fromTime(testCase.1);
            let timeSince = dateTime1.timeSince(dateTime2);
            if (timeSince != testCase.2) {
                Debug.print("Expected: " # debug_show(testCase.2) # " but got " # debug_show(timeSince) # " for " # dateTime1.toText() # " and " # dateTime2.toText());
                assert false;
            };
        };
    }
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
        ];
        for (testCase in Iter.fromArray(testCases)) {            
            let dateTime1 = DateTime.fromTime(testCase.0);
            let dateTime2 = dateTime1.add(testCase.1);
            let newTime = dateTime2.toTime();
            if (newTime != testCase.2) {
                Debug.print("Expected: " # debug_show(testCase.2) # " but got " # debug_show(newTime));
                assert false;
            };
        };
    }
);