// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get permissionsTitle => '권한 설정';

  @override
  String get permissionsTitle_description =>
      '카메라를 사용하기 위해서는 카메라 및 저장소 권한이 필요합니다.';

  @override
  String get giveCameraPermission => '카메라 권한 부여';

  @override
  String get giveMicrophonePermission => '마이크 권한 부여';

  @override
  String get giveStoragePermission => '저장소 권한 부여';

  @override
  String get savePathTitle => '저장 경로';

  @override
  String get savePathTitle_description =>
      '저장 경로를 선택하십시오. Android에서는 이미지가 흔히 DCIM 경로에 이미지가 저장됩니다.';

  @override
  String get selectPath => '경로 선택';

  @override
  String get welcomeTitle => '환영합니다';

  @override
  String get welcomeTitle_description => '축하합니다! 카메라 앱을 사용할 준비가 되었습니다.';

  @override
  String get getStarted => '시작하기';

  @override
  String get switchToPictureMode => '사진 촬영 모드로 전환';

  @override
  String get switchToVideoRecordingMode => '동영상 녹화 모드로 전환';

  @override
  String get openCapturedPictureOrVideo => '저장한 사진 또는 동영상 열기';

  @override
  String get takePicture => '사진 촬영';

  @override
  String get startRecordingVideo => '동영상 녹화 시작';

  @override
  String get pauseVideo => '동영상 일시정지';

  @override
  String get resumeVideo => '녹화 다시 시작';

  @override
  String get stopVideo => '녹화 종료';

  @override
  String get exposureMode => '노출 모드';

  @override
  String get exposureModeAuto => '자동 노출';

  @override
  String get exposureModeLocked => '고정 노출';

  @override
  String get defaultExposure => '기본값';

  @override
  String get flashlight => '플래시 라이트';

  @override
  String get lockCaptureOrientation => '화면 회전 잠금 [앱 재시작 필요]';

  @override
  String get lockCaptureOrientation_description =>
      '화면 회전이 활성화되어 있어도, 인물사진 모드로 고정합니다';

  @override
  String get showNavigationBar => '네비게이션 바 표시 [앱 재시작 필요]';

  @override
  String get showNavigationBar_description => 'Android 네비게이션 바를 항상 표시합니다';

  @override
  String get focusMode => '포커스 모드';

  @override
  String get focusModeAuto => '자동 포커스';

  @override
  String get focusModeLocked => '고정 포커스';

  @override
  String get reset => '리셋';

  @override
  String get flipToFrontCamera => '전면 카메라로 전환';

  @override
  String get flipToRearCamera => '후면 카메라로 전환';

  @override
  String get autoSmall => '오토';

  @override
  String get lockedSmall => '고정';

  @override
  String get off => '끄기';

  @override
  String get timer => '타이머';

  @override
  String get back => '뒤로';

  @override
  String get next => '다음';

  @override
  String get settings => '설정';

  @override
  String get appSettings => '앱 설정';

  @override
  String get language => '언어';

  @override
  String get language_description => '앱 언어를 변경합니다';

  @override
  String get systemLanguage => '시스템 언어';

  @override
  String get theme => '테마';

  @override
  String get theme_description => '앱 테마를 변경합니다';

  @override
  String get themeSystem => '시스템 테마';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get themeBlack => '블랙';

  @override
  String get enableMaximumScreenBrightness => '최대 화면 밝기';

  @override
  String get enableMaximumScreenBrightness_description =>
      '활성화할 경우, 기기의 화면 밝기가 최대로 설정됩니다';

  @override
  String get enableModeRow => '포커스 및 노출 설정 활성화';

  @override
  String get enableModeRow_description => '화면 하단에 포커스 및 노출 모드 버튼을 활성화합니다';

  @override
  String get enableZoomSlider => '줌 슬라이더 활성화';

  @override
  String get enableZoomSlider_description => '활성화할 경우, 수동 줌 설정 슬라이더를 표시합니다';

  @override
  String get enableExposureSlider => '노출 슬라이더 활성화';

  @override
  String get enableExposureSlider_description =>
      '활성화할 경우, 수동 노출 설정 슬라이더를 표시합니다';

  @override
  String get cameraBehaviour => '카메라 설정';

  @override
  String get format => '이미지 파일 형식';

  @override
  String get format_description => '이미지 형식을 변경합니다 (기본값: JPEG/JPG)';

  @override
  String get resolution => '해상도';

  @override
  String get resolution_description => '카메라 해상도를 변경합니다';

  @override
  String get shutterSound => '셔터음 비활성화';

  @override
  String get shutterSound_description => '사진을 촬영할 때 셔터음을 비활성화합니다';

  @override
  String get flipPhotosFrontCamera => '전면 카메라 사진 회전';

  @override
  String get flipPhotosFrontCamera_description =>
      '전면 카메라로 촬영한 사진을 가로 방향으로 회전합니다';

  @override
  String get startWithFrontCamera => '전면 카메라로 시작';

  @override
  String get startWithFrontCamera_description => '앱을 열 때 항상 전면 카메라로 시작합니다';

  @override
  String get disableAudio => '오디오 비활성화';

  @override
  String get disableAudio_description => '동영상을 녹화할 때 오디오를 비활성화합니다';

  @override
  String get saving => '저장 설정';

  @override
  String get imageCompressionQuality => '이미지 압축 품질';

  @override
  String get imageCompressionQuality_description =>
      '압축 품질이 낮을수록 파일 크기는 작지만 화질이 떨어지며, 압축 품질이 높을수록 파일 크기는 커지지만 화질이 좋아집니다';

  @override
  String get keepEXIFMetadata => 'EXIF 데이터 저장';

  @override
  String get keepEXIFMetadata_description =>
      '사진을 촬영할 때 휴대폰 모델, GPS 위치 등 EXIF 메타데이터를 저장합니다';

  @override
  String get useMaterialYou => '머티리얼 디자인 사용';

  @override
  String get useMaterialYou_description =>
      '머티리얼 디자인을 사용합니다. 이전 머티리얼 디자인은 비활성화됩니다';

  @override
  String get savePath => '저장 경로 설정';

  @override
  String savePath_description(String path) {
    return '현재 경로: $path';
  }

  @override
  String get choosePath => '경로 선택';

  @override
  String get onboardingScreen => '첫 화면';

  @override
  String get onboardingScreen_description => '첫 화면을 엽니다';

  @override
  String get more => '상세 설정';

  @override
  String get less => '상세 설정 접기';

  @override
  String version(String versionNumber) {
    return '버전 $versionNumber';
  }

  @override
  String get license =>
      '이 앱은 Github의 GPLv3에 의해 라이선스가 부여됩니다. 문제가 있거나 기능을 요청하시는 경우 Github에서 Issue를 개설해 주십시오. 감사합니다!';

  @override
  String get leftHandedMode => '왼손잡이 모드';

  @override
  String get leftHandedMode_description => '활성화할 경우, 카메라 컨트롤 배치를 왼손잡이용으로 전환합니다';

  @override
  String get captureAtVolumePress => '볼륨 버튼 동작';

  @override
  String get captureAtVolumePress_description =>
      '활성화할 경우, 볼륨 버튼을 눌러 사진을 촬영하거나 동영상을 녹화합니다';
}
