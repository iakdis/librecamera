import 'package:flutter/material.dart';
import 'package:intl/locale.dart' as intl;
import 'package:librecamera/l10n/l10n.dart';
import 'package:librecamera/src/utils/preferences.dart';

Locale? tryParseLocale(String rawLocale) {
  final intlLocale = intl.Locale.tryParse(rawLocale);
  if (intlLocale != null) {
    return Locale.fromSubtags(
      languageCode: intlLocale.languageCode,
      countryCode: intlLocale.countryCode,
      scriptCode: intlLocale.scriptCode,
    );
  }
  return null;
}

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    if (!Localization.supportedLocales.contains(locale)) return;

    await Preferences.setLanguage(locale.toLanguageTag());
    _locale = tryParseLocale(locale.toLanguageTag());
    notifyListeners();
  }

  Future<void> clearLocale() async {
    await Preferences.setLanguage('');
    _locale = null;
    notifyListeners();
  }
}
