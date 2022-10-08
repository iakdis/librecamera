import 'package:flutter/material.dart';

class Localization {
  static final supportedLocales = [
    const Locale('en', ''), //English first, as a fallback

    const Locale('de', ''),
    const Locale('es', ''),
  ];

  static String getName(String code) {
    switch (code) {
      case 'de':
        return 'Deutsch';
      case 'es':
        return 'Español';
      case 'en':
      default:
        return 'English';
    }
  }
}
