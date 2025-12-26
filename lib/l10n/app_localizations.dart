import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_be.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_eo.dart';
import 'app_localizations_es.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_grc.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_ia.dart';
import 'app_localizations_id.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_nn.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sat.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('be'),
    Locale('bg'),
    Locale('ca'),
    Locale('cs'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('eo'),
    Locale('es'),
    Locale('eu'),
    Locale('fr'),
    Locale('gl'),
    Locale('grc'),
    Locale('hu'),
    Locale('ia'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('lv'),
    Locale('ml'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('nn'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('sat'),
    Locale('sl'),
    Locale('ta'),
    Locale('tr'),
    Locale('uk'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'APP SETTINGS'**
  String get appSettings;

  /// No description provided for @autoSmall.
  ///
  /// In en, this message translates to:
  /// **'AUTO'**
  String get autoSmall;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @cameraBehaviour.
  ///
  /// In en, this message translates to:
  /// **'CAMERA BEHAVIOUR'**
  String get cameraBehaviour;

  /// No description provided for @captureAtVolumePress.
  ///
  /// In en, this message translates to:
  /// **'Capture at volume press'**
  String get captureAtVolumePress;

  /// No description provided for @captureAtVolumePress_description.
  ///
  /// In en, this message translates to:
  /// **'When enabled, pressing a volume button will capture a picture or record a video'**
  String get captureAtVolumePress_description;

  /// No description provided for @choosePath.
  ///
  /// In en, this message translates to:
  /// **'Choose path'**
  String get choosePath;

  /// No description provided for @defaultExposure.
  ///
  /// In en, this message translates to:
  /// **'Default exposure'**
  String get defaultExposure;

  /// No description provided for @disableAudio.
  ///
  /// In en, this message translates to:
  /// **'Disable audio'**
  String get disableAudio;

  /// No description provided for @disableAudio_description.
  ///
  /// In en, this message translates to:
  /// **'Disable audio when recording a video'**
  String get disableAudio_description;

  /// No description provided for @enableCompression.
  ///
  /// In en, this message translates to:
  /// **'Enable compression'**
  String get enableCompression;

  /// No description provided for @enableCompression_description.
  ///
  /// In en, this message translates to:
  /// **'Use compression when saving images to save storage space.'**
  String get enableCompression_description;

  /// No description provided for @enableExposureSlider.
  ///
  /// In en, this message translates to:
  /// **'Enable exposure slider'**
  String get enableExposureSlider;

  /// No description provided for @enableExposureSlider_description.
  ///
  /// In en, this message translates to:
  /// **'When enabled, a slider will appear to manually adjust the exposure'**
  String get enableExposureSlider_description;

  /// No description provided for @enableMaximumScreenBrightness.
  ///
  /// In en, this message translates to:
  /// **'Maximum screen brightness'**
  String get enableMaximumScreenBrightness;

  /// No description provided for @enableMaximumScreenBrightness_description.
  ///
  /// In en, this message translates to:
  /// **'When enabled, the screen brightness of your device will be set to the maximum'**
  String get enableMaximumScreenBrightness_description;

  /// No description provided for @enableModeRow.
  ///
  /// In en, this message translates to:
  /// **'Enable focus and exposure mode row'**
  String get enableModeRow;

  /// No description provided for @enableModeRow_description.
  ///
  /// In en, this message translates to:
  /// **'Enable a row at the bottom to switch the exposure and focus modes'**
  String get enableModeRow_description;

  /// No description provided for @enableZoomSlider.
  ///
  /// In en, this message translates to:
  /// **'Enable zoom slider'**
  String get enableZoomSlider;

  /// No description provided for @enableZoomSlider_description.
  ///
  /// In en, this message translates to:
  /// **'When enabled, a slider will appear to manually adjust the zoom'**
  String get enableZoomSlider_description;

  /// No description provided for @exposureMode.
  ///
  /// In en, this message translates to:
  /// **'Exposure mode'**
  String get exposureMode;

  /// No description provided for @exposureModeAuto.
  ///
  /// In en, this message translates to:
  /// **'AUTO EXPOSURE'**
  String get exposureModeAuto;

  /// No description provided for @exposureModeLocked.
  ///
  /// In en, this message translates to:
  /// **'LOCKED EXPOSURE'**
  String get exposureModeLocked;

  /// No description provided for @flashlight.
  ///
  /// In en, this message translates to:
  /// **'Flashlight'**
  String get flashlight;

  /// No description provided for @flipPhotosFrontCamera.
  ///
  /// In en, this message translates to:
  /// **'Flip photos on front camera'**
  String get flipPhotosFrontCamera;

  /// No description provided for @flipPhotosFrontCamera_description.
  ///
  /// In en, this message translates to:
  /// **'Flip photos horizontally that were taken with front camera'**
  String get flipPhotosFrontCamera_description;

  /// No description provided for @flipToFrontCamera.
  ///
  /// In en, this message translates to:
  /// **'Flip to front camera'**
  String get flipToFrontCamera;

  /// No description provided for @flipToRearCamera.
  ///
  /// In en, this message translates to:
  /// **'Flip to rear camera'**
  String get flipToRearCamera;

  /// No description provided for @focusMode.
  ///
  /// In en, this message translates to:
  /// **'Focus mode'**
  String get focusMode;

  /// No description provided for @focusModeAuto.
  ///
  /// In en, this message translates to:
  /// **'AUTO FOCUS'**
  String get focusModeAuto;

  /// No description provided for @focusModeLocked.
  ///
  /// In en, this message translates to:
  /// **'LOCKED FOCUS'**
  String get focusModeLocked;

  /// No description provided for @format.
  ///
  /// In en, this message translates to:
  /// **'Image compression format'**
  String get format;

  /// No description provided for @format_description.
  ///
  /// In en, this message translates to:
  /// **'Change the image compression format (default: JPEG/JPG)'**
  String get format_description;

  /// No description provided for @fps.
  ///
  /// In en, this message translates to:
  /// **'Video frame rate'**
  String get fps;

  /// No description provided for @fps_description.
  ///
  /// In en, this message translates to:
  /// **'High frame rates above 60 fps depend on your device and the selected resolution'**
  String get fps_description;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @giveCameraPermission.
  ///
  /// In en, this message translates to:
  /// **'Give camera permission'**
  String get giveCameraPermission;

  /// No description provided for @giveMicrophonePermission.
  ///
  /// In en, this message translates to:
  /// **'Give microphone permission'**
  String get giveMicrophonePermission;

  /// No description provided for @giveStoragePermission.
  ///
  /// In en, this message translates to:
  /// **'Give storage permission'**
  String get giveStoragePermission;

  /// No description provided for @imageCompressionQuality.
  ///
  /// In en, this message translates to:
  /// **'Image compression quality'**
  String get imageCompressionQuality;

  /// No description provided for @imageCompressionQuality_description.
  ///
  /// In en, this message translates to:
  /// **'Lower compression quality means smaller size but worse quality, while higher compression quality means bigger size but better quality'**
  String get imageCompressionQuality_description;

  /// No description provided for @keepEXIFMetadata.
  ///
  /// In en, this message translates to:
  /// **'Save EXIF data'**
  String get keepEXIFMetadata;

  /// No description provided for @keepEXIFMetadata_description.
  ///
  /// In en, this message translates to:
  /// **'Save EXIF metadata of the taken picture like phone model, GPS location, etc.'**
  String get keepEXIFMetadata_description;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @language_description.
  ///
  /// In en, this message translates to:
  /// **'Change the app language'**
  String get language_description;

  /// No description provided for @leftHandedMode.
  ///
  /// In en, this message translates to:
  /// **'Left-handed mode'**
  String get leftHandedMode;

  /// No description provided for @leftHandedMode_description.
  ///
  /// In en, this message translates to:
  /// **'When enabled, switch the position of the camera controls in landscape for left-handed mode'**
  String get leftHandedMode_description;

  /// No description provided for @less.
  ///
  /// In en, this message translates to:
  /// **'SHOW LESS'**
  String get less;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'The code is licensed under the GPLv3 on GitHub. If you encounter any problems or want to request a feature, please open an issue on GitHub. Thanks!'**
  String get license;

  /// No description provided for @lockCaptureOrientation.
  ///
  /// In en, this message translates to:
  /// **'Lock auto orientation [RESTART REQUIRED]'**
  String get lockCaptureOrientation;

  /// No description provided for @lockCaptureOrientation_description.
  ///
  /// In en, this message translates to:
  /// **'Lock orientation to portrait mode, no matter if automatic rotation mode is activated'**
  String get lockCaptureOrientation_description;

  /// No description provided for @lockedSmall.
  ///
  /// In en, this message translates to:
  /// **'LOCKED'**
  String get lockedSmall;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'MORE'**
  String get more;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// No description provided for @onboardingScreen.
  ///
  /// In en, this message translates to:
  /// **'Onboarding screen'**
  String get onboardingScreen;

  /// No description provided for @onboardingScreen_description.
  ///
  /// In en, this message translates to:
  /// **'Open the initial onboarding screen'**
  String get onboardingScreen_description;

  /// No description provided for @openCapturedPictureOrVideo.
  ///
  /// In en, this message translates to:
  /// **'Open captured picture or video'**
  String get openCapturedPictureOrVideo;

  /// No description provided for @pauseVideo.
  ///
  /// In en, this message translates to:
  /// **'Pause video'**
  String get pauseVideo;

  /// No description provided for @permissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'PERMISSIONS'**
  String get permissionsTitle;

  /// No description provided for @permissionsTitle_description.
  ///
  /// In en, this message translates to:
  /// **'To use the camera, you need to give permission to your camera and storage.'**
  String get permissionsTitle_description;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @resolution.
  ///
  /// In en, this message translates to:
  /// **'Resolution'**
  String get resolution;

  /// No description provided for @resolution_description.
  ///
  /// In en, this message translates to:
  /// **'Change the camera resolution'**
  String get resolution_description;

  /// No description provided for @resumeVideo.
  ///
  /// In en, this message translates to:
  /// **'Resume video'**
  String get resumeVideo;

  /// No description provided for @savePath.
  ///
  /// In en, this message translates to:
  /// **'Save path'**
  String get savePath;

  /// No description provided for @savePathTitle.
  ///
  /// In en, this message translates to:
  /// **'SAVE PATH'**
  String get savePathTitle;

  /// No description provided for @savePathTitle_description.
  ///
  /// In en, this message translates to:
  /// **'Select a save path. Typically, images get saved to the DCIM path on Android.'**
  String get savePathTitle_description;

  /// No description provided for @savePath_description.
  ///
  /// In en, this message translates to:
  /// **'Current path: {path}'**
  String savePath_description(String path);

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'SAVING'**
  String get saving;

  /// No description provided for @selectPath.
  ///
  /// In en, this message translates to:
  /// **'Select path'**
  String get selectPath;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @shutterSound.
  ///
  /// In en, this message translates to:
  /// **'Enable shutter sound'**
  String get shutterSound;

  /// No description provided for @shutterSound_description.
  ///
  /// In en, this message translates to:
  /// **'Enable the shutter sound when taking a picture'**
  String get shutterSound_description;

  /// No description provided for @startRecordingVideo.
  ///
  /// In en, this message translates to:
  /// **'Start recording video'**
  String get startRecordingVideo;

  /// No description provided for @startWithFrontCamera.
  ///
  /// In en, this message translates to:
  /// **'Start with front camera'**
  String get startWithFrontCamera;

  /// No description provided for @startWithFrontCamera_description.
  ///
  /// In en, this message translates to:
  /// **'Always start with front camera when opening the app'**
  String get startWithFrontCamera_description;

  /// No description provided for @stopVideo.
  ///
  /// In en, this message translates to:
  /// **'Stop video'**
  String get stopVideo;

  /// No description provided for @switchToPictureMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to picture mode'**
  String get switchToPictureMode;

  /// No description provided for @switchToVideoRecordingMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to video recording mode'**
  String get switchToVideoRecordingMode;

  /// No description provided for @systemLanguage.
  ///
  /// In en, this message translates to:
  /// **'System language'**
  String get systemLanguage;

  /// No description provided for @takePicture.
  ///
  /// In en, this message translates to:
  /// **'Take picture'**
  String get takePicture;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeBlack.
  ///
  /// In en, this message translates to:
  /// **'Black theme'**
  String get themeBlack;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light theme'**
  String get themeLight;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System theme'**
  String get themeSystem;

  /// No description provided for @theme_description.
  ///
  /// In en, this message translates to:
  /// **'Change the app theme'**
  String get theme_description;

  /// No description provided for @timer.
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get timer;

  /// No description provided for @useMaterialYou.
  ///
  /// In en, this message translates to:
  /// **'Use Material You'**
  String get useMaterialYou;

  /// No description provided for @useMaterialYou_description.
  ///
  /// In en, this message translates to:
  /// **'Use the Material You design. Set to false for the old Material design'**
  String get useMaterialYou_description;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version {versionNumber}'**
  String version(String versionNumber);

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'WELCOME'**
  String get welcomeTitle;

  /// No description provided for @welcomeTitle_description.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You are ready to use this camera app.'**
  String get welcomeTitle_description;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'be',
    'bg',
    'ca',
    'cs',
    'de',
    'el',
    'en',
    'eo',
    'es',
    'eu',
    'fr',
    'gl',
    'grc',
    'hu',
    'ia',
    'id',
    'is',
    'it',
    'ja',
    'ko',
    'lv',
    'ml',
    'ms',
    'nb',
    'nl',
    'nn',
    'pl',
    'pt',
    'ro',
    'ru',
    'sat',
    'sl',
    'ta',
    'tr',
    'uk',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'be':
      return AppLocalizationsBe();
    case 'bg':
      return AppLocalizationsBg();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'eo':
      return AppLocalizationsEo();
    case 'es':
      return AppLocalizationsEs();
    case 'eu':
      return AppLocalizationsEu();
    case 'fr':
      return AppLocalizationsFr();
    case 'gl':
      return AppLocalizationsGl();
    case 'grc':
      return AppLocalizationsGrc();
    case 'hu':
      return AppLocalizationsHu();
    case 'ia':
      return AppLocalizationsIa();
    case 'id':
      return AppLocalizationsId();
    case 'is':
      return AppLocalizationsIs();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'lv':
      return AppLocalizationsLv();
    case 'ml':
      return AppLocalizationsMl();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'nn':
      return AppLocalizationsNn();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sat':
      return AppLocalizationsSat();
    case 'sl':
      return AppLocalizationsSl();
    case 'ta':
      return AppLocalizationsTa();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
