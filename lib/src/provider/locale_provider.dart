import 'package:flutter/material.dart';
import 'package:librecamera/l10n/l10n.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:intl/locale.dart' as intl;

Locale? tryParseLocale(final String rawLocale) {
  final intlLocale = intl.Locale.tryParse(rawLocale);
  if (intlLocale != null) {
    return Locale.fromSubtags(
        languageCode: intlLocale.languageCode,
        countryCode: intlLocale.countryCode,
        scriptCode: intlLocale.scriptCode);
  }
  return null;
}

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale {
    _locale = tryParseLocale(Preferences.getLanguage());
    return _locale;
  }

  void setLocale(Locale locale) {
    if (!Localization.supportedLocales.contains(locale)) return;

    Preferences.setLanguage(locale.toLanguageTag());
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    Preferences.setLanguage('');
    _locale = null;
    notifyListeners();
  }
}
