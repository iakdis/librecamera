// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appSettings => '界面设置';

  @override
  String get autoSmall => '自动';

  @override
  String get back => '返回';

  @override
  String get cameraBehaviour => '相机设置';

  @override
  String get captureAtVolumePress => '用音量键拍照';

  @override
  String get captureAtVolumePress_description => '按下一个音量键，就可以拍照或录视频';

  @override
  String get choosePath => '选择路径';

  @override
  String get defaultExposure => '默认曝光补偿值';

  @override
  String get disableAudio => '不录音频';

  @override
  String get disableAudio_description => '录视频时不录音频';

  @override
  String get enableCompression => '启用压缩';

  @override
  String get enableCompression_description => '在保存图像时使用压缩以节省存储空间';

  @override
  String get enableExposureSlider => '显示曝光滑动条';

  @override
  String get enableExposureSlider_description => '开启本选项，显示手动调整曝光补偿的滑动条';

  @override
  String get enableMaximumScreenBrightness => '屏幕保持最亮';

  @override
  String get enableMaximumScreenBrightness_description => '开启本选项，设备屏幕的亮度会调为最大';

  @override
  String get enableModeRow => '显示对焦模式和曝光模式控制栏';

  @override
  String get enableModeRow_description => '启用显示在底部的控制栏，选择曝光模式和对焦模式';

  @override
  String get enableZoomSlider => '显示缩放滑动条';

  @override
  String get enableZoomSlider_description => '开启本选项，显示手动缩放的滑动条';

  @override
  String get exposureMode => '曝光控制';

  @override
  String get exposureModeAuto => '自动调整';

  @override
  String get exposureModeLocked => '锁定曝光值';

  @override
  String get flashlight => '闪光灯';

  @override
  String get flipPhotosFrontCamera => '翻转前置摄像头的照片';

  @override
  String get flipPhotosFrontCamera_description => '用前置摄像头拍照后，水平翻转拍下的照片';

  @override
  String get flipToFrontCamera => '翻转到前置摄像头';

  @override
  String get flipToRearCamera => '翻转到后置摄像头';

  @override
  String get focusMode => '对焦模式';

  @override
  String get focusModeAuto => '自动对焦';

  @override
  String get focusModeLocked => '焦点不动';

  @override
  String get format => '图像压缩格式';

  @override
  String get format_description => '更改图像压缩格式（默认：JPEG/JPG）';

  @override
  String get fps => '视频帧率';

  @override
  String get fps_description => '高帧率（超过 60 fps）取决于您的设备和所选分辨率';

  @override
  String get getStarted => '开始使用';

  @override
  String get giveCameraPermission => '给予摄像头权限';

  @override
  String get giveMicrophonePermission => '给予麦克风权限';

  @override
  String get giveStoragePermission => '给予存储权限';

  @override
  String get imageCompressionQuality => '压缩图像时要保持的图像质量';

  @override
  String get imageCompressionQuality_description =>
      '压缩质量低，文件体积小，但图像质量低；压缩质量高，文件体积大，但图像质量高';

  @override
  String get keepEXIFMetadata => '保存 EXIF 信息';

  @override
  String get keepEXIFMetadata_description =>
      '在图片文件中保存图片的 EXIF 元数据，比如手机型号、GPS 定位等。';

  @override
  String get language => '语言';

  @override
  String get language_description => '选择应用的语言';

  @override
  String get leftHandedMode => '左利手模式';

  @override
  String get leftHandedMode_description => '交换横屏下相机控件的位置';

  @override
  String get less => '收起';

  @override
  String get license =>
      'GitHub 上有源代码，源代码以 GPLv3 许可协议发布。如果您碰到什么问题或者想要某种功能，可以在 GitHub 上提出 issue。谢谢！';

  @override
  String get lockCaptureOrientation => '固定自动旋转 [重启软件生效]';

  @override
  String get lockCaptureOrientation_description => '无论自动旋转有没有开启，显示方向均锁定为竖屏模式';

  @override
  String get lockedSmall => '锁定';

  @override
  String get more => '其余设置';

  @override
  String get next => '下一步';

  @override
  String get off => '关闭';

  @override
  String get onboardingScreen => '首次设置的界面';

  @override
  String get onboardingScreen_description => '显示第一次打开软件时显示的界面';

  @override
  String get openCapturedPictureOrVideo => '查看相片或录像';

  @override
  String get pauseVideo => '暂停录制';

  @override
  String get permissionsTitle => '权限';

  @override
  String get permissionsTitle_description => '作为相机应用程序，该软件需要相机和存储权限。';

  @override
  String get reset => '重置';

  @override
  String get resolution => '分辨率';

  @override
  String get resolution_description => '设置相机分辨率';

  @override
  String get resumeVideo => '继续录制';

  @override
  String get savePath => '保存路径';

  @override
  String get savePathTitle => '保存路径';

  @override
  String get savePathTitle_description => '选择保存路径。图像通常保存在安卓的 DCIM 路径下。';

  @override
  String savePath_description(String path) {
    return '当前路径：$path';
  }

  @override
  String get saving => '保存';

  @override
  String get selectPath => '选择路径';

  @override
  String get settings => '设置';

  @override
  String get shutterSound => '关闭快门声';

  @override
  String get shutterSound_description => '拍照时不发出快门声';

  @override
  String get startRecordingVideo => '开始录制';

  @override
  String get startWithFrontCamera => '打开软件时用前置摄像头';

  @override
  String get startWithFrontCamera_description => '打开软件时默认用前置摄像头';

  @override
  String get stopVideo => '结束录制';

  @override
  String get switchToPictureMode => '切换到拍照模式';

  @override
  String get switchToVideoRecordingMode => '切换到录像模式';

  @override
  String get systemLanguage => '系统语言';

  @override
  String get takePicture => '拍照';

  @override
  String get theme => '主题';

  @override
  String get themeBlack => '黑色主题';

  @override
  String get themeDark => '深色主题';

  @override
  String get themeLight => '浅色主题';

  @override
  String get themeSystem => '系统主题';

  @override
  String get theme_description => '更换应用的主题';

  @override
  String get timer => '倒计时';

  @override
  String get useMaterialYou => '“Material You”界面设计';

  @override
  String get useMaterialYou_description =>
      '采用“Material You”界面设计。关闭则采用旧的 Material 界面设计';

  @override
  String version(String versionNumber) {
    return '$versionNumber 版';
  }

  @override
  String get welcomeTitle => '欢迎使用';

  @override
  String get welcomeTitle_description => '完事了！本相机软件现在能用了。';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appSettings => '應用程式設定';

  @override
  String get autoSmall => '自動';

  @override
  String get back => '返回';

  @override
  String get cameraBehaviour => '相機行為';

  @override
  String get captureAtVolumePress => '按音量按鈕進行拍攝';

  @override
  String get captureAtVolumePress_description => '啟用後，按音量按鈕將拍攝照片或錄製影片';

  @override
  String get choosePath => '選擇路徑';

  @override
  String get defaultExposure => '預設曝光';

  @override
  String get disableAudio => '停用音訊';

  @override
  String get disableAudio_description => '錄製影片時停用音訊';

  @override
  String get enableCompression => '啟用壓縮';

  @override
  String get enableCompression_description => '在儲存圖片時使用壓縮以節省儲存空間';

  @override
  String get enableExposureSlider => '啟用曝光滑桿';

  @override
  String get enableExposureSlider_description => '啟用後，將出現一個滑桿以手動調整曝光';

  @override
  String get enableMaximumScreenBrightness => '最大螢幕亮度';

  @override
  String get enableMaximumScreenBrightness_description => '啟用後，裝置的螢幕亮度將會設定為最大';

  @override
  String get enableModeRow => '啟用對焦和曝光模式行';

  @override
  String get enableModeRow_description => '啟用底部的一行以切換曝光和對焦模式';

  @override
  String get enableZoomSlider => '啟用縮放滑桿';

  @override
  String get enableZoomSlider_description => '啟用後，將出現一個滑桿以手動調整縮放';

  @override
  String get exposureMode => '曝光模式';

  @override
  String get exposureModeAuto => '自動曝光';

  @override
  String get exposureModeLocked => '已鎖定曝光';

  @override
  String get flashlight => '閃光燈';

  @override
  String get flipPhotosFrontCamera => '翻轉前置相機的照片';

  @override
  String get flipPhotosFrontCamera_description => '水平翻轉使用前置相機拍攝的照片';

  @override
  String get flipToFrontCamera => '翻轉至前置相機';

  @override
  String get flipToRearCamera => '翻轉至後置相機';

  @override
  String get focusMode => '對焦模式';

  @override
  String get focusModeAuto => '自動對焦';

  @override
  String get focusModeLocked => '已鎖定焦點';

  @override
  String get format => '圖像壓縮格式';

  @override
  String get format_description => '變更圖像壓縮格式（預設：JPEG/JPG）';

  @override
  String get fps => '影片幀率';

  @override
  String get fps_description => '高幀率（超過 60 fps）取決於您的裝置與所選解析度';

  @override
  String get getStarted => '開始使用';

  @override
  String get giveCameraPermission => '授予相機權限';

  @override
  String get giveMicrophonePermission => '授予麥克風權限';

  @override
  String get giveStoragePermission => '授予儲存權限';

  @override
  String get imageCompressionQuality => '照片壓縮品質';

  @override
  String get imageCompressionQuality_description =>
      '較低的壓縮品質意味著較小的大小但品質較差，而較高的壓縮品質意味著較大的大小但品質較好';

  @override
  String get keepEXIFMetadata => '儲存 EXIF 數據';

  @override
  String get keepEXIFMetadata_description => '儲存拍攝照片的 EXIF 元數據，例如手機型號、GPS 位置等。';

  @override
  String get language => '語言';

  @override
  String get language_description => '變更應用程式語言';

  @override
  String get leftHandedMode => '左手模式';

  @override
  String get leftHandedMode_description => '啟用後，將橫向相機控制的位置切換為左手模式';

  @override
  String get less => '顯示較少';

  @override
  String get license =>
      '此程式碼在 GitHub 上以 GPLv3 許可證發佈。如果你遇到任何問題或想要請求功能，請在 GitHub 上提出問題。謝謝！';

  @override
  String get lockCaptureOrientation => '鎖定自動旋轉方向［需要重新啟動］';

  @override
  String get lockCaptureOrientation_description => '將方向鎖定為縱向模式，無論是否啟動自動旋轉模式';

  @override
  String get lockedSmall => '已鎖定';

  @override
  String get more => '更多';

  @override
  String get next => '下一個';

  @override
  String get off => '關閉';

  @override
  String get onboardingScreen => '入門介面';

  @override
  String get onboardingScreen_description => '開啟初始入門介面';

  @override
  String get openCapturedPictureOrVideo => '開啟已拍攝的照片或影片';

  @override
  String get pauseVideo => '暫停錄製影片';

  @override
  String get permissionsTitle => '權限';

  @override
  String get permissionsTitle_description => '要使用相機，你需要授予相機和儲存的權限。';

  @override
  String get reset => '重置';

  @override
  String get resolution => '解析度';

  @override
  String get resolution_description => '變更相機解析度';

  @override
  String get resumeVideo => '恢復錄製影片';

  @override
  String get savePath => '儲存路徑';

  @override
  String get savePathTitle => '儲存路徑';

  @override
  String get savePathTitle_description =>
      '選擇儲存路徑。通常，照片會儲存到 Android 上的 DCIM 路徑。';

  @override
  String savePath_description(String path) {
    return '目前路徑：$path';
  }

  @override
  String get saving => '正在儲存';

  @override
  String get selectPath => '選擇路徑';

  @override
  String get settings => '設定';

  @override
  String get shutterSound => '停用快門聲';

  @override
  String get shutterSound_description => '拍照時停用快門聲';

  @override
  String get startRecordingVideo => '開始錄製影片';

  @override
  String get startWithFrontCamera => '從前置相機開始';

  @override
  String get startWithFrontCamera_description => '開啟應用程式時總是從前置相機開始';

  @override
  String get stopVideo => '停止錄製影片';

  @override
  String get switchToPictureMode => '切換至照片模式';

  @override
  String get switchToVideoRecordingMode => '切換至錄影模式';

  @override
  String get systemLanguage => '系統語言';

  @override
  String get takePicture => '拍照';

  @override
  String get theme => '主題';

  @override
  String get themeBlack => '黑色主題';

  @override
  String get themeDark => '深色主題';

  @override
  String get themeLight => '淺色主題';

  @override
  String get themeSystem => '系統主題';

  @override
  String get theme_description => '變更應用程式主題';

  @override
  String get timer => '計時器';

  @override
  String get useMaterialYou => '使用 Material You';

  @override
  String get useMaterialYou_description =>
      '使用 Material You 介面。設定為 false 以使用舊的 Material Design 介面';

  @override
  String version(String versionNumber) {
    return '版本 $versionNumber';
  }

  @override
  String get welcomeTitle => '歡迎';

  @override
  String get welcomeTitle_description => '恭喜！你已經準備好使用此相機應用程式。';
}
