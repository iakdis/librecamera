import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_android_volume_keydown/flutter_android_volume_keydown.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:librecamera/l10n/app_localizations.dart';
import 'package:librecamera/main.dart';
import 'package:librecamera/src/pages/settings_page.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:librecamera/src/widgets/capture_control.dart';
import 'package:librecamera/src/widgets/exposure.dart';
import 'package:librecamera/src/widgets/flash.dart';
import 'package:librecamera/src/widgets/focus.dart';
import 'package:librecamera/src/widgets/format.dart';
import 'package:librecamera/src/widgets/resolution.dart';
import 'package:librecamera/src/widgets/timer.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart' as qr;
import 'package:video_thumbnail/video_thumbnail.dart' as video_thumbnail;

/// Camera example home widget.
class CameraPage extends StatefulWidget {
  /// Default Constructor
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() {
    return _CameraPageState();
  }
}

class _CameraPageState extends State<CameraPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  //Controllers
  File? capturedFile;
  CameraController? controller;
  Uint8List? videoThumbnailUint8list;

  //Zoom
  double _minAvailableZoom = 1;
  double _maxAvailableZoom = 1;
  double _currentScale = 1;
  double _baseScale = 1;
  int _pointers = 0;

  //Exposure
  double _minAvailableExposureOffset = 0;
  double _maxAvailableExposureOffset = 0;
  double _currentExposureOffset = 0;

  //Current camera
  bool isRearCameraSelected = Preferences.getStartWithRearCamera();
  bool isVideoCameraSelected = false;
  bool takingPicture = false;

  //Circle position
  double _circlePosX = 0, _circlePosY = 0;
  bool _circleEnabled = false;
  final Tween<double> _scaleTween = Tween<double>(begin: 1, end: 0.75);

  //Video recording timer
  final Stopwatch _stopwatch = Stopwatch();

  //Photo capture timer
  final Stopwatch _timerStopwatch = Stopwatch();

  //Orientation
  DateTime _timeOfLastChange = DateTime.now();

  //Volume buttons
  StreamSubscription<HardwareButton>? volumeSubscription;
  bool canPressVolume = true;

  //QR Code
  /*final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  qr.Barcode? result;
  qr.QRViewController? qrController;*/

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    /*final methodChannel = AndroidMethodChannel();
    methodChannel.disableIntentCamera(disable: true);*/

    if (!Preferences.getIsCaptureOrientationLocked()) {
      _subscribeOrientationChangeStream();
    }

    onNewCameraSelected(cameras[Preferences.getStartWithRearCamera() ? 0 : 1]);
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  /*@override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    }
  }*/

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    //qrController?.dispose();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
      //qrController?.pauseCamera();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController(cameraController.description);
      //qrController?.resumeCamera();
    }
  }

  void _subscribeVolumeButtons() {
    volumeSubscription = FlutterAndroidVolumeKeydown.stream.listen((
      event,
    ) async {
      if (canPressVolume) {
        final int delay;
        if (isVideoCameraSelected) {
          delay = 2;
          controller?.value.isRecordingVideo ?? false
              ? onStopButtonPressed()
              : onVideoRecordButtonPressed();
        } else {
          delay = 1;
          onTakePictureButtonPressed();
        }

        canPressVolume = false;
        await Future<void>.delayed(Duration(seconds: delay));
        canPressVolume = true;
      }
    });
  }

  void _stopVolumeButtons() => volumeSubscription?.cancel();

  void checkVolumeButtons() => Preferences.getCaptureAtVolumePress()
      ? _subscribeVolumeButtons()
      : _stopVolumeButtons();

  /*void _onQRViewCreated(qr.QRViewController qrController) {
    this.qrController = qrController;
    qrController.pauseCamera();
    qrController.resumeCamera();

    qrController.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }*/

  void _subscribeOrientationChangeStream() {
    final nativeDeviceOrientationCommunicator =
        NativeDeviceOrientationCommunicator();
    final onOrientationChangedStream = nativeDeviceOrientationCommunicator
        .onOrientationChanged(
          useSensor: true,
        );

    onOrientationChangedStream.listen((event) {
      final orientation = nativeDeviceOrientationCommunicator.orientation(
        useSensor: true,
      );

      _timeOfLastChange = DateTime.now();
      Future.delayed(const Duration(milliseconds: 500), () async {
        if (DateTime.now().difference(_timeOfLastChange).inMilliseconds > 500) {
          if (await orientation == NativeDeviceOrientation.portraitUp) {
            await SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
          } else if (await orientation ==
              NativeDeviceOrientation.landscapeLeft) {
            await SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
            ]);
          } else if (await orientation ==
              NativeDeviceOrientation.landscapeRight) {
            await SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeRight,
            ]);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _cameraPreview(context));
  }

  Widget _cameraPreview(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Stack(
        children: [
          /*qr.QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),*/
          _previewWidget(),
          _shutterBorder(),
          //?TODO when in QR-Code mode: enable, _previewWidget disable
          /*Center(
            child: (result != null)
                ? Container(
                    color: Colors.black54,
                    height: 200,
                    padding: const EdgeInsets.all(8.0),
                    child: SelectableText('Link: ${result!.code}',
                        style: const TextStyle(color: Colors.white)),
                  )
                : const Text('Scan a code',
                    style: TextStyle(color: Colors.white)),
          ),*/
          _timerWidget(),
          _topControlsWidget(),
          _zoomWidget(context),
          _bottomControlsWidget(),
          _circleWidget(),
        ],
      ),
    );
  }

  Widget _shutterBorder() {
    return IgnorePointer(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: Border.all(
            color: takingPicture
                ? const Color(0xFFFFFFFF)
                : const Color.fromARGB(0, 255, 255, 255),
            width: 4,
          ), //Border.all
        ),
      ),
    );
  }

  Widget _timerWidget() {
    final minuteAmount =
        (Preferences.getTimerDuration() - _timerStopwatch.elapsed.inSeconds) /
        60;
    final minute = minuteAmount.floor();

    return Duration(seconds: Preferences.getTimerDuration()).inSeconds > 0 &&
            _timerStopwatch.elapsedTicks > 1
        ? Center(
            child: IgnorePointer(
              child: Text(
                Preferences.getTimerDuration() -
                            _timerStopwatch.elapsed.inSeconds <
                        60
                    ? '${Preferences.getTimerDuration() - _timerStopwatch.elapsed.inSeconds}s'
                    : '${minute}m ${(Preferences.getTimerDuration() - _timerStopwatch.elapsed.inSeconds) % 60}s',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        : Container();
  }

  Widget _previewWidget() {
    final cameraController = controller;

    if (cameraController != null && cameraController.value.isInitialized) {
      return Center(
        child: Listener(
          onPointerDown: (_) => _pointers++,
          onPointerUp: (_) => _pointers--,
          child: CameraPreview(
            cameraController,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onScaleStart: _handleScaleStart,
                  onScaleUpdate: _handleScaleUpdate,
                  onTapDown: (TapDownDetails details) =>
                      _onViewFinderTap(details, constraints),
                );
              },
            ),
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _topControlsWidget() {
    final leftHandedMode =
        Preferences.getLeftHandedMode() &&
        MediaQuery.of(context).orientation == Orientation.landscape;

    final left = leftHandedMode ? null : 0.0;
    final right = leftHandedMode ? 0.0 : null;

    return Positioned(
      top: 0,
      left: left,
      right: MediaQuery.of(context).orientation == Orientation.portrait
          ? 0
          : right,
      bottom: MediaQuery.of(context).orientation == Orientation.portrait
          ? null
          : 0,
      child: RotatedBox(
        quarterTurns: MediaQuery.of(context).orientation == Orientation.portrait
            ? 0
            : 3,
        child: ColoredBox(
          color: Colors.black12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _cameraSwitchWidget(
                enabled:
                    controller?.value.isRecordingVideo == false &&
                    _timerStopwatch.elapsedTicks <= 1,
              ),
              TimerButton(
                enabled:
                    !isVideoCameraSelected && _timerStopwatch.elapsedTicks <= 1,
              ),
              FlashModeWidget(
                controller: controller,
                isRearCameraSelected: isRearCameraSelected,
                isVideoCameraSelected: isVideoCameraSelected,
              ),
              ResolutionButton(
                isDense: true,
                onNewCameraSelected: _initializeCameraController,
                isRearCameraSelected: isRearCameraSelected,
                enabled:
                    controller?.value.isRecordingVideo == false &&
                    _timerStopwatch.elapsedTicks <= 1,
              ),
              _settingsWidget(
                enabled:
                    controller?.value.isRecordingVideo == false &&
                    _timerStopwatch.elapsedTicks <= 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _zoomWidget(BuildContext context) {
    final leftHandedMode =
        Preferences.getLeftHandedMode() &&
        MediaQuery.of(context).orientation == Orientation.landscape;

    final left = leftHandedMode ? null : 0.0;
    final right = leftHandedMode ? 0.0 : null;

    return Positioned(
      top: MediaQuery.of(context).orientation == Orientation.portrait
          ? 0
          : null,
      right: MediaQuery.of(context).orientation == Orientation.portrait
          ? 0
          : right,
      left: MediaQuery.of(context).orientation == Orientation.portrait
          ? null
          : left,
      bottom: MediaQuery.of(context).orientation == Orientation.portrait
          ? null
          : 0,
      child: RotatedBox(
        quarterTurns: MediaQuery.of(context).orientation == Orientation.portrait
            ? 0
            : 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //_settingsWidget(),
              //_cameraSwitchWidget(),
              //const SizedBox(height: 10.0),
              //_thumbnailPreviewWidget(),
              if (!leftHandedMode) const SizedBox(height: 64),
              if (Preferences.getEnableZoomSlider())
                RotatedBox(
                  quarterTurns:
                      MediaQuery.of(context).orientation == Orientation.portrait
                      ? 0
                      : 2,
                  child: _zoomSlider(update: false),
                ),
              if (leftHandedMode) const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cameraSwitchWidget({required bool enabled}) {
    return AnimatedRotation(
      duration: const Duration(milliseconds: 400),
      turns: MediaQuery.of(context).orientation == Orientation.portrait
          ? 0
          : 0.25,
      child: IconButton(
        color: Colors.white,
        disabledColor: Colors.white24,
        onPressed: enabled
            ? () async {
                if (!isVideoCameraSelected) {
                  final status = await Permission.microphone.status;

                  if (!status.isGranted) {
                    await Permission.microphone.request();
                  } else {
                    setState(() {
                      isVideoCameraSelected = true;
                      _initializeCameraController(controller!.description);
                    });
                  }
                } else {
                  controller?.value.isRecordingVideo ?? false
                      ? null
                      : setState(() => isVideoCameraSelected = false);
                }
              }
            : null,
        iconSize: 36,
        icon: isVideoCameraSelected
            ? const Icon(Icons.camera_alt)
            : const Icon(Icons.videocam),
        tooltip: isVideoCameraSelected
            ? AppLocalizations.of(context)!.switchToPictureMode
            : AppLocalizations.of(context)!.switchToVideoRecordingMode,
      ),
    );
  }

  Widget _settingsWidget({required bool enabled}) {
    return AnimatedRotation(
      duration: const Duration(milliseconds: 400),
      turns: MediaQuery.of(context).orientation == Orientation.portrait
          ? 0
          : 0.25,
      child: SettingsButton(
        onPressed: enabled
            ? () async {
                _stopVolumeButtons();
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => SettingsPage(
                      controller: controller,
                      onNewCameraSelected: _initializeCameraController,
                    ),
                  ),
                );
              }
            : null,
        controller: controller,
      ),
    );
  }

  Widget _thumbnailPreviewWidget() {
    return _timerStopwatch.elapsedTicks > 1 ||
            (controller?.value.isRecordingVideo ?? false)
        ? const SizedBox(height: 60, width: 60)
        : AnimatedRotation(
            duration: const Duration(milliseconds: 400),
            turns: MediaQuery.of(context).orientation == Orientation.portrait
                ? 0
                : 0.25,
            child: Tooltip(
              message: AppLocalizations.of(context)!.openCapturedPictureOrVideo,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 52,
                  height: 52,
                  child: GestureDetector(
                    onTap: () async {
                      final deviceInfo = DeviceInfoPlugin();
                      final androidInfo = await deviceInfo.androidInfo;
                      final sdkInt = androidInfo.version.sdkInt;

                      final String mimeType;
                      if (capturedFile!.path.split('.').last == 'mp4') {
                        mimeType = 'video/mp4';
                      } else {
                        switch (getCompressFormat()) {
                          case CompressFormat.jpeg:
                            mimeType = 'image/jpeg';
                          case CompressFormat.png:
                            mimeType = 'image/png';
                          case CompressFormat.webp:
                            mimeType = 'image/webp';
                          default:
                            mimeType = 'image/jpeg';
                        }
                      }

                      final methodChannel = AndroidMethodChannel();
                      await methodChannel.openItem(
                        file: capturedFile!,
                        mimeType: mimeType,
                        openInGallery: !(sdkInt > 27),
                      );
                    },
                    child: _thumbnailWidget(),
                  ),
                ),
              ),
            ),
          );
  }

  Widget _bottomControlsWidget() {
    final leftHandedMode =
        Preferences.getLeftHandedMode() &&
        MediaQuery.of(context).orientation == Orientation.landscape;

    final cameraControls = <Widget>[
      if (Preferences.getEnableModeRow()) _cameraModesWidget(),
      if (Preferences.getEnableModeRow()) const Divider(color: Colors.blue),
      if (Preferences.getEnableExposureSlider())
        ExposureSlider(
          setExposureOffset: _setExposureOffset,
          currentExposureOffset: _currentExposureOffset,
          minAvailableExposureOffset: _minAvailableExposureOffset,
          maxAvailableExposureOffset: _maxAvailableExposureOffset,
        ),
      if (Preferences.getEnableExposureSlider())
        const Divider(color: Colors.blue),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: CaptureControlWidget(
          controller: controller,
          onTakePictureButtonPressed: onTakePictureButtonPressed,
          onVideoRecordButtonPressed: onVideoRecordButtonPressed,
          onResumeButtonPressed: onResumeButtonPressed,
          onPauseButtonPressed: onPauseButtonPressed,
          onStopButtonPressed: onStopButtonPressed,
          onNewCameraSelected: onNewCameraSelected,
          isVideoCameraSelected: isVideoCameraSelected,
          isRecordingInProgress: controller?.value.isRecordingVideo ?? false,
          /*flashWidget: FlashModeControlRowWidget(
                controller: controller,
                isRearCameraSelected: isRearCameraSelected,
              ),*/
          leadingWidget: _thumbnailPreviewWidget(),
          isRearCameraSelected: getIsRearCameraSelected(),
          setIsRearCameraSelected: setIsRearCameraSelected,
        ),
      ),
    ];

    final bottomControls = <Widget>[
      if (controller != null &&
          isVideoCameraSelected &&
          controller!.value.isRecordingVideo)
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 400),
              turns: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 0
                  : 0.25,
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _stopwatch.elapsed.inSeconds < 60
                      ? '${_stopwatch.elapsed.inSeconds}s'
                      : '${_stopwatch.elapsed.inMinutes}m ${_stopwatch.elapsed.inSeconds % 60}s',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ColoredBox(
        color: Colors.black12,
        child: Column(
          children: leftHandedMode
              ? cameraControls.reversed.toList()
              : cameraControls,
        ),
      ),
    ];

    return RotatedBox(
      quarterTurns: MediaQuery.of(context).orientation == Orientation.portrait
          ? 0
          : 3,
      child: Column(
        mainAxisAlignment: leftHandedMode
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: leftHandedMode
            ? bottomControls.reversed.toList()
            : bottomControls,
      ),
    );
  }

  Widget _cameraModesWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ExposureModeControlWidget(controller: controller),
        FocusModeControlWidget(controller: controller),
      ],
    );
  }

  //Selecting camera
  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      return controller!.setDescription(cameraDescription);
    } else {
      return _initializeCameraController(cameraDescription);
    }
  }

  Future<void> _initializeCameraController(
    CameraDescription cameraDescription,
  ) async {
    final flashMode = getFlashMode();
    final resolution = getResolution();

    final cameraController = CameraController(
      cameraDescription,
      resolution,
      enableAudio: isVideoCameraSelected && Preferences.getEnableAudio(),
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    try {
      await cameraController.initialize();
      await Future.wait(<Future<Object?>>[
        cameraController.setFlashMode(flashMode),
        cameraController.getMinExposureOffset().then(
          (double value) => _minAvailableExposureOffset = value,
        ),
        cameraController.getMaxExposureOffset().then(
          (double value) => _maxAvailableExposureOffset = value,
        ),
        cameraController.getMaxZoomLevel().then(
          (double value) => _maxAvailableZoom = value,
        ),
        cameraController.getMinZoomLevel().then(
          (double value) => _minAvailableZoom = value,
        ),
      ]);
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          if (kDebugMode) {
            print('You have denied camera access.');
          }
        case 'AudioAccessDenied':
          if (kDebugMode) {
            print('You have denied audio access.');
          }
        default:
          if (kDebugMode) {
            print('$e: ${e.description}');
          }
      }
    }

    if (mounted) {
      await _refreshGalleryImages();

      setState(() {});
    }

    checkVolumeButtons();

    /*startCameraProcessing();

    cameraController.startImageStream((image) async {
      CodeResult result = await processCameraImage(image);
      if (result.isValidBool) {
        print('QR: ${result.textString}');
      }
      return null;
    });*/
  }

  bool getIsRearCameraSelected() {
    return isRearCameraSelected;
  }

  void setIsRearCameraSelected() {
    setState(() => isRearCameraSelected = !isRearCameraSelected);
  }

  //Camera button functions
  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          videoThumbnailUint8list = null;
        });
      }
    });
  }

  void onVideoRecordButtonPressed() {
    if (!Preferences.getDisableShutterSound()) {
      final methodChannel = AndroidMethodChannel();
      methodChannel.startVideoSound();
    }

    startVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void onStopButtonPressed() {
    stopVideoRecording().then((XFile? file) async {
      if (mounted) {
        setState(() {});
      }
      if (file != null) {
        capturedFile = File(file.path);

        final directory = Preferences.getSavePath();

        final fileFormat = capturedFile!.path.split('.').last;
        final path = '$directory/VID_${timestamp()}.$fileFormat';

        try {
          final tempFile = capturedFile!.copySync(path);

          final methodChannel = AndroidMethodChannel();
          await methodChannel.updateItem(file: tempFile);
          capturedFile = File(path);
        } catch (e) {
          if (mounted) showSnackbar(text: e.toString());
        }

        await File(file.path).delete();

        if (kDebugMode) {
          print('Video recorded to $path');
        }
        await _refreshGalleryImages();
      }
    });
  }

  void onPauseButtonPressed() {
    pauseVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
      if (kDebugMode) {
        print('Video recording paused');
      }
    });
  }

  void onResumeButtonPressed() {
    resumeVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
      if (kDebugMode) {
        print('Video recording resumed');
      }
    });
  }

  //Camera controls
  Future<XFile?> takePicture() async {
    setState(() {
      Timer.periodic(
        const Duration(milliseconds: 500),
        (Timer t) => setState(() {}),
      );
      _timerStopwatch.start();
    });

    await Future<void>.delayed(
      Duration(seconds: Preferences.getTimerDuration()),
    );

    setState(() {
      _timerStopwatch
        ..stop()
        ..reset();
    });

    final cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      if (kDebugMode) {
        print('Error: select a camera first.');
      }
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already going on, return
      return null;
    }

    try {
      final file = await cameraController.takePicture();
      takingPicture = true;

      if (!Preferences.getDisableShutterSound()) {
        final methodChannel = AndroidMethodChannel();
        methodChannel.shutterSound();
      }

      capturedFile = File(file.path);

      final directory = Preferences.getSavePath();

      //String fileFormat = capturedFile!.path.split('.').last;
      final format = getCompressFormat();
      final String fileFormat;
      switch (getCompressFormat()) {
        case CompressFormat.jpeg:
          fileFormat = 'jpg';
        case CompressFormat.png:
          fileFormat = 'png';
        case CompressFormat.webp:
          fileFormat = 'webp';
        case CompressFormat.heic:
          fileFormat = 'heic';
      }

      final path = '$directory/IMG_${timestamp()}.$fileFormat';

      if (!isRearCameraSelected && Preferences.getFlipFrontCameraPhoto()) {
        final imageBytes = await capturedFile!.readAsBytes();
        final originalImage = img.decodeImage(imageBytes);
        final fixedImage = img.flipHorizontal(originalImage!);

        await capturedFile!.writeAsBytes(
          img.encodeJpg(fixedImage),
          flush: true,
        );
      }

      /*final resolutionString = Preferences.getResolution();
      ResolutionPreset resolution = ResolutionPreset.high;
      for (var res in ResolutionPreset.values) {
        if (res.name == resolutionString) resolution = res;
      }*/

      final newFileBytes = await FlutterImageCompress.compressWithFile(
        capturedFile!.path,
        quality: Preferences.getCompressQuality(),
        keepExif: Preferences.getKeepEXIFMetadata(),
        format: format,
      );

      //var tempFile = capturedFile!.copySync('$directory/IMG_${timestamp()}.$fileFormat');
      try {
        final tempFile = capturedFile!.copySync(path);
        await tempFile.writeAsBytes(newFileBytes!);

        final methodChannel = AndroidMethodChannel();
        await methodChannel.updateItem(file: tempFile);
        capturedFile = File(path);
      } catch (e) {
        if (mounted) showSnackbar(text: e.toString());
      }

      /*Uint8List? newFileBytes = await FlutterImageCompress.compressWithFile(
          capturedFile!.path,
          quality: Preferences.getCompressQuality(),
          keepExif: Preferences.getKeepEXIFMetadata());
      File? newFile = await File(path).create();
      newFile.writeAsBytesSync(newFileBytes!);*/

      /*Directory? finalPath = await getExternalStorageDirectory();
      await FlutterImageCompress.compressAndGetFile(
          capturedFile!.path, finalPath!.path,
          quality: Preferences.getCompressQuality(),
          keepExif: Preferences.getKeepEXIFMetadata());*/

      //OLD without compression and removal of EXIF data: await capturedFile!.copy(path);

      if (kDebugMode) {
        print('Picture saved to $path');
      }

      takingPicture = false;

      await _refreshGalleryImages();

      await File(file.path).delete();

      return file;
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('$e: ${e.description}');
      }
      return null;
    }
  }

  Future<void> startVideoRecording() async {
    setState(() {
      Timer.periodic(const Duration(seconds: 1), (Timer t) => setState(() {}));
      _stopwatch.start();
    });

    final cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      if (kDebugMode) {
        print('Error: select a camera first.');
      }
      return;
    }

    if (cameraController.value.isRecordingVideo) {
      // A recording already started, return
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('$e: ${e.description}');
      }
      return;
    }
  }

  Future<XFile?> stopVideoRecording() async {
    setState(() {
      _stopwatch.stop();
      _stopwatch.reset();
    });

    final cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('$e: ${e.description}');
      }
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    setState(_stopwatch.stop);

    final cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.pauseVideoRecording();
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('$e: ${e.description}');
      }
      rethrow;
    }
  }

  Future<void> resumeVideoRecording() async {
    setState(_stopwatch.start);

    final cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.resumeVideoRecording();
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('$e: ${e.description}');
      }
      rethrow;
    }
  }

  //Zoom
  Widget _zoomSlider({required bool update}) {
    if (mounted && update) {
      setState(() {});
    }

    if (_currentScale > _maxAvailableZoom) {
      _currentScale = _maxAvailableZoom;
    }

    return RotatedBox(
      quarterTurns: 3,
      child: SliderTheme(
        data: SliderThemeData(
          showValueIndicator: ShowValueIndicator.onDrag,
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Slider(
          value: _currentScale,
          min: _minAvailableZoom,
          max: _maxAvailableZoom,
          label: _currentScale.toStringAsFixed(2),
          onChanged: (value) async {
            setState(() {
              _currentScale = value;
            });
            await controller!.setZoomLevel(value);
          },
        ),
      ),
    );
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _onViewFinderTap(
    TapDownDetails details,
    BoxConstraints constraints,
  ) async {
    if (controller == null) {
      return;
    }

    final cameraController = controller!;

    _circlePosX = details.globalPosition.dx;
    _circlePosY = details.globalPosition.dy;

    await _displayCircle();

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    await cameraController.setExposurePoint(offset);
    await cameraController.setFocusPoint(offset);
  }

  Future<void> _displayCircle() async {
    setState(() {
      _circleEnabled = true;
    });
    await Future<void>.delayed(const Duration(milliseconds: 600));
    setState(() {
      _circleEnabled = false;
    });
  }

  Widget _circleWidget() {
    const circleRadius = 42.0;

    return Positioned(
      top: _circlePosY - (circleRadius / 2),
      left: _circlePosX - (circleRadius / 2),
      child: _circleEnabled
          ? TweenAnimationBuilder(
              tween: _scaleTween,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              builder: (context, scale, child) {
                return Transform.scale(scale: scale, child: child);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.circle,
                  color: Colors.transparent,
                  size: circleRadius,
                ),
              ),
            )
          : Container(),
    );
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (controller == null || _pointers != 2) {
      return;
    }

    _currentScale = (_baseScale * details.scale).clamp(
      _minAvailableZoom,
      _maxAvailableZoom,
    );

    _zoomSlider(update: true);

    await controller!.setZoomLevel(_currentScale);
  }

  //Exposure
  Future<void> _setExposureOffset(double offset) async {
    if (controller == null) {
      return;
    }

    setState(() {
      _currentExposureOffset = offset;
    });
    try {
      offset = await controller!.setExposureOffset(offset);
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('$e: ${e.description}');
      }
      rethrow;
    }
  }

  //Thumbnail
  Widget _thumbnailWidget() {
    if (videoThumbnailUint8list == null && capturedFile == null) {
      return const Center(); //child: CircularProgressIndicator(),
    } else {
      if (videoThumbnailUint8list == null) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(File(capturedFile!.path)),
            ),
          ),
        );
      } else {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: 42,
                      height: 42,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: MemoryImage(videoThumbnailUint8list!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black45,
              child: Icon(Icons.play_arrow, size: 20, color: Colors.white),
            ),
          ],
        );
      }
    }
  }

  Future<void> _refreshGalleryImages() async {
    final allFileList = <File>[];

    final directory = Directory(Preferences.getSavePath());

    var fileList = <FileSystemEntity>[];
    try {
      fileList = await directory.list().toList();
    } catch (e) {
      showSnackbar(text: e.toString());
      return;
    }

    final fileNames = <String>[];
    final dateTimes = <DateTime>[];

    var recentFileName = '';

    for (final file in fileList) {
      if (file.path.contains('.jpg') ||
          file.path.contains('.png') ||
          file.path.contains('.webp') ||
          file.path.contains('.mp4')) {
        allFileList.add(File(file.path));
        final name = file.path.split('/').last; //.split('.').first;
        final stat = FileStat.statSync(file.path);

        dateTimes.add(stat.modified);

        fileNames.add(name);
      }
    }

    if (fileNames.isNotEmpty) {
      for (final name in fileNames) {
        final now = DateTime.now();
        final mostRecentDateTimeToNow = dateTimes.reduce(
          (a, b) => a.difference(now).abs() < b.difference(now).abs() ? a : b,
        );

        final file = File('${directory.path}/$name');

        final stat = FileStat.statSync(file.path);
        if (stat.changed.isAtSameMomentAs(mostRecentDateTimeToNow)) {
          recentFileName = name;
        }
      }

      capturedFile = File('${directory.path}/$recentFileName');

      if (recentFileName.contains('.mp4')) {
        await _showVideoPlayer();
      }
    }
  }

  Future<void> _showVideoPlayer() async {
    if (capturedFile == null) {
      return;
    }

    videoThumbnailUint8list =
        await video_thumbnail.VideoThumbnail.thumbnailData(
          video: 'file://${capturedFile?.path}',
          imageFormat: video_thumbnail.ImageFormat.JPEG,
          maxWidth: 100,
          quality: 20,
        );

    setState(() {});
  }

  //Misc
  String timestamp() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyyMMdd_HHmmss');
    final formatted = formatter.format(now);
    return formatted;
  }

  void showSnackbar({required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 5)),
    );
  }
}

class AndroidMethodChannel {
  static const _channel = MethodChannel('media_store');

  Future<void> updateItem({required File file}) async {
    await _channel.invokeMethod('updateItem', {'path': file.path});
  }

  Future<void> openItem({
    required File file,
    required String mimeType,
    required bool openInGallery,
  }) async {
    await _channel.invokeMethod('openItem', {
      'path': file.path,
      'mimeType': mimeType,
      'openInGallery': openInGallery,
    });
  }

  Future<void> disableIntentCamera({required bool disable}) async {
    await _channel.invokeMethod('disableIntentCamera', {'disable': disable});
  }

  Future<void> shutterSound() async {
    await _channel.invokeMethod('shutterSound', <String, dynamic>{});
  }

  Future<void> startVideoSound() async {
    await _channel.invokeMethod('startVideoSound', <String, dynamic>{});
  }
}
