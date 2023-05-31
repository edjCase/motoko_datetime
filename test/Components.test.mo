import Iter "mo:base/Iter";
import { test } "mo:test";
import DateTime "../src/DateTime";
import Components "../src/Components";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Types "../internal/Types";


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
        let actual = Components.epoch();
        assert (expected == actual)
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
                order = ?#equal;
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
                order = ?#less;
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
                order = ?#greater;
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
                    day = 30; // Invalid day
                    hour = 0;
                    minute = 0;
                    nanosecond = 0;
                };
                order = null;
            },
            {
                c1 = {
                    year = 1970;
                    month = 1;
                    day = 32; // Invalid day
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
                order = null;
            }
        ];
        for (testCase in Iter.fromArray(testCases)) {
            let actual = Components.compare(testCase.c1, testCase.c2);
            assert (testCase.order == actual)
        }
    },
);
