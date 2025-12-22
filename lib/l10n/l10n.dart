import 'package:flutter/material.dart';

class Localization {
  static final supportedLocales = [
    const Locale('en', ''), //English first, as a fallback

    const Locale('ar', ''),
    const Locale('be', ''),
    const Locale('bg', ''),
    const Locale('ca', ''),
    const Locale('cs', ''),
    const Locale('de', ''),
    const Locale('el', ''),
    const Locale('eo', ''),
    const Locale('es', ''),
    const Locale('eu', ''),
    const Locale('fr', ''),
    const Locale('gl', ''),
    const Locale('hu', ''),
    const Locale('ia', ''),
    const Locale('id', ''),
    const Locale('is', ''),
    const Locale('it', ''),
    const Locale('ja', ''),
    const Locale('ko', ''),
    const Locale('lv', ''),
    const Locale('ml', ''),
    const Locale('ms', ''),
    const Locale('nb', ''),
    const Locale('nl', ''),
    const Locale('nn', ''),
    const Locale('pl', ''),
    const Locale('pt', ''),
    const Locale('pt', 'BR'),
    const Locale('ro', ''),
    const Locale('ru', ''),
    const Locale('sat', ''),
    const Locale('sl', ''),
    const Locale('ta', ''),
    const Locale('tr', ''),
    const Locale('uk', ''),
    const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  static String getName(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return 'العربية';
      case 'be':
        return 'Белару́ская мо́ва';
      case 'bg':
        return 'Български';
      case 'ca':
        return 'Català';
      case 'cs':
        return 'Čeština';
      case 'de':
        return 'Deutsch';
      case 'el':
        return 'Ελληνικά';
      case 'eo':
        return 'Esperanto';
      case 'es':
        return 'Español';
      case 'eu':
        return 'Euskara';
      case 'fr':
        return 'Français';
      case 'gl':
        return 'Galego';
      case 'hu':
        return 'Magyar';
      case 'ia':
        return 'Interlingua';
      case 'id':
        return 'Bahasa Indonesia';
      case 'is':
        return 'Íslenska';
      case 'it':
        return 'Italiano';
      case 'ja':
        return '日本語';
      case 'ko':
        return '한국어';
      case 'lv':
        return 'Latviešu';
      case 'ml':
        return 'മലയാളം';
      case 'ms':
        return 'Bahasa Melayu';
      case 'nb':
        return 'Norsk bokmål';
      case 'nl':
        return 'Nederlands';
      case 'nn':
        return 'Norsk nynorsk';
      case 'pl':
        return 'Polski';
      case 'pt':
        if (locale.countryCode == 'BR') {
          return 'Português (do Brasil)';
        } else {
          return 'Português';
        }
      case 'ro':
        return 'Română';
      case 'ru':
        return 'Русский';
      case 'sat':
        return 'Santali';
      case 'sl':
        return 'Slovenščina';
      case 'ta':
        return 'தமிழ்';
      case 'tr':
        return 'Türkçe';
      case 'uk':
        return 'Українська';
      case 'zh':
        if (locale.scriptCode == 'Hant' || locale.countryCode == 'Hant') {
          return '中文 (繁體)';
        }
        return '中文';
      case 'en':
      default:
        return 'English';
    }
  }
}

class FallbackMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['sat', 'ia', 'eo', 'nn'].contains(locale.languageCode);
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return DefaultMaterialLocalizations.load(const Locale('en'));
  }

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<MaterialLocalizations> old,
  ) {
    return false;
  }
}
