// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get permissionsTitle => 'РАЗРЕШЕНИЯ';

  @override
  String get permissionsTitle_description =>
      'За да използвате камерата, трябва да дадете разрешение за вашата камера и памет.';

  @override
  String get giveCameraPermission => 'Дайте разрешение на камерата';

  @override
  String get giveMicrophonePermission => 'Дайте разрешение на микрофона';

  @override
  String get giveStoragePermission => 'Дайте разрешение за съхранение';

  @override
  String get savePathTitle => 'ЗАПАЗЕТЕ ПЪТЯ';

  @override
  String get savePathTitle_description =>
      'Изберете път за запазване. Обикновено изображенията се записват в DCIM пътя на Android.';

  @override
  String get selectPath => 'Изберете път';

  @override
  String get welcomeTitle => 'ДОБРЕ ДОШЛИ';

  @override
  String get welcomeTitle_description =>
      'Честито! Готови сте да използвате това приложение за камера.';

  @override
  String get getStarted => 'Първи стъпки';

  @override
  String get switchToPictureMode => 'Превключване към режим на картина';

  @override
  String get switchToVideoRecordingMode => 'Преминете към режим на видеозапис';

  @override
  String get openCapturedPictureOrVideo =>
      'Отворете заснета снимка или видеоклип';

  @override
  String get takePicture => 'Снимам';

  @override
  String get startRecordingVideo => 'Започнете да записвате видео';

  @override
  String get pauseVideo => 'Пауза на видеото';

  @override
  String get resumeVideo => 'Възобновете видеото';

  @override
  String get stopVideo => 'Спрете видеото';

  @override
  String get exposureMode => 'Режим на експозиция';

  @override
  String get exposureModeAuto => 'АВТОМАТИЧНА ЕКСПОЗИЦИЯ';

  @override
  String get exposureModeLocked => 'ЗАКЛЮЧЕНА ЕКСПОЗИЦИЯ';

  @override
  String get defaultExposure => 'Експозиция по подразбиране';

  @override
  String get flashlight => 'Фенерче';

  @override
  String get lockCaptureOrientation =>
      'Заключване на автоматичната ориентация [ИЗИСКВА СЕ РЕСТАРТ]';

  @override
  String get lockCaptureOrientation_description =>
      'Заключете ориентацията към портретен режим, независимо дали е активиран автоматичен режим на завъртане';

  @override
  String get showNavigationBar =>
      'Показване на лентата за навигация [ИЗИСКВА СЕ РЕСТАРТ]';

  @override
  String get showNavigationBar_description =>
      'Винаги показвайте лентата за навигация на Android';

  @override
  String get focusMode => 'Режим на фокусиране';

  @override
  String get focusModeAuto => 'АВТОМАТИЧЕН ФОКУС';

  @override
  String get focusModeLocked => 'ЗАКЛЮЧЕН НА ФОКУСА';

  @override
  String get reset => 'Нулиране';

  @override
  String get flipToFrontCamera => 'Обърнете към предната камера';

  @override
  String get flipToRearCamera => 'Обърнете към задната камера';

  @override
  String get autoSmall => 'АВТОМАТИЧЕН';

  @override
  String get lockedSmall => 'ЗАКЛЮЧЕНО';

  @override
  String get off => 'Изключено';

  @override
  String get timer => 'Таймер';

  @override
  String get back => 'Назад';

  @override
  String get next => 'Следващо';

  @override
  String get settings => 'Настройки';

  @override
  String get appSettings => 'НАСТРОЙКИ НА ПРИЛОЖЕНИЕТО';

  @override
  String get language => 'Език';

  @override
  String get language_description => 'Променете езика на приложението';

  @override
  String get systemLanguage => 'Системен език';

  @override
  String get theme => 'Тема';

  @override
  String get theme_description => 'Променете темата на приложението';

  @override
  String get themeSystem => 'Системна тема';

  @override
  String get themeLight => 'Светла тема';

  @override
  String get themeDark => 'Тъмна тема';

  @override
  String get themeBlack => 'Black theme';

  @override
  String get enableMaximumScreenBrightness => 'Максимална яркост на екрана';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Когато е активирана, яркостта на екрана на вашето устройство ще бъде зададена на максимум';

  @override
  String get enableModeRow =>
      'Активиране/превключване на режим на фокус и експозиция';

  @override
  String get enableModeRow_description =>
      'Активирайте ред в долната част, за да превключите режими на експозиция и фокус';

  @override
  String get enableZoomSlider => 'Активиране на плъзгача за мащабиране';

  @override
  String get enableZoomSlider_description =>
      'Когато е активиран, ще се появи плъзгач за ръчно регулиране на мащаба';

  @override
  String get enableExposureSlider => 'Активирайте плъзгача за експозиция';

  @override
  String get enableExposureSlider_description =>
      'Когато е активиран, ще се появи плъзгач за ръчно регулиране на експонацията';

  @override
  String get cameraBehaviour => 'ПОВЕДЕНИЕ НА КАМЕРАТА';

  @override
  String get format => 'Формат на изображението';

  @override
  String get format_description =>
      'Промяна на формата на изображението (по подразбиране: JPEG/JPG)';

  @override
  String get resolution => 'Резолюция';

  @override
  String get resolution_description => 'Променете резолюцията на камерата';

  @override
  String get shutterSound => 'Деактивирайте звука на затвора';

  @override
  String get shutterSound_description =>
      'Деактивирайте звука на затвора, когато правите снимка';

  @override
  String get flipPhotosFrontCamera => 'Обърнете снимките от предната камера';

  @override
  String get flipPhotosFrontCamera_description =>
      'Обърнете хоризонтално снимките, направени с предна камера';

  @override
  String get startWithFrontCamera => 'Започнете с предната камера';

  @override
  String get startWithFrontCamera_description =>
      'Винаги започвайте с предната камера, когато отваряте приложението';

  @override
  String get disableAudio => 'Деактивирайте аудиото';

  @override
  String get disableAudio_description =>
      'Деактивирайте звука, когато записвате видео';

  @override
  String get saving => 'СПЕСТЯВАНЕ';

  @override
  String get imageCompressionQuality =>
      'Качество на компресията на изображението';

  @override
  String get imageCompressionQuality_description =>
      'По-ниското качество на компресия означава по-малък размер, но по-лошо качество, докато по-високото качество на компресия означава по-голям размер, но по-добро качество';

  @override
  String get keepEXIFMetadata => 'Запазете EXIF данни';

  @override
  String get keepEXIFMetadata_description =>
      'Запазете EXIF метаданни на направената снимка като модел на телефона, GPS местоположение и др.';

  @override
  String get useMaterialYou => 'Use Material You';

  @override
  String get useMaterialYou_description =>
      'Use the Material You design. Set to false for the old Material design';

  @override
  String get savePath => 'Запазете към';

  @override
  String savePath_description(String path) {
    return 'Текущ път за запазване: $path';
  }

  @override
  String get choosePath => 'Изберете път';

  @override
  String get onboardingScreen => 'Екран за включване';

  @override
  String get onboardingScreen_description =>
      'Отворете началния екран за включване';

  @override
  String get more => 'ПОВЕЧЕ';

  @override
  String get less => 'ПОКАЖИ ПО-МАЛКО';

  @override
  String version(String versionNumber) {
    return 'Версия $versionNumber';
  }

  @override
  String get license =>
      'Кодът е лицензиран под GPLv3 на GitHub. Ако срещнете някакви проблеми или искате да поискате функция, моля,отворете тема в GitHub. Благодаря!';

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
