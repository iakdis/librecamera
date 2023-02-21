import 'package:flutter/material.dart';
import 'package:librecamera/l10n/l10n.dart';
import 'package:librecamera/src/pages/camera_page.dart';
import 'package:librecamera/src/pages/onboarding_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:librecamera/src/provider/locale_provider.dart';
import 'package:librecamera/src/provider/theme_provider.dart';
import 'package:provider/provider.dart';

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

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode(),
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
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
      }),
    );
  }
}
