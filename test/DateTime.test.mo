import Iter "mo:base/Iter";
import { test } "mo:test";
import DateTime "../src/DateTime";
import Components "../src/Components";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Text "mo:base/Text";

type TestCase = {
  dateTime : Components.Components;
  nanoseconds : Int;
  textIso8061 : Text;
};

let testCases : [TestCase] = [
  {
    dateTime = {
      year = 1950;
      month = 1;
      day = 1;
      hour = 0;
      minute = 0;
      nanosecond = 0;
    };
    nanoseconds = -631_152_000_000_000_000;
    textIso8061 = "1950-01-01T00:00:00.000Z";
  },
  {
    dateTime = {
      year = 1950;
      month = 11;
      day = 12;
      hour = 4;
      minute = 33;
      nanosecond = 0;
    };
    nanoseconds = -603_919_620_000_000_000;
    textIso8061 = "1950-11-12T04:33:00.000Z";
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
    nanoseconds = 0;
    textIso8061 = "1970-01-01T00:00:00.000Z";
  },
  {
    dateTime = {
      year = 1970;
      month = 1;
      day = 1;
      hour = 0;
      minute = 1;
      nanosecond = 0;
    };
    nanoseconds = 60_000_000_000;
    textIso8061 = "1970-01-01T00:01:00.000Z";
  },
  {
    dateTime = {
      year = 1970;
      month = 1;
      day = 2;
      hour = 0;
      minute = 0;
      nanosecond = 0;
    };
    nanoseconds = 86_400_000_000_000;
    textIso8061 = "1970-01-02T00:00:00.000Z";
  },
  {
    dateTime = {
      year = 1972;
      month = 2;
      day = 29;
      hour = 0;
      minute = 0;
      nanosecond = 0;
    };
    nanoseconds = 68_169_600_000_000_000;
    textIso8061 = "1972-02-29T00:00:00.000Z";
  },
  {
    dateTime = {
      year = 2000;
      month = 1;
      day = 1;
      hour = 0;
      minute = 0;
      nanosecond = 0;
    };
    nanoseconds = 946_684_800_000_000_000;
    textIso8061 = "2000-01-01T00:00:00.000Z";
  },
  {
    dateTime = {
      year = 2000;
      month = 12;
      day = 31;
      hour = 23;
      minute = 59;
      nanosecond = 59_000_000_000;
    };
    nanoseconds = 978_307_199_000_000_000;
    textIso8061 = "2000-12-31T23:59:59.000Z";
  },
  {
    dateTime = {
      year = 2020;
      month = 5;
      day = 20;
      hour = 15;
      minute = 30;
      nanosecond = 0;
    };
    nanoseconds = 1_589_988_600_000_000_000;
    textIso8061 = "2020-05-20T15:30:00.000Z";
  },
];

func assertT<T>(
  actual : T,
  expected : T,
  eval : (T, T) -> Bool,
  debugShow : (T) -> Text,
) {
  if (not eval(actual, expected)) {
    Debug.print("Expected\n" # debugShow(expected) # "\n\nActual:\n" # debugShow(actual));
    assert (false);
  };
};

func assertDateTime(
  actual : DateTime.DateTime,
  expected : DateTime.DateTime,
) {
  return assertT<DateTime.DateTime>(actual, expected, DateTime.equal, DateTime.toText);
};
func assertComponents(
  actual : Components.Components,
  expected : Components.Components,
) {
  return assertT<Components.Components>(actual, expected, func(a, b) = a == b, func(a) = debug_show (a));
};

for (testCase in Iter.fromArray(testCases)) {
  let expectedDateTime = DateTime.DateTime(testCase.nanoseconds);
  test(
    "fromComponents: " # debug_show (testCase.dateTime),
    func() {
      // From date components
      let ?dateTime = DateTime.fromComponents(testCase.dateTime) else Debug.trap("Could not parse date time components to a datetime");
      assertDateTime(dateTime, expectedDateTime);
    },
  );

  test(
    "toComponents: " # debug_show (testCase.nanoseconds),
    func() {
      // From nanoseconds
      assertComponents(expectedDateTime.toComponents(), testCase.dateTime);
    },
  );

  test(
    "fromTime: " # debug_show (testCase.nanoseconds),
    func() {
      // From nanoseconds
      let dateTime = DateTime.fromTime(testCase.nanoseconds);
      assertDateTime(dateTime, expectedDateTime);
    },
  );

  test(
    "toTime: " # debug_show (testCase.dateTime),
    func() {
      // From nanoseconds
      assertT(expectedDateTime.toTime(), testCase.nanoseconds, Int.equal, Int.toText);
    },
  );

  test(
    "toTextFormatted iso8601: " # debug_show (testCase.textIso8061),
    func() {
      // To Iso8601 text
      let actualIso8601 : Text = expectedDateTime.toTextFormatted(#iso8601);
      assertT(actualIso8601, testCase.textIso8061, Text.equal, func(t : Text) : Text = t);

    },
  );

  test(
    "fromTextFormatted iso8601: " # debug_show (testCase.textIso8061),
    func() {
      // From Iso8601 text
      let ?actualIso8601DateTime = DateTime.fromTextFormatted(testCase.textIso8061, #iso8601) else Debug.trap("Could not parse date time components to a datetime");
      assertDateTime(actualIso8601DateTime, expectedDateTime);
    },
  );
};
