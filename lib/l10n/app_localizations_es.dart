// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appSettings => 'CONFIGURACIÓN DE LA APLICACIÓN';

  @override
  String get autoSmall => 'AUTOMÁTICO';

  @override
  String get back => 'Atrás';

  @override
  String get cameraBehaviour => 'COMPORTAMIENTO DE LA CÁMARA';

  @override
  String get captureAtVolumePress => 'Captura al pulsar el volumen';

  @override
  String get captureAtVolumePress_description =>
      'Cuando está activado, al pulsar un botón de volumen se captura una foto o se graba un vídeo';

  @override
  String get choosePath => 'Elige una ruta';

  @override
  String get defaultExposure => 'Exposición por defecto';

  @override
  String get disableAudio => 'Desactivar audio';

  @override
  String get disableAudio_description =>
      'Desactiva el audio cuando estás grabando un vídeo';

  @override
  String get enableExposureSlider => 'Habilitar la barra de exposición';

  @override
  String get enableExposureSlider_description =>
      'Al activarse, aparecerá una barra con el que puedes controlar manualmente la exposición';

  @override
  String get enableMaximumScreenBrightness => 'Máximo brillo de la pantalla';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Al activarse, el brillo de la pantalla de su dispositivo se ajustará al máximo';

  @override
  String get enableModeRow =>
      'Habilitar la lista de modos de enfoque y exposición';

  @override
  String get enableModeRow_description =>
      'Crea una lista abajo donde puedes cambiar los modos de exposición y enfoque';

  @override
  String get enableZoomSlider => 'Habilitar la barra de zoom';

  @override
  String get enableZoomSlider_description =>
      'Al activarse, aparecerá una barra con el que puedes controlar manualmente el zoom';

  @override
  String get exposureMode => 'Modo de exposición';

  @override
  String get exposureModeAuto => 'EXPOSICIÓN AUTOMÁTICA';

  @override
  String get exposureModeLocked => 'EXPOSICIÓN BLOQUEADA';

  @override
  String get flashlight => 'Flash';

  @override
  String get flipPhotosFrontCamera => 'Voltear las fotos de la cámara frontal';

  @override
  String get flipPhotosFrontCamera_description =>
      'Voltea las fotos horizontalmente cuando son tomadas con la cámara frontal';

  @override
  String get flipToFrontCamera => 'Cambiar a cámara frontal';

  @override
  String get flipToRearCamera => 'Cambiar a cámara trasera';

  @override
  String get focusMode => 'Modo de enfoque';

  @override
  String get focusModeAuto => 'ENFOQUE AUTOMÁTICO';

  @override
  String get focusModeLocked => 'ENFOQUE BLOQUEADO';

  @override
  String get format => 'Formato de la imagen';

  @override
  String get format_description =>
      'Cambia el formato la imagen (por defecto: JPEG/JPG)';

  @override
  String get getStarted => 'Iniciar';

  @override
  String get giveCameraPermission => 'Otorgar permisos de cámara';

  @override
  String get giveMicrophonePermission => 'Otorgar permisos de micrófono';

  @override
  String get giveStoragePermission => 'Otorgar permisos de almacenamiento';

  @override
  String get imageCompressionQuality => 'Calidad de compresión de imagen';

  @override
  String get imageCompressionQuality_description =>
      'Una baja calidad de compresión significa un tamaño menor pero a una calidad peor, mientras que una compresión de alta calidad significa un peso mayor con una mejor calidad de imagen';

  @override
  String get keepEXIFMetadata => 'Guardar datos EXIF';

  @override
  String get keepEXIFMetadata_description =>
      'Guarda los metadatos EXIF de la foto tomada, como el modelo de teléfono, la ubicación GPS, etc.';

  @override
  String get language => 'Idioma';

  @override
  String get language_description => 'Cambia el idioma de la aplicación';

  @override
  String get leftHandedMode => 'Modo para zurdos';

  @override
  String get leftHandedMode_description =>
      'Cuando está activado, cambia la posición de los controles de la cámara en horizontal para el modo zurdo';

  @override
  String get less => 'MENOS';

  @override
  String get license =>
      'El código está bajo licencia GPLv3 en GitHub. Si encuentras algún problema o quieres pedir alguna función, por favor abre un reporte en GitHub. ¡Gracias!';

  @override
  String get lockCaptureOrientation =>
      'Fijar la rotación automática [REQUIERE REINICIO]';

  @override
  String get lockCaptureOrientation_description =>
      'Fija la orientación al modo de portarretrato, sin importar si la rotación automática está activada';

  @override
  String get lockedSmall => 'BLOQUEADO';

  @override
  String get more => 'MÁS';

  @override
  String get next => 'Siguiente';

  @override
  String get off => 'Apagado';

  @override
  String get onboardingScreen => 'Pantalla de introducción';

  @override
  String get onboardingScreen_description => 'Abre la pantalla de introducción';

  @override
  String get openCapturedPictureOrVideo => 'Abrir última foto o vídeo';

  @override
  String get pauseVideo => 'Pausar vídeo';

  @override
  String get permissionsTitle => 'PERMISOS';

  @override
  String get permissionsTitle_description =>
      'Para usar la cámara, necesitas dar los permisos para cámara y almacenamiento.';

  @override
  String get reset => 'Restablecer';

  @override
  String get resolution => 'Resolución';

  @override
  String get resolution_description => 'Cambia la resolución de la cámara';

  @override
  String get resumeVideo => 'Continuar vídeo';

  @override
  String get savePath => 'Ruta de guardado';

  @override
  String get savePathTitle => 'RUTA DE GUARDADO';

  @override
  String get savePathTitle_description =>
      'Elige una ruta de guardado. Usualmente, las imágenes se guardan en la carpeta DCIM en Android.';

  @override
  String savePath_description(String path) {
    return 'Ruta actual: $path';
  }

  @override
  String get saving => 'GUARDADO';

  @override
  String get selectPath => 'Elegir ruta';

  @override
  String get settings => 'Configuración';

  @override
  String get shutterSound => 'Desactivar el sonido del obturador';

  @override
  String get shutterSound_description =>
      'Desactiva el sonido del obturador al tomar una foto';

  @override
  String get startRecordingVideo => 'Empezar a grabar vídeo';

  @override
  String get startWithFrontCamera => 'Iniciar con la cámara frontal';

  @override
  String get startWithFrontCamera_description =>
      'Siempre inicia con la cámara frontal cuando inicias la aplicación';

  @override
  String get stopVideo => 'Detener vídeo';

  @override
  String get switchToPictureMode => 'Cambiar al modo cámara';

  @override
  String get switchToVideoRecordingMode => 'Cambiar al modo vídeo';

  @override
  String get systemLanguage => 'Idioma del sistema';

  @override
  String get takePicture => 'Toma una foto';

  @override
  String get theme => 'Tema';

  @override
  String get themeBlack => 'Tema negro';

  @override
  String get themeDark => 'Tema oscuro';

  @override
  String get themeLight => 'Tema claro';

  @override
  String get themeSystem => 'Tema del sistema';

  @override
  String get theme_description => 'Cambia el tema de la aplicación';

  @override
  String get timer => 'Temporizador';

  @override
  String get useMaterialYou => 'Utilizar Material You';

  @override
  String get useMaterialYou_description =>
      'Utilizar el diseño Material You. Deactivar para usar el antiguo diseño Material';

  @override
  String version(String versionNumber) {
    return 'Versión $versionNumber';
  }

  @override
  String get welcomeTitle => 'BIENVENIDO';

  @override
  String get welcomeTitle_description =>
      '¡Felicidades! Ya estás listo para usar la aplicación.';
}
