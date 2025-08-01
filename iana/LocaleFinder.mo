import Types "Types";
import Text "mo:core/Text";
import Array "mo:core/Array";
import LocaleList "LocaleList";

module {
  type Locale = Types.Locale;

  public func find(localeId : Text) : ?Locale {
    Array.find<Locale>(LocaleList.locales, func(locale) = locale.id == localeId);
  };
};
