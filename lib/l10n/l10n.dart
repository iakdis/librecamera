import 'package:flutter/material.dart';

class Localization {
  static final supportedLocales = [
    const Locale('de', ''),
    const Locale('en', ''),
  ];

  static String getName(String code) {
    switch (code) {
      case 'de':
        return 'Deutsch';
      case 'en':
      default:
        return 'English';
    }
  }
}
