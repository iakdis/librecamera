// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appSettings => 'アプリ設定';

  @override
  String get autoSmall => 'オート';

  @override
  String get back => '戻る';

  @override
  String get cameraBehaviour => 'カメラ設定';

  @override
  String get captureAtVolumePress => 'Capture at volume press';

  @override
  String get captureAtVolumePress_description =>
      'When enabled, pressing a volume button will capture a picture or record a video';

  @override
  String get choosePath => 'フォルダー選択';

  @override
  String get defaultExposure => 'デフォルト';

  @override
  String get disableAudio => 'マイク無効';

  @override
  String get disableAudio_description => '録画するとき音声を録音しない';

  @override
  String get enableExposureSlider => '露出スライダーを表示';

  @override
  String get enableExposureSlider_description => '露出を手動で調整するスライダーを表示する';

  @override
  String get enableMaximumScreenBrightness => '画面の最大輝度';

  @override
  String get enableMaximumScreenBrightness_description =>
      '有効にすると、デバイスの画面の明るさが最大に設定されます';

  @override
  String get enableModeRow => '露出・フォーカス設定を表示';

  @override
  String get enableModeRow_description => '画面の下に露室とフォーカス設定を切り替わるボタンを表示する';

  @override
  String get enableZoomSlider => 'ズームスライダーを表示';

  @override
  String get enableZoomSlider_description => 'ズームを調整するスライダーを表示する';

  @override
  String get exposureMode => '露出モード';

  @override
  String get exposureModeAuto => 'オート露出';

  @override
  String get exposureModeLocked => '固定露出';

  @override
  String get flashlight => 'フラッシュライト';

  @override
  String get flipPhotosFrontCamera => 'フロントカメラ影を映す';

  @override
  String get flipPhotosFrontCamera_description => 'フロントカメラで撮影した写真の影を映す';

  @override
  String get flipToFrontCamera => 'フロントカメラに切り替え';

  @override
  String get flipToRearCamera => '背面カメラに切り替え';

  @override
  String get focusMode => 'フォーカスモード';

  @override
  String get focusModeAuto => 'オートフォーカス';

  @override
  String get focusModeLocked => '固定フォーカス';

  @override
  String get format => '画像ファイル形式';

  @override
  String get format_description => '保存する画像ファイルの形式を変更する (デフォルト： JPEG/JPG)';

  @override
  String get getStarted => '完了';

  @override
  String get giveCameraPermission => 'カメラ権限を許可する';

  @override
  String get giveMicrophonePermission => 'マイク権限を許可する';

  @override
  String get giveStoragePermission => 'ストレージ権限を許可する';

  @override
  String get imageCompressionQuality => '画質設定';

  @override
  String get imageCompressionQuality_description =>
      '画質設定を下げるとファイルサイズが下げますが、保存した画像の画質は悪くなります。画質設定を上がると、保存した画像の画質は良くなりますが、ファイルサイズが増える。';

  @override
  String get keepEXIFMetadata => 'EXIFデータを保存';

  @override
  String get keepEXIFMetadata_description =>
      '機種、GPS座標などのメータデータをEXIFタグとして画像ファイルに書き込む';

  @override
  String get language => '言語設定';

  @override
  String get language_description => 'アプリの言語を変更する';

  @override
  String get leftHandedMode => 'Left-handed mode';

  @override
  String get leftHandedMode_description =>
      'When enabled, switch the position of the camera controls in landscape for left-handed mode';

  @override
  String get less => '詳細設定を閉じる';

  @override
  String get license =>
      '本アプリのソースコードはGPLv3ライセンスでGitHubにて配信されています。 ご質問・ご要望・不具合報告などがありましたら、GitHubのIssueでお問い合わせください。ご利用ありがとうございました！';

  @override
  String get lockCaptureOrientation => '画面回転をロックする [再起動必須]';

  @override
  String get lockCaptureOrientation_description => '画面回転が有効のときでも、アプリ内で縦表示に固定する';

  @override
  String get lockedSmall => '固定';

  @override
  String get more => '詳細設定';

  @override
  String get next => '次へ';

  @override
  String get off => 'オフ';

  @override
  String get onboardingScreen => '初期設定';

  @override
  String get onboardingScreen_description => '初期設定画面を起動する';

  @override
  String get openCapturedPictureOrVideo => '保存した写真・動画を開く';

  @override
  String get pauseVideo => '録画を一時停止する';

  @override
  String get permissionsTitle => '許可設定';

  @override
  String get permissionsTitle_description =>
      'このアプリを使用するには、カメラとストレージの権限を付与する必要があります。';

  @override
  String get reset => 'リセット';

  @override
  String get resolution => '解像度';

  @override
  String get resolution_description => 'カメラの解像度を変更する';

  @override
  String get resumeVideo => '録画を再開する';

  @override
  String get savePath => '保存先設定';

  @override
  String get savePathTitle => '保存先';

  @override
  String get savePathTitle_description =>
      '保存先のフォルダーを設定してください。 Androidの基準ではDCIMフォルダーに保存することです。';

  @override
  String savePath_description(String path) {
    return '使用中フォルダー: $path';
  }

  @override
  String get saving => '保存設定';

  @override
  String get selectPath => 'フォルダー選択';

  @override
  String get settings => '設定';

  @override
  String get shutterSound => 'シャッター音を鳴らさないようにする';

  @override
  String get shutterSound_description => '撮影時のシャッター音を無効にする';

  @override
  String get startRecordingVideo => '録画を開始する';

  @override
  String get startWithFrontCamera => 'フロントカメラに起動';

  @override
  String get startWithFrontCamera_description => 'アプリを起動したときフロントカメラに切り替わる';

  @override
  String get stopVideo => '録画を終了する';

  @override
  String get switchToPictureMode => '写真撮影モードに切り替え';

  @override
  String get switchToVideoRecordingMode => 'ビデオ録画に切り替え';

  @override
  String get systemLanguage => 'システム言語';

  @override
  String get takePicture => '写真を撮影する';

  @override
  String get theme => 'ダークモード';

  @override
  String get themeBlack => 'Black theme';

  @override
  String get themeDark => 'ダークモード';

  @override
  String get themeLight => 'ライトモード';

  @override
  String get themeSystem => 'システムと合わせる';

  @override
  String get theme_description => 'アプリのダークモードを切り替わる';

  @override
  String get timer => 'タイマー';

  @override
  String get useMaterialYou => 'Use Material You';

  @override
  String get useMaterialYou_description =>
      'Use the Material You design. Set to false for the old Material design';

  @override
  String version(String versionNumber) {
    return 'バージョン $versionNumber';
  }

  @override
  String get welcomeTitle => 'ようこそ';

  @override
  String get welcomeTitle_description => '初期設定が完了しました。ご利用ありがとうございました。';
}
