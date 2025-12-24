import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:librecamera/src/globals.dart';
import 'package:librecamera/src/provider/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();

  // Language
  static Future<void> setLanguage(String locale) async =>
      _preferences.setString(prefLanguage, locale);
  static String getLanguage() => _preferences.getString(prefLanguage) ?? '';

  // Theme Mode
  static Future<void> setThemeMode(String theme) async =>
      _preferences.setString(prefThemeMode, theme);
  static String getThemeMode() =>
      _preferences.getString(prefThemeMode) ?? CustomThemeMode.system.name;

  // Use Material You
  static Future<void> setUseMaterial3({required bool useMaterial3}) async =>
      _preferences.setBool(prefUseMaterial3, useMaterial3);
  static bool getUseMaterial3() =>
      _preferences.getBool(prefUseMaterial3) ?? true;

  // Onboarding
  static Future<void> setOnBoardingComplete({required bool complete}) async =>
      _preferences.setBool(prefOnboardingCompleted, complete);
  static bool getOnBoardingComplete() =>
      _preferences.getBool(prefOnboardingCompleted) ?? false;

  // Save Path
  static Future<void> setSavePath(String path) async =>
      _preferences.setString(prefSavePath, path);
  static String getSavePath() =>
      _preferences.getString(prefSavePath) ?? 'storage/emulated/0/DCIM';

  // Flash Mode
  static Future<void> setFlashMode(String flashMode) async =>
      _preferences.setString(prefFlashMode, flashMode);
  static String getFlashMode() =>
      _preferences.getString(prefFlashMode) ?? FlashMode.off.name;

  // Enable Mode Row
  static Future<void> setEnableModeRow({required bool enable}) async =>
      _preferences.setBool(prefEnableModeRow, enable);
  static bool getEnableModeRow() =>
      _preferences.getBool(prefEnableModeRow) ?? false;

  // Enable Zoom Slider
  static Future<void> setEnableZoomSlider({required bool enable}) async =>
      _preferences.setBool(prefEnableZoomSlider, enable);
  static bool getEnableZoomSlider() =>
      _preferences.getBool(prefEnableZoomSlider) ?? false;

  // Enable Exposure Slider
  static Future<void> setEnableExposureSlider({required bool enable}) async =>
      _preferences.setBool(prefEnableExposureSlider, enable);
  static bool getEnableExposureSlider() =>
      _preferences.getBool(prefEnableExposureSlider) ?? false;

  // Resolution
  static Future<void> setResolution(String resolution) async =>
      _preferences.setString(prefResolution, resolution);
  static String getResolution() =>
      _preferences.getString(prefResolution) ?? ResolutionPreset.max.name;

  // Capture Orientation Locked
  static Future<void> setIsCaptureOrientationLocked({
    required bool isCaptureOrientationLocked,
  }) async => _preferences.setBool(
    prefIsCaptureOrientationLocked,
    isCaptureOrientationLocked,
  );
  static bool getIsCaptureOrientationLocked() =>
      _preferences.getBool(prefIsCaptureOrientationLocked) ?? false;

  // Start with rear camera
  static Future<void> setStartWithRearCamera({required bool rear}) async =>
      _preferences.setBool(prefStartWithRearCamera, rear);
  static bool getStartWithRearCamera() =>
      _preferences.getBool(prefStartWithRearCamera) ?? true;

  // Flip front camera photos horizontally
  static Future<void> setFlipFrontCameraPhoto({required bool flip}) async =>
      _preferences.setBool(prefFlipFrontCameraPhoto, flip);
  static bool getFlipFrontCameraPhoto() =>
      _preferences.getBool(prefFlipFrontCameraPhoto) ?? false;

  // Enable Audio
  static Future<void> setEnableAudio({required bool enableAudio}) async =>
      _preferences.setBool(prefEnableAudio, enableAudio);
  static bool getEnableAudio() => _preferences.getBool(prefEnableAudio) ?? true;

  // Compress Image
  static Future<void> setCompressFormat(String compressFormat) async =>
      _preferences.setString(prefCompressFormat, compressFormat);
  static String getCompressFormat() =>
      _preferences.getString(prefCompressFormat) ?? CompressFormat.jpeg.name;

  // Compress Image
  static Future<void> setCompressQuality(int compressQuality) async =>
      _preferences.setInt(prefCompressQuality, compressQuality);
  static int getCompressQuality() =>
      _preferences.getInt(prefCompressQuality) ?? 100;

  // Keep Exif
  static Future<void> setKeepEXIFMetadata({
    required bool keepEXIFMetadata,
  }) async => _preferences.setBool(prefKeepEXIFMetadata, keepEXIFMetadata);
  static bool getKeepEXIFMetadata() =>
      _preferences.getBool(prefKeepEXIFMetadata) ?? false;
  // Timer
  static Future<void> setTimerDuration(int durationInSeconds) async =>
      _preferences.setInt(prefTimerDuration, durationInSeconds);
  static int getTimerDuration() => _preferences.getInt(prefTimerDuration) ?? 0;

  // Compress Image
  static Future<void> setDisableShutterSound({required bool disable}) async =>
      _preferences.setBool(prefDisableShutterSound, disable);
  static bool getDisableShutterSound() =>
      _preferences.getBool(prefDisableShutterSound) ?? true;

  // Maximum Screen Brightness
  static Future<void> setMaximumScreenBrightness({
    required bool enable,
  }) async => _preferences.setBool(prefMaximumScreenBrightness, enable);
  static bool getMaximumScreenBrightness() =>
      _preferences.getBool(prefMaximumScreenBrightness) ?? false;

  // Left Handed Mode
  static Future<void> setLeftHandedMode({required bool enable}) async =>
      _preferences.setBool(prefLeftHandedMode, enable);
  static bool getLeftHandedMode() =>
      _preferences.getBool(prefLeftHandedMode) ?? false;

  // Left Handed Mode
  static Future<void> setCaptureAtVolumePress({required bool enable}) async =>
      _preferences.setBool(prefCaptureAtVolumePress, enable);
  static bool getCaptureAtVolumePress() =>
      _preferences.getBool(prefCaptureAtVolumePress) ?? true;

  // Enable compression
  static Future<void> setEnableCompression({
    required bool value,
  }) async => _preferences.setBool(prefEnableCompression, value);
  static bool getEnableCompression() =>
      _preferences.getBool(prefEnableCompression) ?? true;

  // Video FPS
  static Future<void> setVideoFps(int fps) async =>
      _preferences.setInt(prefVideoFps, fps);
  static int getVideoFps() => _preferences.getInt(prefVideoFps) ?? 30;
}
