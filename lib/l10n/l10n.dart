import 'package:flutter/material.dart';

class Localization {
  static final supportedLocales = [
    const Locale('en', ''), //English first, as a fallback

    const Locale('de', ''),
    const Locale('es', ''),
    const Locale('pt', ''),
  ];

  static String getName(String languageCode, {String countryCode = ''}) {
    switch (languageCode) {
      case 'de':
        return 'Deutsch';
      case 'es':
        return 'Español';
      case 'pt':
        return 'Português (do Brasil)';
      case 'en':
      default:
        return 'English';
    }
  }
}
