// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appSettings => 'APP-INSTELLINGEN';

  @override
  String get autoSmall => 'AITOMATISCH';

  @override
  String get back => 'Terug';

  @override
  String get cameraBehaviour => 'CAMERAGEDRAG';

  @override
  String get captureAtVolumePress => 'Opname bij druk op volume-knop';

  @override
  String get captureAtVolumePress_description =>
      'Indien ingeschakeld, wordt door op een volumeknop te drukken een foto gemaakt of een video opgenomen';

  @override
  String get choosePath => 'Pad kiezen';

  @override
  String get defaultExposure => 'Standaardbelichting';

  @override
  String get disableAudio => 'Audio uitschakelen';

  @override
  String get disableAudio_description =>
      'Audio uitschakelen bij een video-opname';

  @override
  String get enableCompression => 'Compressie inschakelen';

  @override
  String get enableCompression_description =>
      'Gebruik compressie bij het opslaan van afbeeldingen om schijfruimte te besparen';

  @override
  String get enableExposureSlider => 'Belichtingsschuifregelaar inschakelen';

  @override
  String get enableExposureSlider_description =>
      'Indien ingeschakeld, verschijnt er een schuifregelaar om de belichting handmatig aan te passen';

  @override
  String get enableMaximumScreenBrightness => 'Maximale schermhelderheid';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Indien ingeschakeld, wordt de schermhelderheid van uw apparaat ingesteld op het maximum';

  @override
  String get enableModeRow =>
      'Regel voor focus- en belichtingsmodus inschakelen';

  @override
  String get enableModeRow_description =>
      'Regel onderaan inschakelen om de belichtings- en scherpstelmodi te wijzigen';

  @override
  String get enableZoomSlider => 'Zoomschuifregelaar inschakelen';

  @override
  String get enableZoomSlider_description =>
      'Indien ingeschakeld, verschijnt er een schuifregelaar om de zoom handmatig aan te passen';

  @override
  String get exposureMode => 'Belichtingsmodus';

  @override
  String get exposureModeAuto => 'AUTOMATISCHE BELICHTING';

  @override
  String get exposureModeLocked => 'VERGRENDELDE BELICHTING';

  @override
  String get flashlight => 'Flits';

  @override
  String get flipPhotosFrontCamera =>
      'Foto\'s van de camera aan de voorkant spiegelen';

  @override
  String get flipPhotosFrontCamera_description =>
      'Foto\'s van de camera aan de voorkant horizontaal spiegelen';

  @override
  String get flipToFrontCamera => 'Schakelen naar camera voorkant';

  @override
  String get flipToRearCamera => 'Schakelen naar camera achterkant';

  @override
  String get focusMode => 'Focusmodus';

  @override
  String get focusModeAuto => 'AUTOMATISCHE FOCUS';

  @override
  String get focusModeLocked => 'VERGRENDELDE FOCUS';

  @override
  String get format => 'Afbeeldingscompressieformaat';

  @override
  String get format_description =>
      'Wijzig het afbeeldingscompressieformaat (standaard: JPEG/JPG)';

  @override
  String get getStarted => 'Aan de slag';

  @override
  String get giveCameraPermission => 'Toestemming geven voor camera';

  @override
  String get giveMicrophonePermission => 'Toestemming geven voor microfoon';

  @override
  String get giveStoragePermission => 'Toestemming geven voor opslag';

  @override
  String get imageCompressionQuality => 'Kwaliteit van beeldcompressie';

  @override
  String get imageCompressionQuality_description =>
      'Een lagere compressiekwaliteit betekent een kleiner formaat maar een slechtere kwaliteit, terwijl een hogere compressiekwaliteit een groter formaat maar een betere kwaliteit betekent';

  @override
  String get keepEXIFMetadata => 'EXIF-gegevens opslaan';

  @override
  String get keepEXIFMetadata_description =>
      'EXIF-metagegevens van de gemaakte foto opslaan, zoals telefoonmodel, GPS-locatie, enz.';

  @override
  String get language => 'Taal';

  @override
  String get language_description => 'De taal voor de app wijzigen';

  @override
  String get leftHandedMode => 'Linkshandige modus';

  @override
  String get leftHandedMode_description =>
      'Indien ingeschakeld, schakel je de positie van de camerabedieningselementen in landschap voor de linkshandige modus';

  @override
  String get less => 'MINDER TONEN';

  @override
  String get license =>
      'De code is gelicentieerd onder de GPLv3 op GitHub. Als u problemen ondervindt of een functie wilt aanvragen, opent u een probleem op GitHub. Bedankt!';

  @override
  String get lockCaptureOrientation =>
      'Automatische oriëntatie vergrendelen [OPNIEUW STARTEN]';

  @override
  String get lockCaptureOrientation_description =>
      'Oriëntatie vergrendelen op portretmodus, ongeacht of de automatische rotatiemodus is geactiveerd';

  @override
  String get lockedSmall => 'VERGRENDELD';

  @override
  String get more => 'MEER';

  @override
  String get next => 'Volgende';

  @override
  String get off => 'Uit';

  @override
  String get onboardingScreen => 'Openingsscherm';

  @override
  String get onboardingScreen_description => 'Open het initiële openingsscherm';

  @override
  String get openCapturedPictureOrVideo => 'Gemaakte foto of video openen';

  @override
  String get pauseVideo => 'Video pauzeren';

  @override
  String get permissionsTitle => 'RECHTEN';

  @override
  String get permissionsTitle_description =>
      'Om de camera te gebruiken, moet je toestemming geven voor je camera en opslag.';

  @override
  String get reset => 'Herstellen';

  @override
  String get resolution => 'Resolutie';

  @override
  String get resolution_description => 'De cameraresolutie aanpassen';

  @override
  String get resumeVideo => 'Video-opname vervolgen';

  @override
  String get savePath => 'Opslagpad';

  @override
  String get savePathTitle => 'OPSLAGPAD';

  @override
  String get savePathTitle_description =>
      'Selecteer een pad om op te slaan. Meestal worden afbeeldingen opgeslagen in het Android DCIM-pad.';

  @override
  String savePath_description(String path) {
    return 'Huidig pad: $path';
  }

  @override
  String get saving => 'OPSLAAN';

  @override
  String get selectPath => 'Pad kiezen';

  @override
  String get settings => 'Instellingen';

  @override
  String get shutterSound => 'Schakel sluitergeluid in';

  @override
  String get shutterSound_description =>
      'Schakel het sluitergeluid in bij het maken van een foto';

  @override
  String get startRecordingVideo => 'Video-opname starten';

  @override
  String get startWithFrontCamera => 'Begin met de camera aan de voorkant';

  @override
  String get startWithFrontCamera_description =>
      'Bij het openen van de app altijd met de camera aan de voorkant starten';

  @override
  String get stopVideo => 'Video-opname stoppen';

  @override
  String get switchToPictureMode => 'Overschakelen naar de fotomodus';

  @override
  String get switchToVideoRecordingMode => 'Overschakelen naar de videomodus';

  @override
  String get systemLanguage => 'Systeemtaal';

  @override
  String get takePicture => 'Foto nemen';

  @override
  String get theme => 'Thema';

  @override
  String get themeBlack => 'Zwart thema';

  @override
  String get themeDark => 'Donker thema';

  @override
  String get themeLight => 'Licht thema';

  @override
  String get themeSystem => 'Systeemthema';

  @override
  String get theme_description => 'Het thema van de app aanpassen';

  @override
  String get timer => 'Timer';

  @override
  String get useMaterialYou => 'Material You gebruiken';

  @override
  String get useMaterialYou_description =>
      'Material You-ontwerp gebruiken. Uitschakelen om het oude Material-ontwerp te gebruiken';

  @override
  String version(String versionNumber) {
    return 'Versie $versionNumber';
  }

  @override
  String get welcomeTitle => 'WELKOM';

  @override
  String get welcomeTitle_description =>
      'Gefeliciteerd! Je bent klaar om deze camera-app te gebruiken.';
}
