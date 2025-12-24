// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appSettings => 'НАСТРОЙКИ ПРИЛОЖЕНИЯ';

  @override
  String get autoSmall => 'АВТО';

  @override
  String get back => 'Назад';

  @override
  String get cameraBehaviour => 'НАСТРОЙКИ КАМЕРЫ';

  @override
  String get captureAtVolumePress => 'Захват в объемном прессе';

  @override
  String get captureAtVolumePress_description =>
      'При включении нажатие кнопки громкости захватит изображение или запишет видео';

  @override
  String get choosePath => 'Сменить путь';

  @override
  String get defaultExposure => 'Экспозиция по умолчанию';

  @override
  String get disableAudio => 'Не записывать звук';

  @override
  String get disableAudio_description =>
      'Отключить запись звука при съёмке видео';

  @override
  String get enableCompression => 'Включить сжатие';

  @override
  String get enableCompression_description =>
      'Использовать сжатие при сохранении изображений, чтобы экономить место на диске';

  @override
  String get enableExposureSlider => 'Слайдер выдержки';

  @override
  String get enableExposureSlider_description =>
      'Включает отображение слайдера регулировки выдержки на экране камеры';

  @override
  String get enableMaximumScreenBrightness => 'Максимальная яркость экрана';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Если эта функция включена, яркость экрана вашего устройства будет установлена на максимальное значение';

  @override
  String get enableModeRow => 'Режимы фокусировки и выдержки';

  @override
  String get enableModeRow_description =>
      'Отобразить внизу экрана строку с режимами фокусировки и выдержки';

  @override
  String get enableZoomSlider => 'Слайдер зума';

  @override
  String get enableZoomSlider_description =>
      'Включает отображение слайдера зума на экране камеры';

  @override
  String get exposureMode => 'Выдержка';

  @override
  String get exposureModeAuto => 'АВТОВЫДЕРЖКА';

  @override
  String get exposureModeLocked => 'ФИКСИРОВАННАЯ';

  @override
  String get flashlight => 'Вспышка';

  @override
  String get flipPhotosFrontCamera => 'Отзеркалить фронтальные фото';

  @override
  String get flipPhotosFrontCamera_description =>
      'Горизонтально отразить фотографии, снятые на фронтальную камеру';

  @override
  String get flipToFrontCamera => 'Фронтальная камера';

  @override
  String get flipToRearCamera => 'Задняя камера';

  @override
  String get focusMode => 'Фокус';

  @override
  String get focusModeAuto => 'АВТОФОКУС';

  @override
  String get focusModeLocked => 'ФИКСИРОВАННЫЙ';

  @override
  String get format => 'Формат сжатия изображения';

  @override
  String get format_description =>
      'Выбрать формат сжатия изображения (по умолчанию: JPEG/JPG)';

  @override
  String get fps => 'Частота кадров видео';

  @override
  String get fps_description =>
      'Высокие частоты кадров выше 60 fps зависят от вашего устройства и выбранного разрешения';

  @override
  String get getStarted => 'Начать';

  @override
  String get giveCameraPermission => 'Разрешить доступ к камере';

  @override
  String get giveMicrophonePermission => 'Разрешить доступ к микрофону';

  @override
  String get giveStoragePermission => 'Разрешить доступ к памяти';

  @override
  String get imageCompressionQuality => 'Качество сжатия';

  @override
  String get imageCompressionQuality_description =>
      'Чем ниже качество сжатия, тем меньше размер сохранённого файла, но хуже изображение на выходе';

  @override
  String get keepEXIFMetadata => 'Записывать EXIF';

  @override
  String get keepEXIFMetadata_description =>
      'Сохранять в фотографии метаданные EXIF, такие как модель телефона, координаты GPS и др.';

  @override
  String get language => 'Язык';

  @override
  String get language_description => 'Сменить язык приложения';

  @override
  String get leftHandedMode => 'Левый режим';

  @override
  String get leftHandedMode_description =>
      'При включении переключайте положение управления камерой в ландшафте для левостороннего режима';

  @override
  String get less => 'СКРЫТЬ';

  @override
  String get license =>
      'Код распространяется по лицензии GPLv3 на GitHub. Если вы столкнулись с какими-то проблемами или хотите посоветовать новый функционал для приложения, пожалуйста, откройте Issue на GitHub. Спасибо!';

  @override
  String get lockCaptureOrientation =>
      'Заблокировать автоповорот [Требуется перезапуск]';

  @override
  String get lockCaptureOrientation_description =>
      'Заблокировать приложение в портретной ориентации, даже если включён автоповорот';

  @override
  String get lockedSmall => 'ФИКС';

  @override
  String get more => 'ЕЩЁ';

  @override
  String get next => 'Далее';

  @override
  String get off => 'Выключен';

  @override
  String get onboardingScreen => 'Начальные настройки';

  @override
  String get onboardingScreen_description =>
      'Заново открыть экран начальных настроек';

  @override
  String get openCapturedPictureOrVideo => 'Открыть снятое фото или видео';

  @override
  String get pauseVideo => 'Пауза';

  @override
  String get permissionsTitle => 'РАЗРЕШЕНИЯ';

  @override
  String get permissionsTitle_description =>
      'Чтобы пользоваться приложением, необходимо дать доступ к памяти и камере.';

  @override
  String get reset => 'Сброс';

  @override
  String get resolution => 'Разрешение';

  @override
  String get resolution_description => 'Выбрать разрешение камеры';

  @override
  String get resumeVideo => 'Возобновить';

  @override
  String get savePath => 'Путь сохранения';

  @override
  String get savePathTitle => 'ПУТЬ СОХРАНЕНИЯ';

  @override
  String get savePathTitle_description =>
      'Выберите директорию для сохранения фотографий. Как правило, это папка DCIM на Android.';

  @override
  String savePath_description(String path) {
    return 'Текущий путь: $path';
  }

  @override
  String get saving => 'СОХРАНЕНИЕ';

  @override
  String get selectPath => 'Выбрать путь';

  @override
  String get settings => 'Настройки';

  @override
  String get shutterSound => 'Включить звук затвора';

  @override
  String get shutterSound_description =>
      'Включение звука затвора при съемке фотографии';

  @override
  String get startRecordingVideo => 'Начать запись видео';

  @override
  String get startWithFrontCamera => 'Фронтальная камера по умолчанию';

  @override
  String get startWithFrontCamera_description =>
      'При открытии приложения всегда активировать фронтальную камеру';

  @override
  String get stopVideo => 'Остановить запись';

  @override
  String get switchToPictureMode => 'Переключить в режим фото';

  @override
  String get switchToVideoRecordingMode => 'Переключить в режим видео';

  @override
  String get systemLanguage => 'Системный язык';

  @override
  String get takePicture => 'Сделать фото';

  @override
  String get theme => 'Тема';

  @override
  String get themeBlack => 'Темная Тема';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeSystem => 'Системная тема';

  @override
  String get theme_description => 'Сменить внешний вид приложения';

  @override
  String get timer => 'Таймер';

  @override
  String get useMaterialYou => 'Используйте материал Вы';

  @override
  String get useMaterialYou_description =>
      'Используйте материал Вы проектируете. Установлено ложным для старого Материального дизайна';

  @override
  String version(String versionNumber) {
    return 'Версия $versionNumber';
  }

  @override
  String get welcomeTitle => 'ДОБРО ПОЖАЛОВАТЬ';

  @override
  String get welcomeTitle_description =>
      'Поздравляем! Всё готово к использованию приложения.';
}
