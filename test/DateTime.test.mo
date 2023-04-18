import Iter "mo:base/Iter";
import { test } "mo:test";
import DateTime "../src/DateTime";
import Debug "mo:base/Debug";
import Int "mo:base/Int";

func testToEpochNanoseconds(dateTime : DateTime.DateTime, expectedNanoseconds : Int) {
  test(
    "toEpochNanoseconds: " # debug_show (dateTime),
    func() {
      let actualNanoseconds : Int = DateTime.toEpochNanoseconds(dateTime);
      if (actualNanoseconds != expectedNanoseconds) {
        Debug.trap("Expected " # Int.toText(expectedNanoseconds) # " but got " # Int.toText(actualNanoseconds));
      };
    },
  );
};

testToEpochNanoseconds(
  { year = 1950; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0 },
  -631_152_000_000_000_000,
);
testToEpochNanoseconds(
  { year = 1950; month = 11; day = 12; hour = 4; minute = 33; nanosecond = 0 },
  -603_919_620_000_000_000,
);

testToEpochNanoseconds(
  { year = 1970; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0 },
  0,
);

testToEpochNanoseconds(
  { year = 1970; month = 1; day = 1; hour = 0; minute = 1; nanosecond = 0 },
  60_000_000_000,
);

testToEpochNanoseconds(
  { year = 1970; month = 1; day = 2; hour = 0; minute = 0; nanosecond = 0 },
  86_400_000_000_000,
);

testToEpochNanoseconds(
  { year = 1972; month = 2; day = 29; hour = 0; minute = 0; nanosecond = 0 },
  68_169_600_000_000_000,
);

testToEpochNanoseconds(
  { year = 2000; month = 1; day = 1; hour = 0; minute = 0; nanosecond = 0 },
  946_684_800_000_000_000,
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
);

testToEpochNanoseconds(
  { year = 2020; month = 5; day = 20; hour = 15; minute = 30; nanosecond = 0 },
  1_589_988_600_000_000_000,
);
