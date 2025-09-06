import Types "Types";
import Text "mo:core@1/Text";
import Array "mo:core@1/Array";
import LocaleList "LocaleList";

module {
  type Locale = Types.Locale;

  public func find(localeId : Text) : ?Locale {
    Array.find<Locale>(LocaleList.locales, func(locale) = locale.id == localeId);
  };
};
