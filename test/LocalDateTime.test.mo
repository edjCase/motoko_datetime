import Iter "mo:base/Iter";
import { test } "mo:test";
import LocalDateTime "../src/LocalDateTime";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Text "mo:base/Text";
import DateTime "../src/DateTime";
import Components "../src/Components";
import TimeZone "../src/TimeZone";

type TestCase = {
  timeZone: LocalDateTime.TimeZone;
  dateTime : Components.Components;
  nanoseconds : Int;
  textIso8061 : Text;
};

let testCases : [TestCase] = [
  {
    timeZone = #fixed(#hoursAndMinutes((-7, 0)));
    dateTime = {
      year = 1950;
      month = 1;
      day = 1;
      hour = 0;
      minute = 0;
      nanosecond = 0;
    };
    nanoseconds = -631_126_800_000_000_000;
    textIso8061 = "1950-01-01T00:00:00.000-07:00";
  },
  {
    timeZone = #fixed(#hoursAndMinutes((-5, 0)));
    dateTime = {
      year = 1950;
      month = 11;
      day = 12;
      hour = 4;
      minute = 33;
      nanosecond = 0;
    };
    nanoseconds = -603_901_620_000_000_000;
    textIso8061 = "1950-11-12T04:33:00.000-05:00";
  },
  {
    timeZone = #fixed(#hoursAndMinutes((9, 0)));
    dateTime = {
      year = 1970;
      month = 1;
      day = 1;
      hour = 0;
      minute = 0;
      nanosecond = 0;
    };
    nanoseconds = -32_400_000_000_000;
    textIso8061 = "1970-01-01T00:00:00.000+09:00";
  },
  {
    timeZone = #fixed(#hoursAndMinutes((13, 0)));
    dateTime = {
      year = 1970;
      month = 1;
      day = 1;
      hour = 0;
      minute = 1;
      nanosecond = 0;
    };
    nanoseconds = -46_740_000_000_000;
    textIso8061 = "1970-01-01T00:01:00.000+13:00";
  },
  {
    timeZone = #fixed(#hoursAndMinutes((-1, 0)));
    dateTime = {
      year = 1970;
      month = 1;
      day = 2;
      hour = 0;
      minute = 0;
      nanosecond = 0;
    };
    nanoseconds = 90_000_000_000_000;
    textIso8061 = "1970-01-02T00:00:00.000-01:00";
  },
  {
    timeZone = #fixed(#hoursAndMinutes((7, 34)));
    dateTime = {
      year = 1972;
      month = 2;
      day = 29;
      hour = 7;
      minute = 34;
      nanosecond = 0;
    };
    nanoseconds = 68_169_600_000_000_000;
    textIso8061 = "1972-02-29T07:34:00.000+07:34";
  },
  {
    timeZone = #fixed(#hoursAndMinutes((-7, 2)));
    dateTime = {
      year = 2000;
      month = 1;
      day = 1;
      hour = 0;
      minute = 0;
      nanosecond = 0;
    };
    nanoseconds = 946_710_120_000_000_000;
    textIso8061 = "2000-01-01T00:00:00.000-07:02";
  },
  {
    timeZone = #fixed(#hoursAndMinutes((0, 2)));
    dateTime = {
      year = 2000;
      month = 12;
      day = 31;
      hour = 23;
      minute = 59;
      nanosecond = 59_000_000_000;
    };
    nanoseconds = 978_307_079_000_000_000;
    textIso8061 = "2000-12-31T23:59:59.000+00:02";
  },
  {
    timeZone = #fixed(#hoursAndMinutes((4, 3)));
    dateTime = {
      year = 2020;
      month = 5;
      day = 20;
      hour = 15;
      minute = 30;
      nanosecond = 0;
    };
    nanoseconds = 1_589_974_020_000_000_000;
    textIso8061 = "2020-05-20T15:30:00.000+04:03";
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
  actual : LocalDateTime.LocalDateTime,
  expected : LocalDateTime.LocalDateTime,
) {
  return assertT<LocalDateTime.LocalDateTime>(actual, expected, LocalDateTime.equal, LocalDateTime.toText);
};
func assertComponents(
  actual : Components.Components,
  expected : Components.Components,
) {
  return assertT<Components.Components>(actual, expected, func(a, b) = a == b, func(a) = debug_show (a));
};

func testCaseToText(testCase : TestCase) : Text {
  return testCase.textIso8061;
};

for (testCase in Iter.fromArray(testCases)) {
  let expectedDateTime = LocalDateTime.LocalDateTime(testCase.dateTime, testCase.timeZone);
  Debug.print("Test case: " # testCaseToText(testCase));
  test(
    "fromComponents (Components -> LocalDateTime)",
    func() {
      // From date components
      let ?dateTime = LocalDateTime.fromComponents(testCase.dateTime, testCase.timeZone) else Debug.trap("Could not parse date time components to a datetime");
      assertDateTime(dateTime, expectedDateTime);
    },
  );

  test(
    "toComponents (LocalDateTime -> Components)",
    func() {
      // From nanoseconds
      assertComponents(expectedDateTime.toComponents(), testCase.dateTime);
    },
  );

  test(
    "fromTime (Time -> LocalDateTime)",
    func() {
      // From nanoseconds
      let dateTime = LocalDateTime.fromTime(testCase.nanoseconds, testCase.timeZone);
      assertDateTime(dateTime, expectedDateTime);
    },
  );

  test(
    "toTime (LocalDateTime -> Time)",
    func() {
      // From nanoseconds
      assertT(expectedDateTime.toTime(), testCase.nanoseconds, Int.equal, Int.toText);
    },
  );

  test(
    "toTextFormatted iso8601 (LocalDateTime -> Text)",
    func() {
      // To Iso8601 text
      let actualIso8601 : Text = expectedDateTime.toTextFormatted(#iso8601);
      assertT(actualIso8601, testCase.textIso8061, Text.equal, func(t : Text) : Text = t);

    },
  );

  test(
    "fromTextFormatted iso8601 (Text -> LocalDateTime)",
    func() {
      // From Iso8601 text
      let ?actualIso8601DateTime = LocalDateTime.fromTextFormatted(testCase.textIso8061, #iso8601) else Debug.trap("Could not parse date time components to a datetime");
      assertDateTime(actualIso8601DateTime, expectedDateTime);
    },
  );
};
