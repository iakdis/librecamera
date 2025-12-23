// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appSettings => 'Programinnstillinger';

  @override
  String get autoSmall => 'Auto';

  @override
  String get back => 'Tilbake';

  @override
  String get cameraBehaviour => 'Kameraadferd';

  @override
  String get captureAtVolumePress => 'Knips/spill inn med lydstyrketastene';

  @override
  String get captureAtVolumePress_description =>
      'Når aktivert vil et trykk på en volumknapp ta et bilde eller ta opp video';

  @override
  String get choosePath => 'Velg sti';

  @override
  String get defaultExposure => 'Forvalgt eksponering';

  @override
  String get disableAudio => 'Skru av lyd';

  @override
  String get disableAudio_description => 'Skru av lyd ved videoopptak';

  @override
  String get enableExposureSlider => 'Eksponeringsglidebryter';

  @override
  String get enableExposureSlider_description =>
      'Viser en glidebryter for manuell innstilling av eksponering';

  @override
  String get enableMaximumScreenBrightness => 'Maks. skjermlysstyrke';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Setter skjermlysstyrken på enheten din til maks.';

  @override
  String get enableModeRow => 'Fokus- og eksponeringsmodusrad';

  @override
  String get enableModeRow_description =>
      'Rad på bunnen som bytter eksponerings- og fokusmodus';

  @override
  String get enableZoomSlider => 'Forstørrelsesglidebryter';

  @override
  String get enableZoomSlider_description =>
      'Viser en glidebryter for manuell innstilling av forstørrelse';

  @override
  String get exposureMode => 'Eksponeringsmodus';

  @override
  String get exposureModeAuto => 'Auto-eksponering';

  @override
  String get exposureModeLocked => 'Låst eksponering';

  @override
  String get flashlight => 'Lommelykt';

  @override
  String get flipPhotosFrontCamera => 'Vend bilder fra frontkamera';

  @override
  String get flipPhotosFrontCamera_description =>
      'Vend bilder tatt med frontkamera vannrett';

  @override
  String get flipToFrontCamera => 'Bytt til frontkamera';

  @override
  String get flipToRearCamera => 'Bytt til bakkamera';

  @override
  String get focusMode => 'Fokusmodus';

  @override
  String get focusModeAuto => 'Autofokus';

  @override
  String get focusModeLocked => 'Låst fokus';

  @override
  String get format => 'Bildeformat';

  @override
  String get format_description => 'Endre bildeformat (forvalg: JPEG/JPG)';

  @override
  String get getStarted => 'Begynn';

  @override
  String get giveCameraPermission => 'Innvilg kameratilgang';

  @override
  String get giveMicrophonePermission => 'Innvilg mikrofontilgang';

  @override
  String get giveStoragePermission => 'Innvilg lagringstilgang';

  @override
  String get imageCompressionQuality => 'Bildesammenpakkingskvalitet';

  @override
  String get imageCompressionQuality_description =>
      'Lavere sammenpakkingskvalitet gir mindre bildestørrelser, men også dårligere kvalitet. Høyere gir større bilder, men bedre kvalitet.';

  @override
  String get keepEXIFMetadata => 'Lagre EXIF-data';

  @override
  String get keepEXIFMetadata_description =>
      'Lagre EXIF-metadata for knipset bilde, som f.eks. enhetsmodell, GPS-posisjon, osv.';

  @override
  String get language => 'Språk';

  @override
  String get language_description => 'Endre programspråket';

  @override
  String get leftHandedMode => 'Venstrehåndsmodus';

  @override
  String get leftHandedMode_description =>
      'Tilpasser kameraets kontroller venstrehendte i liggende modus';

  @override
  String get less => 'Vis mindre';

  @override
  String get license =>
      'Lisensiert GPLv3+ på GitHub. Send inn feilrapporter der hvis du har problemer eller vil foreslå en funksjon. Takk.';

  @override
  String get lockCaptureOrientation => 'Lås auto-sideretning (omstart kreves)';

  @override
  String get lockCaptureOrientation_description =>
      'Lås sideretning til portrettmodus, uansett om auto-rotasjon er påslått eller ei';

  @override
  String get lockedSmall => 'Låst';

  @override
  String get more => 'Mer';

  @override
  String get next => 'Neste';

  @override
  String get off => 'Av';

  @override
  String get onboardingScreen => 'Introduksjonsskjerm';

  @override
  String get onboardingScreen_description => 'Åpne første introskjerm';

  @override
  String get openCapturedPictureOrVideo => 'Åpne innspilt video eller bilde';

  @override
  String get pauseVideo => 'Pause video';

  @override
  String get permissionsTitle => 'Tilganger';

  @override
  String get permissionsTitle_description =>
      'For å bruke kameraet må du gi tilgang til det, samt lagring.';

  @override
  String get reset => 'Tilbakestill';

  @override
  String get resolution => 'Oppløsning';

  @override
  String get resolution_description => 'Endre kameraoppløsning';

  @override
  String get resumeVideo => 'Fortsett video';

  @override
  String get savePath => 'Lagringssti';

  @override
  String get savePathTitle => 'Lagringssti';

  @override
  String get savePathTitle_description =>
      'Velg en lagringssti. Vanligvis blir blider lagret i DCIM-mappen på Android.';

  @override
  String savePath_description(String path) {
    return 'Nåværende sti: $path';
  }

  @override
  String get saving => 'Lagring';

  @override
  String get selectPath => 'Velg sti';

  @override
  String get settings => 'Innstillinger';

  @override
  String get shutterSound => 'Skru av lukker-lyd';

  @override
  String get shutterSound_description => 'Skrur av bildeknipselyden';

  @override
  String get startRecordingVideo => 'Ta opp video';

  @override
  String get startWithFrontCamera => 'Start med frontkamera';

  @override
  String get startWithFrontCamera_description =>
      'Alltid start med frontkameraet når programmet åpnes';

  @override
  String get stopVideo => 'Stopp video';

  @override
  String get switchToPictureMode => 'Bytt til bildemodus';

  @override
  String get switchToVideoRecordingMode => 'Bytt til videoopptaksmodus';

  @override
  String get systemLanguage => 'Systemspråk';

  @override
  String get takePicture => 'Knips bilde';

  @override
  String get theme => 'Drakt';

  @override
  String get themeBlack => 'Svart drakt';

  @override
  String get themeDark => 'Mørk';

  @override
  String get themeLight => 'Lys';

  @override
  String get themeSystem => 'Systemdrakt';

  @override
  String get theme_description => 'Endre programdrakten';

  @override
  String get timer => 'Tidsur';

  @override
  String get useMaterialYou => 'Anvend Materiell Deig';

  @override
  String get useMaterialYou_description =>
      'Ta i bruk Materiell Deig-design. Skru av for gammel Materiell design.';

  @override
  String version(String versionNumber) {
    return 'Versjon $versionNumber';
  }

  @override
  String get welcomeTitle => 'Velkommen';

  @override
  String get welcomeTitle_description => 'Du kan nå bruke kameraprogrammet.';
}
