import Text "mo:base/Text";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import InternalTimeZone "../internal/TimeZone";
import Components "../src/Components";
import Types "../src/Types";

module {

    public type TimeZoneData = Types.TimeZoneData;

    public type Locale = Types.Locale;

    type Seconds = Int;
    type Year = Int;

    type On = {
        #day : Int;
        #lastSunday;
        #sundayOnOrAfterDay : Int;
    };

    type To = {
        #year : Nat; // To this year
        #only; // Only the specified year
        #max; // Indefinitely
    };

    type Letter = {
        #standard;
        #daylightSavings;
        #war;
        #peace;
    };

    type Duration = {
        hour : Nat;
        minute : Nat;
        second : Nat;
    };

    type Time = Duration and {
        type_ : TimeType;
    };

    type TimeType = {
        #wall;
        #standard;
        #utc;
    };

    type Month = {
        #january;
        #february;
        #march;
        #april;
        #may;
        #june;
        #july;
        #august;
        #september;
        #october;
        #november;
        #december;
    };

    type Rule = {
        name : Text;
        from : Year;
        to : To;
        in_ : Month;
        on : On;
        at : Duration;
        save : Seconds;
        letter : Letter;
    };

    type Zone = {
        name : Text;
        offset : Seconds; // Offset in seconds
        rules : ?Text; // Rule name as a text, or "-" if no rules
        format : Text; // Format as a text
        until : ?Components.Components; // Year, Month, Day as natural numbers, or null
    };

    type RuleOrZone = {
        #rule : Rule;
        #zone : Zone;
    };

    func parseLine(line : Text) : ?RuleOrZone {
        let parts = Text.split(line, #char('\t'));
        switch (parts.next()) {
            case (?"Rule") {
                ? #rule(parseRule(parts));
            };
            case (?"Zone") {
                ? #zone(parseZone(parts));
            };
            case (null) null;
            case (_) Debug.trap("Invalid line: " # line);
        };
    };

    func parseRule(parts : Iter.Iter<Text>) : Rule {
        // Name
        let ?name = parts.next() else Debug.trap("Missing 'Name'");

        // From
        let ?fromText = parts.next() else Debug.trap("Missing 'From'");
        let ?from : ?Nat = Nat.fromText(fromText) else Debug.trap("Invalid 'From' value: " # fromText);

        // TO
        let to : To = switch (parts.next()) {
            case (?"only") #only;
            case (?"max") #max;
            case (?toText) {
                let ?year : ?Nat = Nat.fromText(toText) else Debug.trap("Invalid 'To' value: " # toText);
                #year(year);
            };
            case (null) Debug.trap("Missing 'To'");
        };

        // Type (Obsolete)
        let _ = parts.next() else Debug.trap("Missing 'Type'");

        // In
        let in_ = switch (parts.next()) {
            case (?"Jan") #january;
            case (?"Feb") #february;
            case (?"Mar") #march;
            case (?"Apr") #april;
            case (?"May") #may;
            case (?"Jun") #june;
            case (?"Jul") #july;
            case (?"Aug") #august;
            case (?"Sep") #september;
            case (?"Oct") #october;
            case (?"Nov") #november;
            case (?"Dec") #december;
            case (?invalid) Debug.trap("Invalid month: " # invalid);
            case (null) Debug.trap("Missing 'Month'");
        };

        // On
        let on = switch (parts.next()) {
            case (?"lastSun") #lastSunday;
            case (?onText) {
                switch (Nat.fromText(onText)) {
                    case (?day) #day(day);
                    case (null) {
                        switch (Text.stripStart(onText, #text("Sun>="))) {
                            case (?dayText) {
                                let ?day : ?Nat = Nat.fromText(dayText) else Debug.trap("Invalid 'On' value: " # onText);
                                #sundayOnOrAfterDay(day);
                            };
                            case (null) {
                                Debug.trap("Invalid 'On' value: " # onText);
                            };
                        };
                    };
                };
            };
            case (null) Debug.trap("Missing 'On'");
        };
        // At
        let ?atText = parts.next() else Debug.trap("Missing 'At'");
        let at = parseTime(atText);

        // Save
        let ?saveText = parts.next() else Debug.trap("Missing 'Save'");
        let saveTime = parseTime(saveText);
        let save = saveTime.hour * 60 * 60 + saveTime.minute * 60 + saveTime.second;

        // Letter/s
        let ?letterText = parts.next() else Debug.trap("Missing 'Letter'");
        let letter = switch (letterText) {
            case ("D") #daylightSavings;
            case ("S") #standard;
            case ("W") #war;
            case ("P") #peace;
            case (t) Debug.trap("Invalid 'Letter' value: " # t);
        };

        {
            name = name;
            from = from;
            to = to;
            in_ = in_;
            on = on;
            at = at;
            save = save;
            letter = letter;
        };
    };

    func parseTime(text : Text) : Time {
        let parts = Text.split(text, #char(':'));
        let ?hourText = parts.next() else Debug.trap("Missing 'Hour'");
        let hour = switch (parseSubTime(hourText)) {
            case (?(h, ?s)) {
                return {
                    hour = h;
                    minute = 0;
                    second = 0;
                    type_ = s;
                };
            };
            case (?(h, null)) h;
            case (null) Debug.trap("Invalid 'Hour' value: " # hourText);
        };

        // Parse minute
        let minute = switch (parts.next()) {
            case (?minuteText) {
                switch (parseSubTime(minuteText)) {
                    case (?(m, ?s)) {
                        return {
                            hour = hour;
                            minute = m;
                            second = 0;
                            type_ = s;
                        };
                    };
                    case (?(m, null)) m;
                    case (null) Debug.trap("Invalid 'Minute' value: " # minuteText);
                };
            };
            case (null) {
                return {
                    hour = hour;
                    minute = 0;
                    second = 0;
                    type_ = #standard;
                };
            };
        };

        // Parse second
        let second = switch (parts.next()) {
            case (?secondText) {
                switch (parseSubTime(secondText)) {
                    case (?(sec, ?s)) {
                        return {
                            hour = hour;
                            minute = minute;
                            second = sec;
                            type_ = s;
                        };
                    };
                    case (?(sec, null)) sec;
                    case (null) Debug.trap("Invalid 'Second' value: " # secondText);
                };
            };
            case (null) {
                return {
                    hour = hour;
                    minute = minute;
                    second = 0;
                    type_ = #standard;
                };
            };
        };

        {
            hour = hour;
            minute = minute;
            second = second;
            type_ = #standard;
        };
    };

    func parseSubTime(part : Text) : ?(Nat, ?TimeType) {
        do ? {
            if (part.size() == 2) {
                let timeValue : Nat = Nat.fromText(part)!;
                (timeValue, null);
            } else if (part.size() == 3) {
                let iter = Text.toIter(part);
                let firstMinuteChar : Char = iter.next()!;
                let secondMinuteChar : Char = iter.next()!;
                let suffix : ?Char = iter.next();
                let minuteText = Text.fromChar(firstMinuteChar) # Text.fromChar(secondMinuteChar);
                let minute : Nat = Nat.fromText(minuteText)!;

                let s = switch (suffix) {
                    case (?'w' or null) #wall;
                    case (?'s') #standard;
                    case (?'u') #utc;
                    case (?s) Debug.trap("Invalid time suffix value: " # Text.fromChar(s));
                };
                (minute, ?s);
            } else {
                // Invalid size
                return null;
            };
        };
    };

    func parseZone(parts : Iter.Iter<Text>) : Zone {
        let ?name = parts.next() else Debug.trap("Missing 'Name'");
        let ?offsetText = parts.next() else Debug.trap("Missing 'GMT Offset'");
        let offset = switch (InternalTimeZone.parseDescriptor(offsetText)) {
            case (#fixed(#seconds(s))) s;
            case (#fixed(#hours(h))) h;
            case (#utc) 0;
            case (_) Debug.trap("Invalid 'GMT Offset' value: " # offsetText);
        };
        let ?rules = parts.next() else Debug.trap("Missing 'Rules'");
        let ?format = parts.next() else Debug.trap("Missing 'Format'");
        let until : ?Components.Components = switch (parts.next()) {
            case (?untilText) {
                let parts = Text.split(untilText, #char(' '));
                let year = switch (parts.next()) {
                    case (?yearText) {
                        let ?year = Nat.fromText(yearText) else Debug.trap("Invalid 'Year' value: " # yearText);
                        year;
                    };
                    case (null) Debug.trap("Invalid 'Until' value: " # untilText);
                };
                var month = 1;
                var day = 1;
                var hour = 0;
                var minute = 0;
                var nanosecond = 0;
                switch (parts.next()) {
                    case (?monthText) {
                        month := switch (monthText) {
                            case ("Jan") 1;
                            case ("Feb") 2;
                            case ("Mar") 3;
                            case ("Apr") 4;
                            case ("May") 5;
                            case ("Jun") 6;
                            case ("Jul") 7;
                            case ("Aug") 8;
                            case ("Sep") 9;
                            case ("Oct") 10;
                            case ("Nov") 11;
                            case ("Dec") 12;
                            case (t) Debug.trap("Invalid 'Month' value: " # t);
                        };

                        switch (parts.next()) {
                            case (?dayText) {
                                let ?_ = Nat.fromText(dayText) else Debug.trap("Invalid 'Day' value: " # dayText);
                                day := day;

                                switch (parts.next()) {
                                    case (?timeText) {
                                        let time = parseTime(timeText);
                                        hour := time.hour;
                                        minute := time.minute;
                                        nanosecond := time.second * 1000000000;
                                    };
                                    case (null) {
                                        // Skip
                                    };
                                };
                            };
                            case (null) {
                                // Skip
                            };
                        };
                    };
                    case (null) {
                        // Skip
                    };
                };

                ?{
                    year = year;
                    month = month;
                    day = day;
                    hour = hour;
                    minute = minute;
                    nanosecond = nanosecond;
                };
            };
            case (null) null;
        };

        {
            name = name;
            offset = offset;
            rules = if (rules == "-") null else ?rules;
            format = format;
            until = until;
        };
    };
};
