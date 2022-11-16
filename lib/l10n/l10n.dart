import 'package:flutter/material.dart';

class Localization {
  static final supportedLocales = [
    const Locale('en', ''), //English first, as a fallback

    const Locale('de', ''),
    const Locale('es', ''),
    const Locale('fr', ''),
    const Locale('ja', ''),
    const Locale('pt', ''),
    const Locale('ru', ''),
    const Locale('tr', ''),
  ];

  static String getName(String languageCode, {String countryCode = ''}) {
    switch (languageCode) {
      case 'de':
        return 'Deutsch';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'ja':
        return '日本語';
      case 'pt':
        return 'Português (do Brasil)';
      case 'ru':
        return 'Русский';
      case 'tr':
        return 'Türkçe';
      case 'en':
      default:
        return 'English';
    }
  }
}
