import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:librecamera/src/utils/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  CustomThemeMode? _themeMode;

  CustomThemeMode themeMode() {
    _themeMode = Preferences.getThemeMode().isNotEmpty
        ? CustomThemeMode.values.byName(Preferences.getThemeMode())
        : CustomThemeMode.system;
    return _themeMode!;
  }

  ThemeData theme({required ColorScheme colorScheme}) {
    final isBlack = themeMode() == CustomThemeMode.black;

    return ThemeData(
      colorScheme: isBlack
          ? colorScheme
              .copyWith(background: Colors.black, surface: Colors.black)
              .harmonized()
          : colorScheme,
      useMaterial3: Preferences.getUseMaterial3(),
      scaffoldBackgroundColor: isBlack ? Colors.black : null,
    );
  }

  ThemeMode getMaterialThemeMode() {
    switch (themeMode()) {
      case CustomThemeMode.system:
        return ThemeMode.system;
      case CustomThemeMode.light:
        return ThemeMode.light;
      case CustomThemeMode.dark:
      case CustomThemeMode.black:
        return ThemeMode.dark;
    }
  }

  void setTheme(CustomThemeMode theme) {
    Preferences.setThemeMode(theme.name);
    _themeMode = theme;
    notifyListeners();
  }
}

enum CustomThemeMode {
  system,
  light,
  dark,
  black,
}
