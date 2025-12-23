// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appSettings => 'إعدادات التطبيق';

  @override
  String get autoSmall => 'تلقائي';

  @override
  String get back => 'خلف';

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
  String get defaultExposure => 'التعريض الضوئي الإفتراضي';

  @override
  String get disableAudio => 'Disable audio';

  @override
  String get disableAudio_description => 'Disable audio when recording a video';

  @override
  String get enableExposureSlider => 'Enable exposure slider';

  @override
  String get enableExposureSlider_description =>
      'When enabled, a slider will appear to manually adjust the exposure';

  @override
  String get enableMaximumScreenBrightness => 'الحد الأقصى لسطوع الشاشة';

  @override
  String get enableMaximumScreenBrightness_description =>
      'عند التمكين، سيتم ضبط سطوع شاشة جهازك على الحد الأقصى';

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
  String get exposureMode => 'وضع التعريض الضوئي';

  @override
  String get exposureModeAuto => 'تعريض ضوئي تلقائي';

  @override
  String get exposureModeLocked => 'التعريض الضوئي مغلف';

  @override
  String get flashlight => 'ضوء الفلاش';

  @override
  String get flipPhotosFrontCamera => 'Flip photos on front camera';

  @override
  String get flipPhotosFrontCamera_description =>
      'Flip photos horizontally that were taken with front camera';

  @override
  String get flipToFrontCamera => 'إقلب إلى الكاميرا الأمامية';

  @override
  String get flipToRearCamera => 'إقلب إلى الكاميرا الخلفية';

  @override
  String get focusMode => 'وضع التركيز';

  @override
  String get focusModeAuto => 'التركيز التلقائي';

  @override
  String get focusModeLocked => 'LOCKED FOCUS';

  @override
  String get format => 'Image format';

  @override
  String get format_description =>
      'Change the image format (default: JPEG/JPG)';

  @override
  String get getStarted => 'البدء';

  @override
  String get giveCameraPermission => 'منح الاذن للكاميرا';

  @override
  String get giveMicrophonePermission => 'منح الإذن للميكروفون';

  @override
  String get giveStoragePermission => 'منح الإذن لوحدة التخزين';

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
  String get language => 'اللغة';

  @override
  String get language_description => 'غير لغة التطبيق';

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
      'قفل الاتجاه التلقائي [يحتاج إعادة التشغيل]';

  @override
  String get lockCaptureOrientation_description =>
      'قفل الاتجاه إلى الوضع الرأسي، بغض النظر عما إذا كان وضع التدوير التلقائي نشطًا';

  @override
  String get lockedSmall => 'مقفل';

  @override
  String get more => 'MORE';

  @override
  String get next => 'تالي';

  @override
  String get off => 'إيقاف';

  @override
  String get onboardingScreen => 'Onboarding screen';

  @override
  String get onboardingScreen_description =>
      'Open the initial onboarding screen';

  @override
  String get openCapturedPictureOrVideo => 'افتح الصورة أو الفيديو الملتقط';

  @override
  String get pauseVideo => 'أوقف الفيديو مؤقتا';

  @override
  String get permissionsTitle => 'الأذونات';

  @override
  String get permissionsTitle_description =>
      'لاستخدام الكاميرا، يجب عليك منح الإذن للكاميرا ووحدة التخزين الخاصة بك.';

  @override
  String get reset => 'إعادة ضبط';

  @override
  String get resolution => 'Resolution';

  @override
  String get resolution_description => 'Change the camera resolution';

  @override
  String get resumeVideo => 'استأنف الفيديو';

  @override
  String get savePath => 'Save path';

  @override
  String get savePathTitle => 'احفظ المسار';

  @override
  String get savePathTitle_description =>
      'حدد مسار الحفظ. عادةً، يتم حفظ الصور في مسار DCIM على نظام Android.';

  @override
  String savePath_description(String path) {
    return 'Current path: $path';
  }

  @override
  String get saving => 'SAVING';

  @override
  String get selectPath => 'حدد المسار';

  @override
  String get settings => 'إعدادات';

  @override
  String get shutterSound => 'Disable shutter sound';

  @override
  String get shutterSound_description =>
      'Disable the shutter sound when taking a picture';

  @override
  String get startRecordingVideo => 'ابدأ بتسجيل الفيديو';

  @override
  String get startWithFrontCamera => 'Start with front camera';

  @override
  String get startWithFrontCamera_description =>
      'Always start with front camera when opening the app';

  @override
  String get stopVideo => 'أوقف الفيديو';

  @override
  String get switchToPictureMode => 'بدل إلى وضع الصورة';

  @override
  String get switchToVideoRecordingMode => 'بدل إلى وضع تسجيل الفيديو';

  @override
  String get systemLanguage => 'لغة النظام';

  @override
  String get takePicture => 'التقط صورة';

  @override
  String get theme => 'سمة';

  @override
  String get themeBlack => 'السمة السوداء';

  @override
  String get themeDark => 'السمة المظلمة';

  @override
  String get themeLight => 'السمة الفاتحة';

  @override
  String get themeSystem => 'سمة النظام';

  @override
  String get theme_description => 'غير سمة التطبيق';

  @override
  String get timer => 'مؤقت';

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
  String get welcomeTitle => 'مرحبا';

  @override
  String get welcomeTitle_description =>
      'تهانينا! أنت جاهز لاستخدام تطبيق الكاميرا هذا.';
}
