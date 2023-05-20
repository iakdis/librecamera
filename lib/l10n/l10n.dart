import 'package:flutter/material.dart';

class Localization {
  static final supportedLocales = [
    const Locale('en', ''), //English first, as a fallback

    const Locale('de', ''),
    const Locale('be', ''),
    const Locale('bg', ''),
    const Locale('cs', ''),
    const Locale('es', ''),
    const Locale('eu', ''),
    const Locale('fr', ''),
    const Locale('gl', ''),
    const Locale('id', ''),
    const Locale('it', ''),
    const Locale('ja', ''),
    const Locale('nb', ''),
    const Locale('ms', ''),
    const Locale('pl', ''),
    const Locale('pt', ''),
    const Locale('pt', 'BR'),
    const Locale('ro', ''),
    const Locale('ru', ''),
    const Locale('tr', ''),
    const Locale('uk', ''),
    const Locale('zh', 'Hans'),
  ];

  static String getName(Locale locale) {
    switch (locale.languageCode) {
      case 'de':
        return 'Deutsch';
      case 'be':
        return 'Белару́ская мо́ва';
      case 'bg':
        return 'Български';
      case 'cs':
        return 'Čeština';
      case 'es':
        return 'Español';
      case 'eu':
        return 'Euskara';
      case 'fr':
        return 'Français';
      case 'gl':
        return 'Galego';
      case 'id':
        return 'Bahasa Indonesia';
      case 'it':
        return 'Italiano';
      case 'ja':
        return '日本語';
      case 'nb':
        return 'Norsk bokmål';
      case 'ms':
        return 'Bahasa Melayu';
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
      case 'tr':
        return 'Türkçe';
      case 'uk':
        return 'Українська';
      case 'zh':
        return '中文';
      case 'en':
      default:
        return 'English';
    }
  }
}
