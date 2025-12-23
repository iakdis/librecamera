import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:librecamera/src/utils/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  CustomThemeMode _themeMode = CustomThemeMode.values.byName(
    Preferences.getThemeMode(),
  );
  CustomThemeMode get themeMode => _themeMode;

  ThemeData theme({required ColorScheme colorScheme}) {
    final isBlack = themeMode == CustomThemeMode.black;

    return ThemeData(
      colorScheme: isBlack
          ? colorScheme.copyWith(surface: Colors.black).harmonized()
          : colorScheme,
      useMaterial3: Preferences.getUseMaterial3(),
      scaffoldBackgroundColor: isBlack ? Colors.black : null,
    );
  }

  ThemeMode getMaterialThemeMode() {
    switch (themeMode) {
      case .system:
        return ThemeMode.system;
      case .light:
        return ThemeMode.light;
      case .dark:
      case .black:
        return ThemeMode.dark;
    }
  }

  Future<void> setTheme(CustomThemeMode theme) async {
    await Preferences.setThemeMode(theme.name);
    _themeMode = theme.name.isNotEmpty
        ? CustomThemeMode.values.byName(Preferences.getThemeMode())
        : CustomThemeMode.system;
    notifyListeners();
  }
}

enum CustomThemeMode {
  system,
  light,
  dark,
  black,
}

const Color seedColor = Color(0xFF1E88E5);
const Color primaryColor = Color.fromARGB(255, 255, 255, 255);
