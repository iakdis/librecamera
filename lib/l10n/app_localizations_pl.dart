// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appSettings => 'OGÓLNE';

  @override
  String get autoSmall => 'AUTO';

  @override
  String get back => 'Wstecz';

  @override
  String get cameraBehaviour => 'KAMERA';

  @override
  String get captureAtVolumePress =>
      'Przechwytywanie po wciśnięciu przycisku głośności';

  @override
  String get captureAtVolumePress_description =>
      'Po włączeniu tej funkcji, naciśnięcie przycisku głośności spowoduje zrobienie zdjęcia lub nagranie filmu';

  @override
  String get choosePath => 'Wybierz ścieżkę';

  @override
  String get defaultExposure => 'Ekspozycja domyślna';

  @override
  String get disableAudio => 'Wyłącz dźwięk';

  @override
  String get disableAudio_description =>
      'Wyłącza dźwięk podczas nagrywania wideo';

  @override
  String get enableExposureSlider => 'Włącz suwak ekspozycji';

  @override
  String get enableExposureSlider_description =>
      'Włącza suwak umożliwiający ręczne dostosowanie ekspozycji';

  @override
  String get enableMaximumScreenBrightness => 'Maksymalna jasność ekranu';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Po włączeniu jasność ekranu urządzenia będzie maksymalna';

  @override
  String get enableModeRow => 'Włącz pasek ostrości i ekspozycji';

  @override
  String get enableModeRow_description =>
      'Włącza dolny pasek sterowania ostrością i ekspozycją';

  @override
  String get enableZoomSlider => 'Włącz suwak powiększenia';

  @override
  String get enableZoomSlider_description =>
      'Włącza suwak umożliwiający ręczne dostosowanie powiększenia';

  @override
  String get exposureMode => 'Tryb ekspozycji';

  @override
  String get exposureModeAuto => 'AUTO EKSPOZYCJA';

  @override
  String get exposureModeLocked => 'BLOKUJ EKSPOZYCJE';

  @override
  String get flashlight => 'Lampa błyskowa';

  @override
  String get flipPhotosFrontCamera => 'Odwróć zdjęcia w przednim aparacie';

  @override
  String get flipPhotosFrontCamera_description =>
      'Zdjęcia wykonane przednim aparatem zostaną odwrócone w poziomie';

  @override
  String get flipToFrontCamera => 'Przełącz na przednią kamerę';

  @override
  String get flipToRearCamera => 'Przełącz na tylną kamerę';

  @override
  String get focusMode => 'Tryb ostrości';

  @override
  String get focusModeAuto => 'AUTO OSTROŚĆ';

  @override
  String get focusModeLocked => 'BLOKUJ OSTROŚĆ';

  @override
  String get format => 'Format zdjęć';

  @override
  String get format_description => 'Zmienia format zdjęć (Domyślnie: JPEG/JPG)';

  @override
  String get getStarted => 'Rozpocznij';

  @override
  String get giveCameraPermission => 'Zezwól na dostęp do kamery';

  @override
  String get giveMicrophonePermission => 'Zezwól na dostęp do mikrofonu';

  @override
  String get giveStoragePermission => 'Zezwól na dostęp do pamięci';

  @override
  String get imageCompressionQuality => 'Jakość kompresji obrazu';

  @override
  String get imageCompressionQuality_description =>
      'Niższa jakość kompresji oznacza mniejszy rozmiar, ale gorszą jakość, podczas gdy wyższa jakość kompresji oznacza większy rozmiar, ale lepszą jakość';

  @override
  String get keepEXIFMetadata => 'Zapisz dane EXIF';

  @override
  String get keepEXIFMetadata_description =>
      'Zapisuje metadane EXIF zrobionego zdjęcia, takie jak model telefonu, lokalizacja GPS itp.';

  @override
  String get language => 'Język';

  @override
  String get language_description => 'Zmień język aplikacji';

  @override
  String get leftHandedMode => 'Tryb dla leworęcznych';

  @override
  String get leftHandedMode_description =>
      'Gdy ta opcja jest włączona, zmienia położenie elementów sterujących aparatu w trybie poziomym aby były one wygodne dla osób leworęcznych';

  @override
  String get less => 'POKAŻ MNIEJ';

  @override
  String get license =>
      'Kod jest udostępniony na licencji GPLv3 na GitHub. Jeśli zauważyłeś jakiś problem lub chcesz poprosić o dodatkową funkcję, zgłoś to jako problem na GitHub. Dzięki!';

  @override
  String get lockCaptureOrientation =>
      'Blokada obrotu ekranu [WYMAGANY RESTART]';

  @override
  String get lockCaptureOrientation_description =>
      'Blokuje ekranu w pozycji pionowej, bez względu na to, czy włączony jest tryb automatycznego obrotu';

  @override
  String get lockedSmall => 'BLOKADA';

  @override
  String get more => 'WIĘCEJ';

  @override
  String get next => 'Dalej';

  @override
  String get off => 'Wył.';

  @override
  String get onboardingScreen => 'Ekran powitalny';

  @override
  String get onboardingScreen_description => 'Otwiera ponownie ekran powitalny';

  @override
  String get openCapturedPictureOrVideo => 'Otwórz ostatnie zdjęcie lub wideo';

  @override
  String get pauseVideo => 'Pauza';

  @override
  String get permissionsTitle => 'UPRAWNIENIA';

  @override
  String get permissionsTitle_description =>
      'Aby korzystać z kamery, musisz zezwolić na korzystanie z kamery i pamięci.';

  @override
  String get reset => 'Resetuj';

  @override
  String get resolution => 'Rozdzielczość';

  @override
  String get resolution_description => 'Zmienia rozdzielczość obrazu';

  @override
  String get resumeVideo => 'Wznów nagrywanie';

  @override
  String get savePath => 'Ścieżka zapisu';

  @override
  String get savePathTitle => 'ŚCIEŻKA ZAPISU';

  @override
  String get savePathTitle_description =>
      'Wybierz ścieżkę zapisu. W systemie Android zdjęcia zazwyczaj zapisywane są w folderze DCIM.';

  @override
  String savePath_description(String path) {
    return 'Obecna ścieżka: $path';
  }

  @override
  String get saving => 'ZAPIS';

  @override
  String get selectPath => 'Wybierz ścieżkę';

  @override
  String get settings => 'Ustawienia';

  @override
  String get shutterSound => 'Wyłącz dźwięk migawki';

  @override
  String get shutterSound_description =>
      'Wyłącza dźwięk migawki podczas robienia zdjęcia';

  @override
  String get startRecordingVideo => 'Rozpocznij nagrywanie';

  @override
  String get startWithFrontCamera => 'Uruchom z przednim aparatem';

  @override
  String get startWithFrontCamera_description =>
      'Aplikacja uruchamia aparat przedni po jej starcie';

  @override
  String get stopVideo => 'Zatrzymaj nagrywanie';

  @override
  String get switchToPictureMode => 'Przejdź do trybu aparatu';

  @override
  String get switchToVideoRecordingMode => 'Przejdź do trybu kamery';

  @override
  String get systemLanguage => 'Język systemu';

  @override
  String get takePicture => 'Zrób zdjęcie';

  @override
  String get theme => 'Motyw';

  @override
  String get themeBlack => 'Czarny motyw';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get themeLight => 'Jasny';

  @override
  String get themeSystem => 'Motyw systemu';

  @override
  String get theme_description => 'Zmień motyw aplikacji';

  @override
  String get timer => 'Timer';

  @override
  String get useMaterialYou => 'Użyj Material You';

  @override
  String get useMaterialYou_description =>
      'Użyj wyglądu Material You. Wyłącz aby zastosować stary wygląd Material';

  @override
  String version(String versionNumber) {
    return 'Wersja $versionNumber';
  }

  @override
  String get welcomeTitle => 'WITAMY';

  @override
  String get welcomeTitle_description =>
      'Gratulacje! Jesteś gotowy do korzystania z aplikacji aparatu.';
}
