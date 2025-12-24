// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appSettings => 'PARAMÈTRES DE L\'APP';

  @override
  String get autoSmall => 'AUTOMATIQUE';

  @override
  String get back => 'Précédent';

  @override
  String get cameraBehaviour => 'COMPORTEMENT CAMÉRA';

  @override
  String get captureAtVolumePress => 'Capture at volume press';

  @override
  String get captureAtVolumePress_description =>
      'When enabled, pressing a volume button will capture a picture or record a video';

  @override
  String get choosePath => 'Choisir l\'emplacement';

  @override
  String get defaultExposure => 'Exposition par défaut';

  @override
  String get disableAudio => 'Désactiver l\'audio';

  @override
  String get disableAudio_description =>
      'Désactiver l\'audio durant l\'enregistrement d\'une vidéo';

  @override
  String get enableCompression => 'Activer la compression';

  @override
  String get enableCompression_description =>
      'Utiliser la compression lors de l\'enregistrement des images pour économiser de l\'espace de stockage';

  @override
  String get enableExposureSlider => 'Activer le curseur d\'exposition';

  @override
  String get enableExposureSlider_description =>
      'Quand activé, une barre apparaîtra pour ajuster manuellement l\'exposition';

  @override
  String get enableMaximumScreenBrightness => 'Luminosité maximale de l\'écran';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Quand activé, la luminosité de l\'écran de votre appareil sera réglée sur le maximum';

  @override
  String get enableModeRow =>
      'Activer la ligne pour les modes focus et exposition';

  @override
  String get enableModeRow_description =>
      'Active une rangée, située en bas de l\'écran, pour permuter les modes d\'exposition et de focus';

  @override
  String get enableZoomSlider => 'Activer le curseur de zoom';

  @override
  String get enableZoomSlider_description =>
      'Quand activé, une barre apparaîtra pour ajuster manuellement le zoom';

  @override
  String get exposureMode => 'Mode d\'exposition';

  @override
  String get exposureModeAuto => 'EXPOSITION AUTOMATIQUE';

  @override
  String get exposureModeLocked => 'EXPOSITION VERROUILLÉE';

  @override
  String get flashlight => 'Lampe torche';

  @override
  String get flipPhotosFrontCamera =>
      'Retourner les photos sur la caméra frontale';

  @override
  String get flipPhotosFrontCamera_description =>
      'Retourner horizontalement les photos prises avec la caméra frontale';

  @override
  String get flipToFrontCamera => 'Passer à la caméra frontale';

  @override
  String get flipToRearCamera => 'Passer à la caméra arrière';

  @override
  String get focusMode => 'Mode Focus';

  @override
  String get focusModeAuto => 'FOCUS AUTOMATIQUE';

  @override
  String get focusModeLocked => 'FOCUS VERROUILLÉ';

  @override
  String get format => 'Format de compression d\'image';

  @override
  String get format_description =>
      'Changer le format de compression d\'image (par défaut : JPEG/JPG)';

  @override
  String get fps => 'Fréquence d\'images vidéo';

  @override
  String get fps_description =>
      'Les fréquences d\'images élevées supérieures à 60 fps dépendent de votre appareil et de la résolution sélectionnée';

  @override
  String get getStarted => 'Commencer';

  @override
  String get giveCameraPermission =>
      'Donner la permission d\'accès à la caméra';

  @override
  String get giveMicrophonePermission =>
      'Donner la permission d\'accès au microphone';

  @override
  String get giveStoragePermission =>
      'Donner la permission d\'accès au stockage';

  @override
  String get imageCompressionQuality => 'Qualité de compression d\'image';

  @override
  String get imageCompressionQuality_description =>
      'Une qualité de compression moindre implique une taille plus petite mais aussi une qualité réduite, une qualité de compression plus élevée donne une taille plus élevée mais aussi une meilleure qualité';

  @override
  String get keepEXIFMetadata => 'Enregister les métadonnées EXIF';

  @override
  String get keepEXIFMetadata_description =>
      'Enregistrer les métadonnées EXIF de la photo prise, telles que le modèle du téléphone, la localisation GPS, etc.';

  @override
  String get language => 'Langage';

  @override
  String get language_description => 'Changer la langue de l\'application';

  @override
  String get leftHandedMode => 'Mode gaucher';

  @override
  String get leftHandedMode_description =>
      'Une fois activé, change la position des contrôles de la caméra en mode paysage pour le mode gaucher';

  @override
  String get less => 'MASQUER';

  @override
  String get license =>
      'Le code est publié sous licence GPLv3 sur GitHub. Si vous rencontrez un problème ou souhaitez une fonctionnalité, vous pouvez ouvrir un ticket sur Github. Merci !';

  @override
  String get lockCaptureOrientation =>
      'Verrouiller l\'orientation automatique [REDÉMARRAGE NÉCESSAIRE]';

  @override
  String get lockCaptureOrientation_description =>
      'Verrouiller l\'orientation en mode portrait, peu importe si le mode de rotation automatique est activé';

  @override
  String get lockedSmall => 'VERROUILLÉ';

  @override
  String get more => 'PLUS';

  @override
  String get next => 'Suivant';

  @override
  String get off => 'Éteint';

  @override
  String get onboardingScreen => 'Écran d\'accueil';

  @override
  String get onboardingScreen_description =>
      'Ouvrir l\'écran d\'accueil initial';

  @override
  String get openCapturedPictureOrVideo => 'Ouvrir la photo ou la vidéo prise';

  @override
  String get pauseVideo => 'Mettre la vidéo en pause';

  @override
  String get permissionsTitle => 'PERMISSIONS';

  @override
  String get permissionsTitle_description =>
      'Pour utiliser la caméra, les permissions d\'accès à votre caméra et au stockage sont nécessaires.';

  @override
  String get reset => 'Réinitialisation';

  @override
  String get resolution => 'Résolution';

  @override
  String get resolution_description => 'Changer la résolution de la caméra';

  @override
  String get resumeVideo => 'Reprendre la video';

  @override
  String get savePath => 'Emplacement de stockage';

  @override
  String get savePathTitle => 'EMPLACEMENT DE STOCKAGE';

  @override
  String get savePathTitle_description =>
      'Choisir un emplacement de stockage. Typiquement, les images sont enregistrées dans le dossier DCIM sur Android.';

  @override
  String savePath_description(String path) {
    return 'Emplacement actuel : $path';
  }

  @override
  String get saving => 'SAUVEGARDE';

  @override
  String get selectPath => 'Sélectionner le chemin';

  @override
  String get settings => 'Paramètres';

  @override
  String get shutterSound => 'Désactiver le son de l\'obturateur';

  @override
  String get shutterSound_description =>
      'Désactiver le son de l\'obturateur lorsqu\'une photo est prise';

  @override
  String get startRecordingVideo => 'Démarrer un enregistrement vidéo';

  @override
  String get startWithFrontCamera => 'Démarrer avec la caméra frontale';

  @override
  String get startWithFrontCamera_description =>
      'Toujours démarrer avec la caméra frontale à l\'ouverture de l\'application';

  @override
  String get stopVideo => 'Arrêter la vidéo';

  @override
  String get switchToPictureMode => 'Basculer en mode photo';

  @override
  String get switchToVideoRecordingMode =>
      'Basculer en mode enregistrement vidéo';

  @override
  String get systemLanguage => 'Langue du système';

  @override
  String get takePicture => 'Prendre une photo';

  @override
  String get theme => 'Thème';

  @override
  String get themeBlack => 'Thème noir';

  @override
  String get themeDark => 'Thème sombre';

  @override
  String get themeLight => 'Thème clair';

  @override
  String get themeSystem => 'Thème du système';

  @override
  String get theme_description => 'Changer le thème de l\'application';

  @override
  String get timer => 'Minuterie';

  @override
  String get useMaterialYou => 'Utiliser Material You';

  @override
  String get useMaterialYou_description =>
      'Utiliser le style Material You. Désactiver pour l\'ancien style Material';

  @override
  String version(String versionNumber) {
    return 'Version $versionNumber';
  }

  @override
  String get welcomeTitle => 'BIENVENUE';

  @override
  String get welcomeTitle_description =>
      'Félicitations ! Vous êtes prêt(e) à utiliser cette application.';
}
