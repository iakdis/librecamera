import 'package:flutter/material.dart';
import 'package:librecamera/l10n/l10n.dart';
import 'package:librecamera/src/utils/preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale {
    _locale = Preferences.getLanguage().isNotEmpty
        ? Locale(Preferences.getLanguage())
        : null;
    return _locale;
  }

  void setLocale(Locale locale) {
    if (!Localization.supportedLocales.contains(locale)) return;

    Preferences.setLanguage(locale.languageCode);
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    Preferences.setLanguage('');
    _locale = null;
    notifyListeners();
  }
}
