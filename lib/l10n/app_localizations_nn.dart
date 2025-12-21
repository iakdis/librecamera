// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Nynorsk (`nn`).
class AppLocalizationsNn extends AppLocalizations {
  AppLocalizationsNn([String locale = 'nn']) : super(locale);

  @override
  String get permissionsTitle => 'Tilgjenge';

  @override
  String get permissionsTitle_description =>
      'For å nytte kameraet må du gje det tilgjenge til kamera og gøyme.';

  @override
  String get giveCameraPermission => 'Gje tilgjenge til kamera';

  @override
  String get giveMicrophonePermission => 'Gje tilgjenge til mikrofonar';

  @override
  String get giveStoragePermission => 'Gje tilgjenge til gøyme';

  @override
  String get savePathTitle => 'Gøymesti';

  @override
  String get savePathTitle_description =>
      'Select a save path. Typically, images get saved to the DCIM path on Android.';

  @override
  String get selectPath => 'Select path';

  @override
  String get welcomeTitle => 'Velkomen';

  @override
  String get welcomeTitle_description => 'Du kan no nytte denne appen.';

  @override
  String get getStarted => 'Byrj';

  @override
  String get switchToPictureMode => 'Byt til biletmodus';

  @override
  String get switchToVideoRecordingMode => 'Byt til videoopptaksmodus';

  @override
  String get openCapturedPictureOrVideo => 'Open captured picture or video';

  @override
  String get takePicture => 'Tak bilete';

  @override
  String get startRecordingVideo => 'Tak opp video';

  @override
  String get pauseVideo => 'Stans video';

  @override
  String get resumeVideo => 'Hald fram video';

  @override
  String get stopVideo => 'Stogg video';

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
  String get focusMode => 'Focus mode';

  @override
  String get focusModeAuto => 'AUTO FOCUS';

  @override
  String get focusModeLocked => 'LOCKED FOCUS';

  @override
  String get reset => 'Reset';

  @override
  String get flipToFrontCamera => 'Flip to front camera';

  @override
  String get flipToRearCamera => 'Flip to rear camera';

  @override
  String get autoSmall => 'AUTO';

  @override
  String get lockedSmall => 'LOCKED';

  @override
  String get off => 'Off';

  @override
  String get timer => 'Timer';

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get settings => 'Settings';

  @override
  String get appSettings => 'APP SETTINGS';

  @override
  String get language => 'Language';

  @override
  String get language_description => 'Change the app language';

  @override
  String get systemLanguage => 'System language';

  @override
  String get theme => 'Theme';

  @override
  String get theme_description => 'Change the app theme';

  @override
  String get themeSystem => 'System theme';

  @override
  String get themeLight => 'Light theme';

  @override
  String get themeDark => 'Dark theme';

  @override
  String get themeBlack => 'Black theme';

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
  String get format => 'Image format';

  @override
  String get format_description =>
      'Change the image format (default: JPEG/JPG)';

  @override
  String get resolution => 'Resolution';

  @override
  String get resolution_description => 'Change the camera resolution';

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
  String get startWithFrontCamera => 'Start with front camera';

  @override
  String get startWithFrontCamera_description =>
      'Always start with front camera when opening the app';

  @override
  String get disableAudio => 'Disable audio';

  @override
  String get disableAudio_description => 'Disable audio when recording a video';

  @override
  String get saving => 'SAVING';

  @override
  String get imageCompressionQuality => 'Image compression quality';

  @override
  String get imageCompressionQuality_description =>
      'Lower compression quality means smaller size but worse quality, while higher compression quality means bigger size but better quality';

  @override
  String get keepEXIFMetadata => 'Save EXIF data';

  @override
  String get keepEXIFMetadata_description =>
      'Save EXIF metadata of the taken picture like phone model, GPS location, etc.';

  @override
  String get useMaterialYou => 'Use Material You';

  @override
  String get useMaterialYou_description =>
      'Use the Material You design. Set to false for the old Material design';

  @override
  String get savePath => 'Save path';

  @override
  String savePath_description(String path) {
    return 'Current path: $path';
  }

  @override
  String get choosePath => 'Choose path';

  @override
  String get onboardingScreen => 'Onboarding screen';

  @override
  String get onboardingScreen_description =>
      'Open the initial onboarding screen';

  @override
  String get more => 'MORE';

  @override
  String get less => 'SHOW LESS';

  @override
  String version(String versionNumber) {
    return 'Version $versionNumber';
  }

  @override
  String get license =>
      'The code is licensed under the GPLv3 on GitHub. If you encounter any problems or want to request a feature, please open an issue on GitHub. Thanks!';

  @override
  String get leftHandedMode => 'Left-handed mode';

  @override
  String get leftHandedMode_description =>
      'When enabled, switch the position of the camera controls in landscape for left-handed mode';

  @override
  String get captureAtVolumePress => 'Capture at volume press';

  @override
  String get captureAtVolumePress_description =>
      'When enabled, pressing a volume button will capture a picture or record a video';
}
