import 'package:flutter/material.dart';
import 'package:librecamera/src/utils/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? _themeMode;

  ThemeMode? themeMode() {
    _themeMode = Preferences.getThemeMode().isNotEmpty
        ? Themes.getThemeModeFromName(Preferences.getThemeMode())
        : ThemeMode.system;
    return _themeMode;
  }

  void setTheme(ThemeMode theme) {
    Preferences.setThemeMode(theme.name);
    _themeMode = theme;
    notifyListeners();
  }
}

class Themes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(primary: Colors.blue),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(primary: Colors.blue),
  );

  static ThemeMode getThemeModeFromName(String themeModeName) {
    if (themeModeName == ThemeMode.system.name) {
      return ThemeMode.system;
    } else if (themeModeName == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (themeModeName == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}
