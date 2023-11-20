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
  timeZone : LocalDateTime.TimeZone;
  dateTime : Components.ComponentsWithOffset;
  nanoseconds : Int;
  textIso : Text;
};

let testCases : [TestCase] = [
  {
    timeZone = #fixed(#hours(-7));
    dateTime = {
      year = 1950;
      month = 1;
      day = 1;
      hour = 0;
      minute = 0;
      nanosecond = 0;
      offsetSeconds = -25_200;
    };
    nanoseconds = -631_126_800_000_000_000;
    textIso = "1950-01-01T00:00:00.000000000-07:00";
  },
  {
    timeZone = #fixed(#hours(-5));
    dateTime = {
      year = 1950;
      month = 11;
      day = 12;
      hour = 4;
      minute = 33;
      nanosecond = 0;
      offsetSeconds = -18_000;
    };
    nanoseconds = -603_901_620_000_000_000;
    textIso = "1950-11-12T04:33:00.000000000-05:00";
  },
  {
    timeZone = #fixed(#hours(9));
    dateTime = {
      year = 1970;
      month = 1;
      day = 1;
      hour = 0;
      minute = 0;
      nanosecond = 0;
      offsetSeconds = 32_400;
    };
    nanoseconds = -32_400_000_000_000;
    textIso = "1970-01-01T00:00:00.000000000+09:00";
  },
  {
    timeZone = #fixed(#hours(13));
    dateTime = {
      year = 1970;
      month = 1;
      day = 1;
      hour = 0;
      minute = 1;
      nanosecond = 0;
      offsetSeconds = 46_800;
    };
    nanoseconds = -46_740_000_000_000;
    textIso = "1970-01-01T00:01:00.000000000+13:00";
  },
  {
    timeZone = #fixed(#hours(-1));
    dateTime = {
      year = 1970;
      month = 1;
      day = 2;
      hour = 0;
      minute = 0;
      nanosecond = 0;
      offsetSeconds = -3_600;
    };
    nanoseconds = 90_000_000_000_000;
    textIso = "1970-01-02T00:00:00.000000000-01:00";
  },
  {
    timeZone = #fixed(#seconds(27_240));
    dateTime = {
      year = 1972;
      month = 2;
      day = 29;
      hour = 7;
      minute = 34;
      nanosecond = 0;
      offsetSeconds = 27_240;
    };
    nanoseconds = 68_169_600_000_000_000;
    textIso = "1972-02-29T07:34:00.000000000+07:34";
  },
  {
    timeZone = #fixed(#seconds(-25_320));
    dateTime = {
      year = 2000;
      month = 1;
      day = 1;
      hour = 0;
      minute = 0;
      nanosecond = 0;
      offsetSeconds = -25_320;
    };
    nanoseconds = 946_710_120_000_000_000;
    textIso = "2000-01-01T00:00:00.000000000-07:02";
  },
  {
    timeZone = #fixed(#seconds(120));
    dateTime = {
      year = 2000;
      month = 12;
      day = 31;
      hour = 23;
      minute = 59;
      nanosecond = 59_000_000_000;
      offsetSeconds = 120;
    };
    nanoseconds = 978_307_079_000_000_000;
    textIso = "2000-12-31T23:59:59.000000000+00:02";
  },
  {
    timeZone = #fixed(#seconds(14_580));
    dateTime = {
      year = 2020;
      month = 5;
      day = 20;
      hour = 15;
      minute = 30;
      nanosecond = 0;
      offsetSeconds = 14_580;
    };
    nanoseconds = 1_589_974_020_000_000_000;
    textIso = "2020-05-20T15:30:00.000000000+04:03";
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
  return testCase.textIso;
};

for (testCase in Iter.fromArray(testCases)) {
  let expectedDateTime = LocalDateTime.LocalDateTime(testCase.dateTime, testCase.timeZone);

  let testCaseText = testCaseToText(testCase);
  let format = "YYYY-MM-DDDTHH:mm:ss.SSSSSSSSSZ";
  let localTimeZone = #fixed(#hours(0));

  test(
    "fromComponents (Components -> LocalDateTime): " # testCaseText,
    func() {
      // From date components
      let ?dateTime = LocalDateTime.fromComponents(testCase.dateTime, testCase.timeZone) else Debug.trap("Could not parse date time components to a datetime");
      assertDateTime(dateTime, expectedDateTime);
    },
  );

  test(
    "toComponents (LocalDateTime -> Components): " # testCaseText,
    func() {
      assertComponents(expectedDateTime.toComponents(), testCase.dateTime);
    },
  );

  test(
    "toComponentsWithOffset (LocalDateTime -> Components): " # testCaseText,
    func() {
      let componentsWithOffset = expectedDateTime.toComponentsWithOffset();
      assertComponents(componentsWithOffset, testCase.dateTime);
      assert (componentsWithOffset.offsetSeconds == testCase.dateTime.offsetSeconds);
    },
  );

  test(
    "fromTime (Time -> LocalDateTime): " # testCaseText,
    func() {
      // From nanoseconds
      let dateTime = LocalDateTime.fromTime(testCase.nanoseconds, testCase.timeZone);
      assertDateTime(dateTime, expectedDateTime);
    },
  );

  test(
    "toTime (LocalDateTime -> Time): " # testCaseText,
    func() {
      // From nanoseconds
      assertT(expectedDateTime.toTime(), testCase.nanoseconds, Int.equal, Int.toText);
    },
  );

  test(
    "toTextFormatted iso (LocalDateTime -> Text): " # testCaseText,
    func() {
      // To iso text
      let actualiso : Text = expectedDateTime.toTextFormatted(#iso);
      assertT(actualiso, testCase.textIso, Text.equal, func(t : Text) : Text = t);

    },
  );

  test(
    "fromTextFormatted iso (Text -> LocalDateTime): " # testCaseText,
    func() {
      // From iso text
      let ?actualisoDateTime = LocalDateTime.fromText(testCase.textIso, format, localTimeZone) else Debug.trap("Could not parse date time components to a datetime");
      assertDateTime(actualisoDateTime, expectedDateTime);
    },
  );
};
