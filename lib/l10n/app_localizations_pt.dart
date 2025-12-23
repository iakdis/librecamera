// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appSettings => 'CONFIGURAÇÕES';

  @override
  String get autoSmall => 'AUTO';

  @override
  String get back => 'Voltar';

  @override
  String get cameraBehaviour => 'COMPORTAMENTO DA CÂMERA';

  @override
  String get captureAtVolumePress => 'Capturar ao pressionar o volume';

  @override
  String get captureAtVolumePress_description =>
      'Quando ativado, pressionar um botão de volume capta uma fotografia ou grava um vídeo';

  @override
  String get choosePath => 'Escolha o caminho';

  @override
  String get defaultExposure => 'Exposição padrão';

  @override
  String get disableAudio => 'Desabilitar áudio';

  @override
  String get disableAudio_description =>
      'Desabilita o áudio ao gravar um vídeo';

  @override
  String get enableCompression => 'Ativar compressão';

  @override
  String get enableCompression_description =>
      'Use compressão ao salvar imagens para economizar espaço de armazenamento';

  @override
  String get enableExposureSlider =>
      'Habilitar controle deslizante de exposição';

  @override
  String get enableExposureSlider_description =>
      'Quando habilitado, um controle deslizante aparecerá para que se possa ajustar a exposição manualmente';

  @override
  String get enableMaximumScreenBrightness => 'Máxima luminosidade da tela';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Quando habilitado, o brilho da tela de seu dispositivo será ajustado ao máximo';

  @override
  String get enableModeRow => 'Habilitar modo de linha de foco e exposição';

  @override
  String get enableModeRow_description =>
      'Habilita uma linha no final da tela para alternar entre os modos de exposição e foco';

  @override
  String get enableZoomSlider => 'Habilitar controle deslizante de zoom';

  @override
  String get enableZoomSlider_description =>
      'Quando habilitado, um controle deslizante aparecerá para que se possa ajustar o zoom manualmente';

  @override
  String get exposureMode => 'Modo de exposição';

  @override
  String get exposureModeAuto => 'AUTO EXPOSIÇÃO';

  @override
  String get exposureModeLocked => 'EXPOSIÇÃO TRAVADA';

  @override
  String get flashlight => 'Flash';

  @override
  String get flipPhotosFrontCamera => 'Inverter fotos na câmera frontal';

  @override
  String get flipPhotosFrontCamera_description =>
      'Inverte horizontalmente as fotos que foram tiradas com a câmera frontal';

  @override
  String get flipToFrontCamera => 'Alternar para a câmera frontal';

  @override
  String get flipToRearCamera => 'Alternar para a câmera traseira';

  @override
  String get focusMode => 'Modo de Foco';

  @override
  String get focusModeAuto => 'AUTO-FOCO';

  @override
  String get focusModeLocked => 'FOCO TRAVADO';

  @override
  String get format => 'Formato de compressão da imagem';

  @override
  String get format_description =>
      'Altere o formato de compressão da imagem (padrão: JPEG/JPG)';

  @override
  String get getStarted => 'Iniciar';

  @override
  String get giveCameraPermission => 'Permitir uso da câmera';

  @override
  String get giveMicrophonePermission => 'Permitir uso do microfone';

  @override
  String get giveStoragePermission => 'Permitir uso do armazenamento';

  @override
  String get imageCompressionQuality => 'Qualidade da compressão da imagem';

  @override
  String get imageCompressionQuality_description =>
      'A qualidade de baixa compressão significa um tamanho de imagem menor, porém com qualidade inferior enquanto uma qualidade de compressão alta significa um tamanho de imagem maior mas com qualidade melhor';

  @override
  String get keepEXIFMetadata => 'Salvar dados EXIF';

  @override
  String get keepEXIFMetadata_description =>
      'Salva os metadados EXIF para a fotografia, como: modelo do telefone, localização de GPS, etc.';

  @override
  String get language => 'Idioma';

  @override
  String get language_description => 'Troca o idioma do app';

  @override
  String get leftHandedMode => 'Modo para canhotos';

  @override
  String get leftHandedMode_description =>
      'Quando ativado, altera o posicionamento dos controles da câmara em paisagem para o modo para canhotos';

  @override
  String get less => 'MOSTRAR MENOS';

  @override
  String get license =>
      'O código está licenciado sob a licença GPLv3 no GitHub. Se você encontrar qualquer problema ou quiser requisitar algum recurso, por gentileza, abra uma questão no GitHub. Obrigado!';

  @override
  String get lockCaptureOrientation =>
      'Travar a auto-orientação [É PRECISO REINICIAR]';

  @override
  String get lockCaptureOrientation_description =>
      'Travar a orientação no modo retrato, não importando se o modo de rotação está ativado';

  @override
  String get lockedSmall => 'TRAVADO';

  @override
  String get more => 'MAIS';

  @override
  String get next => 'Próxima';

  @override
  String get off => 'Desligado';

  @override
  String get onboardingScreen => 'Tela de integração';

  @override
  String get onboardingScreen_description =>
      'Abre a tela inicial de integração';

  @override
  String get openCapturedPictureOrVideo =>
      'Abrir fotografia ou vídeo capturado';

  @override
  String get pauseVideo => 'Pausar vídeo';

  @override
  String get permissionsTitle => 'PERMISSÕES';

  @override
  String get permissionsTitle_description =>
      'Para usar a câmera, é preciso que você dê permissão para o app usar sua câmera e armazenamento.';

  @override
  String get reset => 'Reiniciar';

  @override
  String get resolution => 'Resolução';

  @override
  String get resolution_description => 'Troca a resolução da câmera';

  @override
  String get resumeVideo => 'Retomar vídeo';

  @override
  String get savePath => 'Caminho para salvar';

  @override
  String get savePathTitle => 'CAMINHO PARA SALVAR';

  @override
  String get savePathTitle_description =>
      'Selecione um caminho para salvar. No Android, as imagens são geralmente salvas na pasta DCIM.';

  @override
  String savePath_description(String path) {
    return 'Caminho atual: $path';
  }

  @override
  String get saving => 'SALVANDO';

  @override
  String get selectPath => 'Selecione o caminho';

  @override
  String get settings => 'Configurações';

  @override
  String get shutterSound => 'Desabilitar o som do obturador';

  @override
  String get shutterSound_description =>
      'Desabilita o som do obturador ao tirar uma foto';

  @override
  String get startRecordingVideo => 'Iniciar gravação de vídeo';

  @override
  String get startWithFrontCamera => 'Iniciar com a câmera frontal';

  @override
  String get startWithFrontCamera_description =>
      'Sempre inicia com a câmera frontal ao abrir o app';

  @override
  String get stopVideo => 'Parar vídeo';

  @override
  String get switchToPictureMode => 'Alternar para o modo de fotografia';

  @override
  String get switchToVideoRecordingMode =>
      'Alternar para o modo de gravação de vídeo';

  @override
  String get systemLanguage => 'Idioma padrão do sistema';

  @override
  String get takePicture => 'Tirar uma foto';

  @override
  String get theme => 'Tema';

  @override
  String get themeBlack => 'Tema preto';

  @override
  String get themeDark => 'Tema escuro';

  @override
  String get themeLight => 'Tema claro';

  @override
  String get themeSystem => 'Tema padrão do sistema';

  @override
  String get theme_description => 'Troca o tema do app';

  @override
  String get timer => 'Temporizador';

  @override
  String get useMaterialYou => 'Usar o Material You';

  @override
  String get useMaterialYou_description =>
      'Usar o design Material You. Desative para usar o antigo Material Design';

  @override
  String version(String versionNumber) {
    return 'Versão $versionNumber';
  }

  @override
  String get welcomeTitle => 'Bem-vindo';

  @override
  String get welcomeTitle_description =>
      'Parabéns! Você já pode usar este app de câmera.';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appSettings => 'CONFIGURAÇÕES DO APLICATIVO';

  @override
  String get autoSmall => 'AUTOMÁTICO';

  @override
  String get back => 'Voltar';

  @override
  String get cameraBehaviour => 'COMPORTAMENTO DA CÂMERA';

  @override
  String get captureAtVolumePress => 'Capturar ao pressionar o volume';

  @override
  String get captureAtVolumePress_description =>
      'Quando ativado, pressionar um botão de volume captura uma fotografia ou grava um vídeo';

  @override
  String get choosePath => 'Escolher caminho';

  @override
  String get defaultExposure => 'Exposição padrão';

  @override
  String get disableAudio => 'Desativar o áudio';

  @override
  String get disableAudio_description => 'Desativa o áudio ao gravar um vídeo';

  @override
  String get enableCompression => 'Ativar compressão';

  @override
  String get enableCompression_description =>
      'Use compressão ao salvar imagens para economizar espaço de armazenamento';

  @override
  String get enableExposureSlider => 'Ativar controle deslizante da exposição';

  @override
  String get enableExposureSlider_description =>
      'Quando ativado, um controle deslizante aparecerá para se ajustar manualmente a exposição';

  @override
  String get enableMaximumScreenBrightness => 'Brilho máximo da tela';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Quando ativado, o brilho da tela do seu dispositivo será definido para o máximo';

  @override
  String get enableModeRow => 'Ativar linha de foco e modo da exposição';

  @override
  String get enableModeRow_description =>
      'Ativa uma linha na parte inferior para alternar os modos da exposição e de foco';

  @override
  String get enableZoomSlider => 'Ativar controle deslizante de zoom';

  @override
  String get enableZoomSlider_description =>
      'Quando ativado, um controle deslizante aparecerá para se ajustar manualmente o zoom';

  @override
  String get exposureMode => 'Modo da exposição';

  @override
  String get exposureModeAuto => 'EXPOSIÇÃO AUTOMÁTICA';

  @override
  String get exposureModeLocked => 'EXPOSIÇÃO TRAVADA';

  @override
  String get flashlight => 'Lanterna';

  @override
  String get flipPhotosFrontCamera => 'Virar fotos na câmera frontal';

  @override
  String get flipPhotosFrontCamera_description =>
      'Vira fotos horizontalmente que foram tiradas com a câmera frontal';

  @override
  String get flipToFrontCamera => 'Alternar para câmera frontal';

  @override
  String get flipToRearCamera => 'Alternar para câmera traseira';

  @override
  String get focusMode => 'Modo de foco';

  @override
  String get focusModeAuto => 'FOCO AUTOMÁTICO';

  @override
  String get focusModeLocked => 'FOCO TRAVADO';

  @override
  String get format => 'Formato de compressão da imagem';

  @override
  String get format_description =>
      'Altere o formato de compressão da imagem (padrão: JPEG/JPG)';

  @override
  String get getStarted => 'Começar';

  @override
  String get giveCameraPermission => 'Permitir utilização da câmera';

  @override
  String get giveMicrophonePermission => 'Permitir utilização do microfone';

  @override
  String get giveStoragePermission => 'Permitir utilização do armazenamento';

  @override
  String get imageCompressionQuality => 'Qualidade da compressão de imagem';

  @override
  String get imageCompressionQuality_description =>
      'Qualidade de compressão mais baixa significa tamanho menor, com qualidade pior, enquanto qualidade de compressão mais alta significa tamanho maior, com qualidade melhor';

  @override
  String get keepEXIFMetadata => 'Salvar dados EXIF';

  @override
  String get keepEXIFMetadata_description =>
      'Salva metadados EXIF da foto tirada, como modelo de telefone, localização GPS, etc.';

  @override
  String get language => 'Idioma';

  @override
  String get language_description => 'Alterar o idioma do aplicativo';

  @override
  String get leftHandedMode => 'Modo para canhotos';

  @override
  String get leftHandedMode_description =>
      'Quando ativado, altera o posicionamento dos controles da câmera em paisagem para o modo para canhotos';

  @override
  String get less => 'MOSTRAR MENOS';

  @override
  String get license =>
      'O código está licenciado sob a GPLv3 no GitHub. Se você encontrar algum problema ou quiser solicitar um recurso, abra um problema no GitHub. Obrigado!';

  @override
  String get lockCaptureOrientation =>
      'Travar orientação automática [NECESSÁRIO REINICIAR]';

  @override
  String get lockCaptureOrientation_description =>
      'Travar a orientação para o modo retrato, não importando se o modo de rotação automática estiver ativado';

  @override
  String get lockedSmall => 'TRAVADO';

  @override
  String get more => 'MAIS';

  @override
  String get next => 'Seguinte';

  @override
  String get off => 'Desligado';

  @override
  String get onboardingScreen => 'Tela de integração';

  @override
  String get onboardingScreen_description =>
      'Abre a tela de integração inicial';

  @override
  String get openCapturedPictureOrVideo => 'Abrir foto ou vídeo capturado';

  @override
  String get pauseVideo => 'Pausar vídeo';

  @override
  String get permissionsTitle => 'PERMISSÕES';

  @override
  String get permissionsTitle_description =>
      'Para usar a câmera, você precisa dar permissão para o aplicativo utilizar sua câmera e armazenamento.';

  @override
  String get reset => 'Redefinir';

  @override
  String get resolution => 'Resolução';

  @override
  String get resolution_description => 'Alterar a resolução da câmera';

  @override
  String get resumeVideo => 'Retomar vídeo';

  @override
  String get savePath => 'Caminho de salvamento';

  @override
  String get savePathTitle => 'CAMINHO DE SALVAMENTO';

  @override
  String get savePathTitle_description =>
      'Selecione um caminho de salvamento. Normalmente, as imagens são salvas no caminho da pasta DCIM no Android.';

  @override
  String savePath_description(String path) {
    return 'Caminho atual: $path';
  }

  @override
  String get saving => 'SALVANDO';

  @override
  String get selectPath => 'Selecionar caminho';

  @override
  String get settings => 'Configurações';

  @override
  String get shutterSound => 'Ativar o som do obturador';

  @override
  String get shutterSound_description =>
      'Ativa o som do obturador ao tirar uma foto';

  @override
  String get startRecordingVideo => 'Iniciar gravação de vídeo';

  @override
  String get startWithFrontCamera => 'Começar com a câmera frontal';

  @override
  String get startWithFrontCamera_description =>
      'Sempre começar com a câmera frontal ao abrir o aplicativo';

  @override
  String get stopVideo => 'Parar vídeo';

  @override
  String get switchToPictureMode => 'Alternar para o modo de fotografia';

  @override
  String get switchToVideoRecordingMode =>
      'Alternar para o modo de gravação de vídeo';

  @override
  String get systemLanguage => 'Idioma do sistema';

  @override
  String get takePicture => 'Tirar fotografia';

  @override
  String get theme => 'Tema';

  @override
  String get themeBlack => 'Tema preto';

  @override
  String get themeDark => 'Tema escuro';

  @override
  String get themeLight => 'Tema claro';

  @override
  String get themeSystem => 'Tema do sistema';

  @override
  String get theme_description => 'Alterar o tema do aplicativo';

  @override
  String get timer => 'Temporizador';

  @override
  String get useMaterialYou => 'Usar Material You';

  @override
  String get useMaterialYou_description =>
      'Usar o design Material You. Desabilite para usar o antigo Material Design';

  @override
  String version(String versionNumber) {
    return 'Versão $versionNumber';
  }

  @override
  String get welcomeTitle => 'BEM-VINDO(A)';

  @override
  String get welcomeTitle_description =>
      'Parabéns! Você está pronto(a) para usar este aplicativo de câmera.';
}
