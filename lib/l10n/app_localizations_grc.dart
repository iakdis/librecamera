// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ancient Greek (`grc`).
class AppLocalizationsGrc extends AppLocalizations {
  AppLocalizationsGrc([String locale = 'grc']) : super(locale);

  @override
  String get appSettings => 'APP SETTINGS';

  @override
  String get autoSmall => 'AUTO';

  @override
  String get back => 'Back';

  @override
  String get cameraBehaviour => 'CAMERA BEHAVIOUR';

  @override
  String get captureAtVolumePress => 'Capture at volume press';

  @override
  String get captureAtVolumePress_description =>
      'When enabled, pressing a volume button will capture a picture or record a video';

  @override
  String get choosePath => 'Choose path';

  @override
  String get defaultExposure => 'Default exposure';

  @override
  String get disableAudio => 'Disable audio';

  @override
  String get disableAudio_description => 'Disable audio when recording a video';

  @override
  String get enableCompression => 'Enable compression';

  @override
  String get enableCompression_description =>
      'Use compression when saving images to save storage space.';

  @override
  String get enableExposureSlider => 'Enable exposure slider';

  @override
  String get enableExposureSlider_description =>
      'When enabled, a slider will appear to manually adjust the exposure';

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
  String get exposureMode => 'Exposure mode';

  @override
  String get exposureModeAuto => 'AUTO EXPOSURE';

  @override
  String get exposureModeLocked => 'LOCKED EXPOSURE';

  @override
  String get flashlight => 'Flashlight';

  @override
  String get flipPhotosFrontCamera => 'Flip photos on front camera';

  @override
  String get flipPhotosFrontCamera_description =>
      'Flip photos horizontally that were taken with front camera';

  @override
  String get flipToFrontCamera => 'Flip to front camera';

  @override
  String get flipToRearCamera => 'Flip to rear camera';

  @override
  String get focusMode => 'Focus mode';

  @override
  String get focusModeAuto => 'AUTO FOCUS';

  @override
  String get focusModeLocked => 'LOCKED FOCUS';

  @override
  String get format => 'Image compression format';

  @override
  String get format_description =>
      'Change the image compression format (default: JPEG/JPG)';

  @override
  String get fps => 'Video frame rate';

  @override
  String get fps_description =>
      'High frame rates above 60 fps depend on your device and the selected resolution';

  @override
  String get getStarted => 'Get started';

  @override
  String get giveCameraPermission => 'Give camera permission';

  @override
  String get giveMicrophonePermission => 'Give microphone permission';

  @override
  String get giveStoragePermission => 'Give storage permission';

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
  String get language => 'Language';

  @override
  String get language_description => 'Change the app language';

  @override
  String get leftHandedMode => 'Left-handed mode';

  @override
  String get leftHandedMode_description =>
      'When enabled, switch the position of the camera controls in landscape for left-handed mode';

  @override
  String get less => 'SHOW LESS';

  @override
  String get license =>
      'The code is licensed under the GPLv3 on GitHub. If you encounter any problems or want to request a feature, please open an issue on GitHub. Thanks!';

  @override
  String get lockCaptureOrientation =>
      'Lock auto orientation [RESTART REQUIRED]';

  @override
  String get lockCaptureOrientation_description =>
      'Lock orientation to portrait mode, no matter if automatic rotation mode is activated';

  @override
  String get lockedSmall => 'LOCKED';

  @override
  String get more => 'MORE';

  @override
  String get next => 'Next';

  @override
  String get off => 'Off';

  @override
  String get onboardingScreen => 'Onboarding screen';

  @override
  String get onboardingScreen_description =>
      'Open the initial onboarding screen';

  @override
  String get openCapturedPictureOrVideo => 'Open captured picture or video';

  @override
  String get pauseVideo => 'Pause video';

  @override
  String get permissionsTitle => 'PERMISSIONS';

  @override
  String get permissionsTitle_description =>
      'To use the camera, you need to give permission to your camera and storage.';

  @override
  String get reset => 'Reset';

  @override
  String get resolution => 'Resolution';

  @override
  String get resolution_description => 'Change the camera resolution';

  @override
  String get resumeVideo => 'Resume video';

  @override
  String get savePath => 'Save path';

  @override
  String get savePathTitle => 'SAVE PATH';

  @override
  String get savePathTitle_description =>
      'Select a save path. Typically, images get saved to the DCIM path on Android.';

  @override
  String savePath_description(String path) {
    return 'Current path: $path';
  }

  @override
  String get saving => 'SAVING';

  @override
  String get selectPath => 'Select path';

  @override
  String get settings => 'Settings';

  @override
  String get shutterSound => 'Enable shutter sound';

  @override
  String get shutterSound_description =>
      'Enable the shutter sound when taking a picture';

  @override
  String get startRecordingVideo => 'Start recording video';

  @override
  String get startWithFrontCamera => 'Start with front camera';

  @override
  String get startWithFrontCamera_description =>
      'Always start with front camera when opening the app';

  @override
  String get stopVideo => 'Stop video';

  @override
  String get switchToPictureMode => 'Switch to picture mode';

  @override
  String get switchToVideoRecordingMode => 'Switch to video recording mode';

  @override
  String get systemLanguage => 'System language';

  @override
  String get takePicture => 'Take picture';

  @override
  String get theme => 'Theme';

  @override
  String get themeBlack => 'Black theme';

  @override
  String get themeDark => 'Dark theme';

  @override
  String get themeLight => 'Light theme';

  @override
  String get themeSystem => 'System theme';

  @override
  String get theme_description => 'Change the app theme';

  @override
  String get timer => 'Timer';

  @override
  String get useMaterialYou => 'Use Material You';

  @override
  String get useMaterialYou_description =>
      'Use the Material You design. Set to false for the old Material design';

  @override
  String version(String versionNumber) {
    return 'Version $versionNumber';
  }

  @override
  String get welcomeTitle => 'WELCOME';

  @override
  String get welcomeTitle_description =>
      'Congratulations! You are ready to use this camera app.';
}
