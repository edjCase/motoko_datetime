import Iter "mo:base/Iter";
import { test } "mo:test";
import DateTime "../src/DateTime";
import Debug "mo:base/Debug";
import Int "mo:base/Int";

func testToEpochNanoseconds(
  dateTime : DateTime.DateTime,
  expectedNanoseconds : Int,
  expectedIso8601 : Text,
) {
  test(
    "toEpochNanoseconds: " # debug_show (dateTime),
    func() {
      // To nanoseconds
      let actualNanoseconds : Int = DateTime.toEpochNanoseconds(dateTime);
      if (actualNanoseconds != expectedNanoseconds) {
        Debug.trap("Expected " # Int.toText(expectedNanoseconds) # " but got " # Int.toText(actualNanoseconds));
      };

      // From nanoseconds
      let actualDateTime = DateTime.fromEpochNanoseconds(expectedNanoseconds);
      if (actualDateTime != dateTime) {
        Debug.trap("\nExpected:\n" # debug_show (dateTime) # "\n\nActual\n" # debug_show (actualDateTime));
      };

      // To Iso8601 text
      let actualIso8601 = DateTime.toTextFormatted(dateTime, #iso8601);
      if (actualIso8601 != expectedIso8601) {
        Debug.trap("\nExpected:\n" # debug_show (expectedIso8601) # "\n\nActual\n" # debug_show (actualIso8601));
      };

      // From Iso8601 text
      let actualIso8601DateTime = switch (DateTime.fromTextFormatted(expectedIso8601, #iso8601)) {
        case (?d) d;
        case (null) Debug.trap("Expected to parse " # debug_show (expectedIso8601));
      };
      if (actualIso8601DateTime != dateTime) {
        Debug.trap("\nExpected:\n" # debug_show (dateTime) # "\n\nActual\n" # debug_show (actualIso8601DateTime));
      };
    },
  );
};

testToEpochNanoseconds(
  { year = 1950; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0 },
  -631_152_000_000_000_000,
  "1950-01-01T00:00:00.000Z",
);
testToEpochNanoseconds(
  { year = 1950; month = 11; day = 12; hour = 4; minute = 33; nanosecond = 0 },
  -603_919_620_000_000_000,
  "1950-11-12T04:33:00.000Z",
);

testToEpochNanoseconds(
  { year = 1970; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0 },
  0,
  "1970-01-01T00:00:00.000Z",
);

testToEpochNanoseconds(
  { year = 1970; month = 1; day = 1; hour = 0; minute = 1; nanosecond = 0 },
  60_000_000_000,
  "1970-01-01T00:01:00.000Z",
);

testToEpochNanoseconds(
  { year = 1970; month = 1; day = 2; hour = 0; minute = 0; nanosecond = 0 },
  86_400_000_000_000,
  "1970-01-02T00:00:00.000Z",
);

testToEpochNanoseconds(
  { year = 1972; month = 2; day = 29; hour = 0; minute = 0; nanosecond = 0 },
  68_169_600_000_000_000,
  "1972-02-29T00:00:00.000Z",
);

testToEpochNanoseconds(
  { year = 2000; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0 },
  946_684_800_000_000_000,
  "2000-01-01T00:00:00.000Z",
);

testToEpochNanoseconds(
  {
    year = 2000;
    month = 12;
    day = 31;
    hour = 23;
    minute = 59;
    nanosecond = 59_000_000_000;
  },
  978_307_199_000_000_000,
  "2000-12-31T23:59:59.000Z",
);

testToEpochNanoseconds(
  { year = 2020; month = 5; day = 20; hour = 15; minute = 30; nanosecond = 0 },
  1_589_988_600_000_000_000,
  "2020-05-20T15:30:00.000Z",
);
