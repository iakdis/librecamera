import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:librecamera/l10n/l10n.dart';
import 'package:librecamera/src/pages/camera_page.dart';
import 'package:librecamera/src/pages/onboarding_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:librecamera/src/provider/locale_provider.dart';
import 'package:librecamera/src/provider/theme_provider.dart';
import 'package:provider/provider.dart';

const defaultThemeColour = Color(0xFF1E88E5);

/// CameraApp is the Main Application.
class CameraApp extends StatelessWidget {
  /// Default Constructor
  const CameraApp({Key? key, required this.onboardingCompleted})
      : super(key: key);

  final bool onboardingCompleted;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      //create: (context) => LocaleProvider(),
      builder: ((context, child) {
        final localeProvider = Provider.of<LocaleProvider>(context);
        final themeProvider = Provider.of<ThemeProvider>(context);

        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            ColorScheme lightColorScheme;
            ColorScheme darkColorScheme;

            if (lightDynamic != null && darkDynamic != null) {
              lightColorScheme = lightDynamic.harmonized();
              darkColorScheme = darkDynamic.harmonized();
            } else {
              lightColorScheme =
                  ColorScheme.fromSeed(seedColor: defaultThemeColour);
              darkColorScheme = ColorScheme.fromSeed(
                  seedColor: defaultThemeColour, brightness: Brightness.dark);
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeProvider.getMaterialThemeMode(),
              theme: themeProvider.theme(colorScheme: lightColorScheme),
              darkTheme: themeProvider.theme(colorScheme: darkColorScheme),
              locale: localeProvider.locale,
              supportedLocales: Localization.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: SafeArea(
                child: onboardingCompleted
                    ? const CameraPage()
                    : const OnboardingPage(),
              ),
            );
          },
        );
      }),
    );
  }
}
