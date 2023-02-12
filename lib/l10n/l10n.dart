import 'package:flutter/material.dart';

class Localization {
  static final supportedLocales = [
    const Locale('en', ''), //English first, as a fallback

    const Locale('de', ''),
    const Locale('bg', ''),
    const Locale('es', ''),
    const Locale('eu', ''),
    const Locale('fr', ''),
    const Locale('gl', ''),
    const Locale('ja', ''),
    const Locale('nb', ''),
    const Locale('pl', ''),
    const Locale('pt', ''),
    const Locale('ru', ''),
    const Locale('tr', ''),
    const Locale('uk', ''),
  ];

  static String getName(Locale locale) {
    switch (locale.languageCode) {
      case 'de':
        return 'Deutsch';
      case 'bg':
        return 'Български';
      case 'es':
        return 'Español';
      case 'eu':
        return 'Euskara';
      case 'fr':
        return 'Français';
      case 'gl':
        return 'Galego';
      case 'ja':
        return '日本語';
      case 'nb':
        return 'Norsk bokmål';
      case 'pl':
        return 'Polski';
      case 'pt':
        return 'Português (do Brasil)';
      case 'ru':
        return 'Русский';
      case 'tr':
        return 'Türkçe';
      case 'uk':
        return 'Українська';
      case 'en':
      default:
        return 'English';
    }
  }
}
