import InternalTypes "Types";
import NumberUtil "NumberUtil";
import TextUtil "TextUtil";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Int "mo:base/Int";
import InternalTimeZone "TimeZone";


module Module {

    type Components = InternalTypes.Components;
    type Duration = InternalTypes.Duration;
    type TimeZoneDescriptor = InternalTypes.TimeZoneDescriptor;
    
    public type CalculatedDuration = {
        #adder : (Components) -> Components;
        #absoluteTime : Int;
    };

    public func resolveDuration(duration : Duration) : CalculatedDuration {        
        switch (duration) {
            case (#nanoseconds(nanoseconds)) {
                #absoluteTime(nanoseconds);
            };
            case (#milliseconds(milliseconds)) {
                #absoluteTime(milliseconds * 1_000_000);
            };
            case (#seconds(seconds)) {
                #absoluteTime(seconds * 1_000_000_000);
            };
            case (#minutes(minutes)) {
                #absoluteTime(minutes * 60 * 1_000_000_000);
            };
            case (#hours(hours)) {
                #absoluteTime(hours * 60 * 60 * 1_000_000_000);
            };
            case (#days(days)) {
                #absoluteTime(days * 24 * 60 * 60 * 1_000_000_000);
            };
            case (#weeks(weeks)) {
                #absoluteTime(weeks * 7 * 24 * 60 * 60 * 1_000_000_000);
            };
            case (#months(months)) {
                #adder(func(components : Components) : Components {
                    // TODO validate leap stuff
                    let newMonth : Int = components.month + months;
                    let newYear : Int = components.year + newMonth / 12;
                    let newMonthInYear : Nat = Int.abs(newMonth % 12);
                    let isLeapYear : Bool = Module.isLeapYear(newYear);
                    let maxDaysInMonth : Nat = Module.daysInMonth(newMonthInYear, isLeapYear);
                    let dayIsNotInMonth = components.day > maxDaysInMonth;
                    let newDay : Nat = if(dayIsNotInMonth) {
                        // If not in the month then use the last day of the current month
                        maxDaysInMonth
                    } else {
                        components.day;
                    };
                    {
                        components with
                        year = newYear;
                        month = newMonthInYear;
                        day = newDay;
                    };
                });
            };
            case (#years(years)) {
                #adder(func(components : Components) : Components {
                    // TODO validate leap stuff
                    let newYear : Int = components.year + years;
                    {
                        year = newYear;
                        month = components.month;
                        day = components.day;
                        hour = components.hour;
                        minute = components.minute;
                        nanosecond = components.nanosecond;
                    };
                });
            }
        };
    };
    
    public func toTextFormatted(components : Components, timeZone : TimeZoneDescriptor, format : InternalTypes.TextFormat) : Text {
        let tz = switch(timeZone){
            case (#utc) "Z";
            case (#unspecified) ""; // TODO is this allowed in ISO 8601?
            case (#fixed(f)) {
                let offsetSeconds = InternalTimeZone.getFixedOffsetSeconds(f);
                let h = offsetSeconds / 3600;
                let m = (Int.abs(offsetSeconds) % 3600) / 60;
                let s = Int.abs(offsetSeconds) % 60;
                let hours = TextUtil.toTextPaddedSign(h, 2, true);
                let minutes = TextUtil.toTextPaddedSign(m, 2, false);
                
                if(s > 0) {
                    let seconds = TextUtil.toTextPaddedSign(s, 2, false);
                    hours # ":" # minutes # ":" # seconds;
                } else {
                    hours # ":" # minutes;
                }
            };
        };
        switch (format) {
            case (#iso8601) {
                let seconds = components.nanosecond / 1_000_000_000;
                let milliseconds : Nat = (components.nanosecond - (seconds * 1_000_000_000)) / 1_000_000;
                TextUtil.toTextPaddedSign(components.year, 4, false)
                # "-" #
                TextUtil.toTextPadded(components.month, 2)
                # "-" #
                TextUtil.toTextPadded(components.day, 2)
                # "T" #
                TextUtil.toTextPadded(components.hour, 2)
                # ":" #
                TextUtil.toTextPadded(components.minute, 2)
                # ":" #
                TextUtil.toTextPadded(seconds, 2)
                # "." #
                TextUtil.toTextPadded(milliseconds, 3)
                # tz;
            };
        };
    };
    

    public func daysInYear(year : Int) : Nat {
        let leapYear = isLeapYear(year);
        return if (leapYear) 366 else 365;
    };

    public func isLeapYear(year : Int) : Bool {
        // Leap years are every 4 years, except for every 100 years, except for every 400 years.
        return (year % 4 == 0) and (
            (year % 100 != 0) or (year % 400 == 0)
        );
    };

    public func daysInMonth(month : Nat, isLeapYear : Bool) : Nat {
        switch (month) {
            case (2) if (isLeapYear) 29 else 28;
            case (4 or 6 or 9 or 11) 30;
            case (1 or 3 or 5 or 7 or 8 or 10 or 12) 31;
            case _ Debug.trap("Invalid month: " # Nat.toText(month));
        };
    };
    
}