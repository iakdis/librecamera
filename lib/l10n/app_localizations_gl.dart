// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get appSettings => 'AXUSTES DA APP';

  @override
  String get autoSmall => 'AUTO';

  @override
  String get back => 'Atrás';

  @override
  String get cameraBehaviour => 'COMPORTAMENTO DA CÁMARA';

  @override
  String get captureAtVolumePress => 'Tomar foto co botón de volume';

  @override
  String get captureAtVolumePress_description =>
      'Se o activas, ao premer o botón de volume tomarás unha foto ou gravarás un vídeo';

  @override
  String get choosePath => 'Elixe ruta';

  @override
  String get defaultExposure => 'Exposición por defecto';

  @override
  String get disableAudio => 'Desactivar audio';

  @override
  String get disableAudio_description => 'Desactivar o audio ao gravar vídeos';

  @override
  String get enableCompression => 'Activar compresión';

  @override
  String get enableCompression_description =>
      'Utilizar compresión ao gardar imaxes para aforrar espazo na almacenaxe.';

  @override
  String get enableExposureSlider => 'Activar barra de exposición';

  @override
  String get enableExposureSlider_description =>
      'Ao activala terás unha barra de desprazamento para axustar manualmente a exposición';

  @override
  String get enableMaximumScreenBrightness => 'Brillo máximo da pantalla';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Ao activalo, o brillo da pantalla do dispositivo axustarase ao valor máximo';

  @override
  String get enableModeRow => 'Activar os controis de enfoque e exposición';

  @override
  String get enableModeRow_description =>
      'Activar os botóns na zona inferior para cambiar os modos de enfoque e exposición';

  @override
  String get enableZoomSlider => 'Mostrar barra de zoom';

  @override
  String get enableZoomSlider_description =>
      'Ao activala terás unha barra de desprazamento para axustar manualmente o zoom';

  @override
  String get exposureMode => 'Modo de exposición';

  @override
  String get exposureModeAuto => 'AUTO EXPOSICIÓN';

  @override
  String get exposureModeLocked => 'EXPOSICIÓN BLOQUEADA';

  @override
  String get flashlight => 'Flash';

  @override
  String get flipPhotosFrontCamera => 'Voltear fotos das cámara anterior';

  @override
  String get flipPhotosFrontCamera_description =>
      'Voltea horizontalmente as fotos tomadas coa cámara dianteira';

  @override
  String get flipToFrontCamera => 'Cambiar á cámara frontal';

  @override
  String get flipToRearCamera => 'Cambiar á cámara traseira';

  @override
  String get focusMode => 'Modo de enfoque';

  @override
  String get focusModeAuto => 'AUTO FOCO';

  @override
  String get focusModeLocked => 'FOCO BLOQUEADO';

  @override
  String get format => 'Formato de compresión da imaxe';

  @override
  String get format_description =>
      'Cambiar o formato de compresión da imaxe (por defecto: JPEG/JPG)';

  @override
  String get fps => 'Taxa de cadros de vídeo';

  @override
  String get fps_description =>
      'As altas taxas de fotogramas por riba de 60 fps dependen do teu dispositivo e da resolución seleccionada';

  @override
  String get getStarted => 'Comezar';

  @override
  String get giveCameraPermission => 'Conceder acceso á cámara';

  @override
  String get giveMicrophonePermission => 'Conceder acceso ao micrófono';

  @override
  String get giveStoragePermission => 'Conceder acceso á almacenaxe';

  @override
  String get imageCompressionQuality => 'Calidade de compresión da imaxe';

  @override
  String get imageCompressionQuality_description =>
      'A calidade de compresión baixa significa ficheiros máis pequenos e de peor calidade, e a calidade alta proporciona maior tamaño e calidade';

  @override
  String get keepEXIFMetadata => 'Gardar datos EXIF';

  @override
  String get keepEXIFMetadata_description =>
      'Gardar metadatos EXIF ao facer fotos, como modelo do móbil, localización GPS, etc.';

  @override
  String get language => 'Idioma';

  @override
  String get language_description => 'Cambiar idioma da app';

  @override
  String get leftHandedMode => 'Modo para man sinistra';

  @override
  String get leftHandedMode_description =>
      'Ao activalo, cambiar a posición dos controis no modo paisaxe para a man esquerda';

  @override
  String get less => 'MOSTRAR MENOS';

  @override
  String get license =>
      'O código está baixo licenza GPLv3 en GitHub. Se atopas problemas o queres pedir unha característica, por favor abre un \"issue\" en GitHub. Grazas!';

  @override
  String get lockCaptureOrientation =>
      'Bloqueo da orientación automática [REINICIAR]';

  @override
  String get lockCaptureOrientation_description =>
      'Bloquear a orienteación ao modo retrato, incluso se o modo rotación automática está activado';

  @override
  String get lockedSmall => 'BLOQUEADO';

  @override
  String get more => 'MÁIS';

  @override
  String get next => 'Seguinte';

  @override
  String get off => 'Apagado';

  @override
  String get onboardingScreen => 'Pantalla de benvida';

  @override
  String get onboardingScreen_description =>
      'Abrir a pantalla inicial de benvida';

  @override
  String get openCapturedPictureOrVideo => 'Abrir imaxe ou vídeo capturados';

  @override
  String get pauseVideo => 'Pausa no vídeo';

  @override
  String get permissionsTitle => 'PERMISOS';

  @override
  String get permissionsTitle_description =>
      'Para usar Libre Camera debes darlle acceso á túa cámara e almacenaxe.';

  @override
  String get reset => 'Restablecer';

  @override
  String get resolution => 'Resolución';

  @override
  String get resolution_description => 'Cambiar a resolución da cámara';

  @override
  String get resumeVideo => 'Retomar vídeo';

  @override
  String get savePath => 'Ruta arquivo';

  @override
  String get savePathTitle => 'CARTAFOL DE ALMACENAXE';

  @override
  String get savePathTitle_description =>
      'Elixe a ruta ao cartafol. En Android, de xeito habitual, as imaxes gárdanse na ruta a DCIM.';

  @override
  String savePath_description(String path) {
    return 'Ruta actual: $path';
  }

  @override
  String get saving => 'GARDAR';

  @override
  String get selectPath => 'Selecciona ruta';

  @override
  String get settings => 'Axustes';

  @override
  String get shutterSound => 'Activar son do disparador';

  @override
  String get shutterSound_description =>
      'Activa o son de obturador cando se fai unha foto';

  @override
  String get startRecordingVideo => 'Inciar gravación de vídeo';

  @override
  String get startWithFrontCamera => 'Iniciar coa cámara dianteira';

  @override
  String get startWithFrontCamera_description =>
      'Inciar sempre a app activando a cámara anterior';

  @override
  String get stopVideo => 'Deter vídeo';

  @override
  String get switchToPictureMode => 'Cambiar ao modo foto';

  @override
  String get switchToVideoRecordingMode => 'Cambiar ao modo gravar vídeo';

  @override
  String get systemLanguage => 'Idioma do sistema';

  @override
  String get takePicture => 'Facer foto';

  @override
  String get theme => 'Decorado';

  @override
  String get themeBlack => 'Decorado negro';

  @override
  String get themeDark => 'Decorado escuro';

  @override
  String get themeLight => 'Decorado claro';

  @override
  String get themeSystem => 'Decorado do sistema';

  @override
  String get theme_description => 'Cambiar o decorado da app';

  @override
  String get timer => 'Temporizador';

  @override
  String get useMaterialYou => 'Usalo Material You';

  @override
  String get useMaterialYou_description =>
      'Usa o Material You para o deseño. Establécese como falso para o Material design antigo';

  @override
  String version(String versionNumber) {
    return 'Versión $versionNumber';
  }

  @override
  String get welcomeTitle => 'BENVIDA';

  @override
  String get welcomeTitle_description =>
      'Parabéns! Xa podes utilizar esta app para a cámara.';
}
