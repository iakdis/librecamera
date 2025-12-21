// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Esperanto (`eo`).
class AppLocalizationsEo extends AppLocalizations {
  AppLocalizationsEo([String locale = 'eo']) : super(locale);

  @override
  String get permissionsTitle => 'PERMESOJ';

  @override
  String get permissionsTitle_description =>
      'To use the camera, you need to give permission to your camera and storage.';

  @override
  String get giveCameraPermission => 'Give camera permission';

  @override
  String get giveMicrophonePermission => 'Give microphone permission';

  @override
  String get giveStoragePermission => 'Give storage permission';

  @override
  String get savePathTitle => 'SAVE PATH';

  @override
  String get savePathTitle_description =>
      'Select a save path. Typically, images get saved to the DCIM path on Android.';

  @override
  String get selectPath => 'Select path';

  @override
  String get welcomeTitle => 'BONVENON';

  @override
  String get welcomeTitle_description =>
      'Gratulon! Vi pretas uzi ĉi tiun fotilan programon.';

  @override
  String get getStarted => 'Get started';

  @override
  String get switchToPictureMode => 'Switch to picture mode';

  @override
  String get switchToVideoRecordingMode => 'Switch to video recording mode';

  @override
  String get openCapturedPictureOrVideo => 'Open captured picture or video';

  @override
  String get takePicture => 'Foti';

  @override
  String get startRecordingVideo => 'Ekregistri filmon';

  @override
  String get pauseVideo => 'Paŭzigi filmon';

  @override
  String get resumeVideo => 'Malpaŭzigi filmon';

  @override
  String get stopVideo => 'Ĉesigi filmon';

  @override
  String get exposureMode => 'Exposure mode';

  @override
  String get exposureModeAuto => 'AUTO EXPOSURE';

  @override
  String get exposureModeLocked => 'LOCKED EXPOSURE';

  @override
  String get defaultExposure => 'Default exposure';

  @override
  String get flashlight => 'Flashlight';

  @override
  String get lockCaptureOrientation =>
      'Lock auto orientation [RESTART REQUIRED]';

  @override
  String get lockCaptureOrientation_description =>
      'Lock orientation to portrait mode, no matter if automatic rotation mode is activated';

  @override
  String get showNavigationBar => 'Show navigation bar [RESTART REQUIRED]';

  @override
  String get showNavigationBar_description =>
      'Always show the Android navigation bar';

  @override
  String get focusMode => 'Fokusa reĝimo';

  @override
  String get focusModeAuto => 'AŬTOMATA FOKUSO';

  @override
  String get focusModeLocked => 'ŜLOSITA FOKUSO';

  @override
  String get reset => 'Reset';

  @override
  String get flipToFrontCamera => 'Flip to front camera';

  @override
  String get flipToRearCamera => 'Flip to rear camera';

  @override
  String get autoSmall => 'AŬTOMATA';

  @override
  String get lockedSmall => 'ŜLOSITA';

  @override
  String get off => 'Malŝaltita';

  @override
  String get timer => 'Tempumilo';

  @override
  String get back => 'Reen';

  @override
  String get next => 'Sekven';

  @override
  String get settings => 'Agordoj';

  @override
  String get appSettings => 'PROGRAMAJ AGORDOJ';

  @override
  String get language => 'Lingvo';

  @override
  String get language_description => 'Ŝanĝi la programan lingvon';

  @override
  String get systemLanguage => 'Sistema lingvo';

  @override
  String get theme => 'Etoso';

  @override
  String get theme_description => 'Ŝanĝi la programan etoson';

  @override
  String get themeSystem => 'Sistema etoso';

  @override
  String get themeLight => 'Hela etoso';

  @override
  String get themeDark => 'Malhela etoso';

  @override
  String get themeBlack => 'Nigra etoso';

  @override
  String get enableMaximumScreenBrightness => 'Maximum screen brightness';

  @override
  String get enableMaximumScreenBrightness_description =>
      'When enabled, the screen brightness of your device will be set to the maximum';

  @override
  String get enableModeRow => 'Enable focus and exposure mode row';

  @override
  String get enableModeRow_description =>
      'Enable a row at the bottom to switch the exposure and focus modes';

  @override
  String get enableZoomSlider => 'Enable zoom slider';

  @override
  String get enableZoomSlider_description =>
      'When enabled, a slider will appear to manually adjust the zoom';

  @override
  String get enableExposureSlider => 'Enable exposure slider';

  @override
  String get enableExposureSlider_description =>
      'When enabled, a slider will appear to manually adjust the exposure';

  @override
  String get cameraBehaviour => 'CAMERA BEHAVIOUR';

  @override
  String get format => 'Bilda dosierformo';

  @override
  String get format_description =>
      'Ŝanĝi la bildan dosierformon (implicite: JPEG)';

  @override
  String get resolution => 'Distingivo';

  @override
  String get resolution_description => 'Ŝanĝi la fotilan distingivon';

  @override
  String get shutterSound => 'Disable shutter sound';

  @override
  String get shutterSound_description =>
      'Disable the shutter sound when taking a picture';

  @override
  String get flipPhotosFrontCamera => 'Flip photos on front camera';

  @override
  String get flipPhotosFrontCamera_description =>
      'Flip photos horizontally that were taken with front camera';

  @override
  String get startWithFrontCamera => 'Komenci per antaŭa kamerao';

  @override
  String get startWithFrontCamera_description =>
      'Always start with front camera when opening the app';

  @override
  String get disableAudio => 'Disable audio';

  @override
  String get disableAudio_description => 'Disable audio when recording a video';

  @override
  String get saving => 'KONSERVADO';

  @override
  String get imageCompressionQuality => 'Image compression quality';

  @override
  String get imageCompressionQuality_description =>
      'Lower compression quality means smaller size but worse quality, while higher compression quality means bigger size but better quality';

  @override
  String get keepEXIFMetadata => 'Konservi EXIF-datenojn';

  @override
  String get keepEXIFMetadata_description =>
      'Save EXIF metadata of the taken picture like phone model, GPS location, etc.';

  @override
  String get useMaterialYou => 'Use Material You';

  @override
  String get useMaterialYou_description =>
      'Use the Material You design. Set to false for the old Material design';

  @override
  String get savePath => 'Konserva dosierujo';

  @override
  String savePath_description(String path) {
    return 'Aktuala dosierujo: $path';
  }

  @override
  String get choosePath => 'Elektu dosierujon';

  @override
  String get onboardingScreen => 'Onboarding screen';

  @override
  String get onboardingScreen_description =>
      'Open the initial onboarding screen';

  @override
  String get more => 'PLI';

  @override
  String get less => 'KAŜI IOM';

  @override
  String version(String versionNumber) {
    return 'Versio $versionNumber';
  }

  @override
  String get license =>
      'The code is licensed under the GPLv3 on GitHub. If you encounter any problems or want to request a feature, please open an issue on GitHub. Thanks!';

  @override
  String get leftHandedMode => 'Maldekstramanula reĝimo';

  @override
  String get leftHandedMode_description =>
      'When enabled, switch the position of the camera controls in landscape for left-handed mode';

  @override
  String get captureAtVolumePress => 'Capture at volume press';

  @override
  String get captureAtVolumePress_description =>
      'When enabled, pressing a volume button will capture a picture or record a video';
}
