// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get permissionsTitle => 'PERIJINAN';

  @override
  String get permissionsTitle_description =>
      'Untuk menggunakan kamera, anda perlu memberi perijinan terhadap kamera dan penyimpanan anda.';

  @override
  String get giveCameraPermission => 'Beri perijinan kamera';

  @override
  String get giveMicrophonePermission => 'Beri perijinan mikrofon';

  @override
  String get giveStoragePermission => 'Beri perijinan penyimpanan';

  @override
  String get savePathTitle => 'DIREKTORI PENYIMPANAN';

  @override
  String get savePathTitle_description =>
      'Pilih direktori penyimpanan. Umumnya pada Android, gambar-gambar disimpan ke dalam direktori DCIM.';

  @override
  String get selectPath => 'Pilih direktori';

  @override
  String get welcomeTitle => 'SELAMAT DATANG';

  @override
  String get welcomeTitle_description =>
      'Selamat! Anda siap menggunakan app kamera ini.';

  @override
  String get getStarted => 'Mulai';

  @override
  String get switchToPictureMode => 'Ganti ke mode gambar';

  @override
  String get switchToVideoRecordingMode => 'Ganti ke mode perekaman video';

  @override
  String get openCapturedPictureOrVideo => 'Buka tangkapan gambar atau video';

  @override
  String get takePicture => 'Ambil gambar';

  @override
  String get startRecordingVideo => 'Mulai perekaman video';

  @override
  String get pauseVideo => 'Jedakan video';

  @override
  String get resumeVideo => 'Lanjutkan video';

  @override
  String get stopVideo => 'Hentikan video';

  @override
  String get exposureMode => 'Mode pencahayaan';

  @override
  String get exposureModeAuto => 'PENCAHAYAAN OTOMATIS';

  @override
  String get exposureModeLocked => 'PENCAHAYAAN TERKUNCI';

  @override
  String get defaultExposure => 'Eksposur default';

  @override
  String get flashlight => 'Lampu kilat';

  @override
  String get lockCaptureOrientation =>
      'Kunci orientasi otomatis [MEMERLUKAN RESTART]';

  @override
  String get lockCaptureOrientation_description =>
      'Mengunci orientasi ke mode potret, meskipun mode rotasi otomatis diaktifkan';

  @override
  String get showNavigationBar =>
      'Tampilkan bilah navigasi [DIPERLUKAN RESTART]';

  @override
  String get showNavigationBar_description =>
      'Selalu tampilkan balok navigasi Android';

  @override
  String get focusMode => 'Mode fokus';

  @override
  String get focusModeAuto => 'FOKUS OTOMATIS';

  @override
  String get focusModeLocked => 'FOKUS TERKUNCI';

  @override
  String get reset => 'Atur ulang';

  @override
  String get flipToFrontCamera => 'Balikkan ke kamera depan';

  @override
  String get flipToRearCamera => 'Balikkan ke kamera belakang';

  @override
  String get autoSmall => 'OTOMATIS';

  @override
  String get lockedSmall => 'TERKUNCI';

  @override
  String get off => 'Mati';

  @override
  String get timer => 'Pengatur waktu';

  @override
  String get back => 'Kembali';

  @override
  String get next => 'Selanjutnya';

  @override
  String get settings => 'Pengaturan';

  @override
  String get appSettings => 'PENGATURAN APP';

  @override
  String get language => 'Bahasa';

  @override
  String get language_description => 'Ubah bahasa app';

  @override
  String get systemLanguage => 'Bahasa sistem';

  @override
  String get theme => 'Tema';

  @override
  String get theme_description => 'Rubah tema app';

  @override
  String get themeSystem => 'Tema sistem';

  @override
  String get themeLight => 'Tema terang';

  @override
  String get themeDark => 'Tema gelap';

  @override
  String get themeBlack => 'Tema hitam';

  @override
  String get enableMaximumScreenBrightness => 'Kecerahan maksimum layar';

  @override
  String get enableMaximumScreenBrightness_description =>
      'Ketika diaktifkan, kecerahan perangkat anda akan diatur ke maksimum';

  @override
  String get enableModeRow => 'Aktifkan baris mode fokus dan pencahayaan';

  @override
  String get enableModeRow_description =>
      'Aktifkan baris di bagian bawah untuk mengganti mode pencahayaan dan fokus';

  @override
  String get enableZoomSlider => 'Aktifkan penggeser zoom';

  @override
  String get enableZoomSlider_description =>
      'Ketika diaktifkan, sebuah penggeser untuk penyesuaikan zoom manual akan muncul';

  @override
  String get enableExposureSlider => 'Aktifkan penggeser pencahayaan';

  @override
  String get enableExposureSlider_description =>
      'Ketika diaktifkan, sebuah penggeser untuk penyesuaian pencahayaan manual akan muncul';

  @override
  String get cameraBehaviour => 'PERILAKU KAMERA';

  @override
  String get format => 'Format gambar';

  @override
  String get format_description => 'Mengubah format gambar (default: JPEG/JPG)';

  @override
  String get resolution => 'Resolusi';

  @override
  String get resolution_description => 'Mengubah resolusi kamera';

  @override
  String get shutterSound => 'Matikan bunyi rana';

  @override
  String get shutterSound_description =>
      'Mematikan bunyi rana ketika mengambil gambar';

  @override
  String get flipPhotosFrontCamera => 'Balikkan foto di kamera depan';

  @override
  String get flipPhotosFrontCamera_description =>
      'Membalik foto yang diambil dengan kamera depan secara horizontal';

  @override
  String get startWithFrontCamera => 'Mulai dengan kamera depan';

  @override
  String get startWithFrontCamera_description =>
      'Selalu mulai dengan kamera depan ketika membuka app';

  @override
  String get disableAudio => 'Nonaktifkan audio';

  @override
  String get disableAudio_description => 'Nonaktifkan audio saat merekam video';

  @override
  String get saving => 'MENYIMPAN';

  @override
  String get imageCompressionQuality => 'Kualitas kompresi gambar';

  @override
  String get imageCompressionQuality_description =>
      'Kualitas kompresi lebih rendah berarti berukuran lebih kecil tetapi berkualitas lebih buruk, sedangkan kualitas kompresi lebih tinggi berarti berukuran lebih besar tetapi berkualitas lebih baik';

  @override
  String get keepEXIFMetadata => 'Simpan data EXIF';

  @override
  String get keepEXIFMetadata_description =>
      'Simpan metadata EXIF gambar yang telah diambil seperti model telepon, lokasi GPS, dsb.';

  @override
  String get useMaterialYou => 'Gunakan Material You';

  @override
  String get useMaterialYou_description =>
      'Menggunakan desain Material You. Matikan untuk menggunakan desain Material lama';

  @override
  String get savePath => 'Direktori penyimpanan';

  @override
  String savePath_description(String path) {
    return 'Direktori saat ini: $path';
  }

  @override
  String get choosePath => 'Pilih direktori';

  @override
  String get onboardingScreen => 'Layar onboarding';

  @override
  String get onboardingScreen_description => 'Membuka layar onboarding awal';

  @override
  String get more => 'LEBIH BANYAK';

  @override
  String get less => 'TAMPILKAN LEBIH SEDIKIT';

  @override
  String version(String versionNumber) {
    return 'Versi $versionNumber';
  }

  @override
  String get license =>
      'Kode ini dilisensikan di bawah GPLv3 pada GitHub. Jika anda menemukan masalah apapun atau ingin meminta sebuah fitur, silakan membuka sebuah isu di GitHub. Terima kasih!';

  @override
  String get leftHandedMode => 'Mode tangan-kiri';

  @override
  String get leftHandedMode_description =>
      'Ketika diaktifkan, mengalihkan posisi kendali-kendali kamera di mode lansekap untuk tangan-kiri';

  @override
  String get captureAtVolumePress => 'Tangkap ketika menekan volume';

  @override
  String get captureAtVolumePress_description =>
      'Ketika diaktifkan, menekan tombol volume akan menangkap gambar atau merekam video';
}
