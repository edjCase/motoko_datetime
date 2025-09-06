import Text "mo:core@1/Text";
import Int "mo:core@1/Int";
import Nat "mo:core@1/Nat";
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

};
