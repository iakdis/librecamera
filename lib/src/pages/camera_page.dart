import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:librecamera/l10n/app_localizations.dart';
import 'package:librecamera/main.dart';
import 'package:librecamera/src/models/media_file.dart';
import 'package:librecamera/src/pages/settings_page.dart';
import 'package:librecamera/src/provider/theme_provider.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:librecamera/src/volume_button_listener.dart';
import 'package:librecamera/src/widgets/capture_control.dart';
import 'package:librecamera/src/widgets/exposure.dart';
import 'package:librecamera/src/widgets/flash.dart';
import 'package:librecamera/src/widgets/focus.dart';
import 'package:librecamera/src/widgets/resolution.dart';
import 'package:librecamera/src/widgets/timer.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart' as qr;

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
  File? _capturedFile;
  CameraController? _cameraController;
  VideoPlayerController? _videoPlayerController;

  //Zoom
  static const _defaultZoomLevel = 1.0;
  double _minAvailableZoom = 1;
  double _maxAvailableZoom = 1;
  final ValueNotifier<double> _currentScaleNotifier = ValueNotifier(1);
  final ValueNotifier<bool> _showZoomSliderNotifier = ValueNotifier(
    Preferences.getEnableZoomSlider(),
  );
  double _baseScale = 1;
  int _pointers = 0;

  //Exposure
  double _minAvailableExposureOffset = 0;
  double _maxAvailableExposureOffset = 0;
  final ValueNotifier<double> _currentExposureOffsetNotifier = ValueNotifier(0);

  //Current camera
  final ValueNotifier<bool> _isRearCameraSelectedNotifier = ValueNotifier(
    Preferences.getStartWithRearCamera(),
  );
  final ValueNotifier<bool> _isVideoCameraSelectedNotifier = ValueNotifier(
    false,
  );
  bool takingPicture = false;

  //Circle position
  double _circlePosX = 0;
  double _circlePosY = 0;
  final ValueNotifier<bool> _circleEnabledNotifier = ValueNotifier(false);
  final Tween<double> _scaleTween = Tween<double>(begin: 1, end: 0.75);

  //Video recording timer
  final Stopwatch _stopwatch = Stopwatch();

  //Photo capture timer
  final Stopwatch _timerStopwatch = Stopwatch();

  //Orientation
  DateTime _timeOfLastChange = DateTime.now();

  //Volume buttons
  StreamSubscription<VolumeButton>? volumeSubscription;
  bool canPressVolume = true;

  //Zoom slider auto-hide
  Timer? _zoomSliderHideTimer;
  bool _isInteractingWithSlider = false;

  final ValueNotifier<bool> _showPreviewNotifier = ValueNotifier(true);

  MediaFile? _recentMediaFile;

  static const _thumbnailImageSize = 52.0;
  static const _topControlsHeight = 64.0;

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

    unawaited(
      onNewCameraSelected(
        cameras[Preferences.getStartWithRearCamera() ? 0 : 1],
      ),
    );
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
    unawaited(_videoPlayerController?.dispose());
    _zoomSliderHideTimer?.cancel();
    //qrController?.dispose();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final cameraController = _cameraController;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      unawaited(_hideCamera(cameraController));
    } else if (state == AppLifecycleState.resumed) {
      unawaited(_showCamera(cameraController));
    }
  }

  Future<void> _hideCamera(CameraController cameraController) async {
    if (mounted) _showPreviewNotifier.value = false;
    await cameraController.dispose();
  }

  Future<void> _showCamera(CameraController cameraController) async {
    await _initializeCameraController(cameraController.description);
    if (mounted) _showPreviewNotifier.value = true;
  }

  void _subscribeVolumeButtons() {
    volumeSubscription = VolumeButtonListener.stream.listen((
      event,
    ) async {
      if (canPressVolume) {
        final int delay;
        if (_isVideoCameraSelectedNotifier.value) {
          delay = 2;
          await (_cameraController?.value.isRecordingVideo ?? false
              ? onStopButtonPressed()
              : onVideoRecordButtonPressed());
        } else {
          delay = 1;
          await onTakePictureButtonPressed();
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

    nativeDeviceOrientationCommunicator
        .onOrientationChanged(
          useSensor: true,
        )
        .listen((event) {
          final orientation = nativeDeviceOrientationCommunicator.orientation(
            useSensor: true,
          );

          _timeOfLastChange = DateTime.now();
          Future.delayed(const Duration(milliseconds: 500), () async {
            if (DateTime.now().difference(_timeOfLastChange).inMilliseconds >
                500) {
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
    final leftHandedMode =
        Preferences.getLeftHandedMode() &&
        MediaQuery.orientationOf(context) == Orientation.landscape;

    return ColoredBox(
      color: Colors.black,
      child: Stack(
        children: [
          /*qr.QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),*/
          Positioned(
            top: MediaQuery.orientationOf(context) == Orientation.portrait
                ? _topControlsHeight
                : 0,
            bottom: MediaQuery.orientationOf(context) == Orientation.portrait
                ? null
                : 0,
            left: MediaQuery.orientationOf(context) == Orientation.portrait
                ? 0
                : leftHandedMode
                ? null
                : _topControlsHeight,
            right: MediaQuery.orientationOf(context) == Orientation.portrait
                ? 0
                : leftHandedMode
                ? _topControlsHeight
                : null,

            child: SafeArea(
              top: MediaQuery.orientationOf(context) == Orientation.portrait,
              bottom: MediaQuery.orientationOf(context) == Orientation.portrait,
              left: MediaQuery.orientationOf(context) == Orientation.landscape,
              right: MediaQuery.orientationOf(context) == Orientation.landscape,
              child: _previewWidget(),
            ),
          ),
          /* Positioned(
            top: MediaQuery.orientationOf(context) == Orientation.portrait
                ? _topControlsHeight
                : 0,
            bottom: MediaQuery.orientationOf(context) == Orientation.portrait
                ? null
                : 0,
            left: MediaQuery.orientationOf(context) == Orientation.portrait
                ? 0
                : _topControlsHeight,
            right: MediaQuery.orientationOf(context) == Orientation.portrait
                ? 0
                : null,
            child: _previewWidget(),
          ), */
          SafeArea(child: _shutterBorder()),
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
          SafeArea(child: _timerWidget()),
          _topControlsWidget(),
          _zoomWidget(context),
          SafeArea(
            bottom: MediaQuery.orientationOf(context) == Orientation.portrait,
            child: _bottomControlsWidget(),
          ),
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
    final cameraController = _cameraController;

    return ValueListenableBuilder(
      valueListenable: _showPreviewNotifier,
      builder: (context, showPreview, child) {
        if (showPreview &&
            (cameraController != null &&
                cameraController.value.isInitialized)) {
          return Center(
            child: Listener(
              onPointerDown: (_) => _pointers++,
              onPointerUp: (_) => _pointers--,
              child: CameraPreview(
                cameraController,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onScaleStart: _handleScaleStart,
                          onScaleUpdate: _handleScaleUpdate,
                          onTapDown: (TapDownDetails details) =>
                              _onViewFinderTap(details, constraints),
                        ),
                        _circleWidget(),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _topControlsWidget() {
    final leftHandedMode =
        Preferences.getLeftHandedMode() &&
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final left = leftHandedMode ? null : 0.0;
    final right = leftHandedMode ? 0.0 : null;

    return Positioned(
      top: 0,
      left: left,
      right: MediaQuery.orientationOf(context) == Orientation.portrait
          ? 0
          : right,
      bottom: MediaQuery.orientationOf(context) == Orientation.portrait
          ? null
          : 0,
      child: SafeArea(
        bottom: false,
        child: RotatedBox(
          quarterTurns:
              MediaQuery.orientationOf(context) == Orientation.portrait ? 0 : 3,
          child: SizedBox(
            height: _topControlsHeight,
            child: ColoredBox(
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _cameraSwitchWidget(
                    enabled:
                        _cameraController?.value.isRecordingVideo == false &&
                        _timerStopwatch.elapsedTicks <= 1,
                  ),
                  ValueListenableBuilder(
                    valueListenable: _isVideoCameraSelectedNotifier,
                    builder: (context, isVideoCameraSelected, child) {
                      return TimerButton(
                        enabled:
                            !isVideoCameraSelected &&
                            _timerStopwatch.elapsedTicks <= 1,
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: _isRearCameraSelectedNotifier,
                    builder: (context, isRearCameraSelected, child) {
                      return ValueListenableBuilder(
                        valueListenable: _isVideoCameraSelectedNotifier,
                        builder: (context, isVideoCameraSelected, child) {
                          return FlashModeWidget(
                            controller: _cameraController,
                            isRearCameraSelected: isRearCameraSelected,
                            isVideoCameraSelected: isVideoCameraSelected,
                          );
                        },
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: _isRearCameraSelectedNotifier,
                    builder: (context, isRearCameraSelected, child) {
                      return ResolutionButton(
                        isDense: true,
                        onNewCameraSelected: _initializeCameraController,
                        isRearCameraSelected: isRearCameraSelected,
                        enabled:
                            _cameraController?.value.isRecordingVideo ==
                                false &&
                            _timerStopwatch.elapsedTicks <= 1,
                      );
                    },
                  ),
                  _settingsWidget(
                    enabled:
                        _cameraController?.value.isRecordingVideo == false &&
                        _timerStopwatch.elapsedTicks <= 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _zoomWidget(BuildContext context) {
    final leftHandedMode =
        Preferences.getLeftHandedMode() &&
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final left = leftHandedMode ? null : 0.0;
    final right = leftHandedMode ? 0.0 : null;

    return Positioned(
      top: MediaQuery.orientationOf(context) == Orientation.portrait ? 0 : null,
      right: MediaQuery.orientationOf(context) == Orientation.portrait
          ? 0
          : right,
      left: MediaQuery.orientationOf(context) == Orientation.portrait
          ? null
          : left,
      bottom: MediaQuery.orientationOf(context) == Orientation.portrait
          ? null
          : 0,
      child: SafeArea(
        child: RotatedBox(
          quarterTurns:
              MediaQuery.orientationOf(context) == Orientation.portrait ? 0 : 3,
          child: ValueListenableBuilder(
            valueListenable: _showZoomSliderNotifier,
            builder: (context, showZoomSlider, child) {
              return Column(
                children: [
                  //_settingsWidget(),
                  //_cameraSwitchWidget(),
                  //const SizedBox(height: 10.0),
                  //_thumbnailPreviewWidget(),
                  if (!leftHandedMode) const SizedBox(height: 64),
                  if (showZoomSlider || Preferences.getEnableZoomSlider())
                    RotatedBox(
                      quarterTurns:
                          MediaQuery.orientationOf(context) ==
                              Orientation.portrait
                          ? 0
                          : 2,
                      child: _zoomSlider(),
                    ),
                  if (leftHandedMode) const SizedBox(height: 64),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _cameraSwitchWidget({required bool enabled}) {
    return AnimatedRotation(
      duration: const Duration(milliseconds: 400),
      turns: MediaQuery.orientationOf(context) == Orientation.portrait
          ? 0
          : 0.25,
      child: ValueListenableBuilder(
        valueListenable: _isVideoCameraSelectedNotifier,
        builder: (context, isVideoCameraSelected, child) {
          return IconButton(
            color: Colors.white,
            disabledColor: Colors.white24,
            onPressed: enabled
                ? () async {
                    if (!_isVideoCameraSelectedNotifier.value) {
                      final status = await Permission.microphone.status;

                      if (!status.isGranted) {
                        await Permission.microphone.request();
                      }

                      await _initializeCameraController(
                        _cameraController!.description,
                      );
                      _isVideoCameraSelectedNotifier.value = true;
                    } else if (!(_cameraController?.value.isRecordingVideo ??
                        false)) {
                      _isVideoCameraSelectedNotifier.value = false;
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
          );
        },
      ),
    );
  }

  Widget _settingsWidget({required bool enabled}) {
    return AnimatedRotation(
      duration: const Duration(milliseconds: 400),
      turns: MediaQuery.orientationOf(context) == Orientation.portrait
          ? 0
          : 0.25,
      child: SettingsButton(
        onPressed: enabled
            ? () async {
                _stopVolumeButtons();
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        SettingsPage(controller: _cameraController),
                  ),
                );
                await _initializeCameraController(
                  _cameraController!.description,
                );
              }
            : null,
        controller: _cameraController,
      ),
    );
  }

  Widget _thumbnailPreviewWidget() {
    return _timerStopwatch.elapsedTicks > 1 ||
            (_cameraController?.value.isRecordingVideo ?? false)
        ? const SizedBox(height: 60, width: 60)
        : AnimatedRotation(
            duration: const Duration(milliseconds: 400),
            turns: MediaQuery.orientationOf(context) == Orientation.portrait
                ? 0
                : 0.25,
            child: Tooltip(
              message: AppLocalizations.of(context)!.openCapturedPictureOrVideo,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: _thumbnailImageSize,
                  height: _thumbnailImageSize,
                  child: GestureDetector(
                    onTap: () async {
                      final deviceInfo = DeviceInfoPlugin();
                      final androidInfo = await deviceInfo.androidInfo;
                      final sdkInt = androidInfo.version.sdkInt;

                      final String mimeType;
                      if (_capturedFile!.path.split('.').last == 'mp4') {
                        mimeType = 'video/mp4';
                      } else {
                        final format = CompressFormat.values.firstWhere(
                          (format) =>
                              format.name == Preferences.getCompressFormat(),
                          orElse: () => CompressFormat.jpeg,
                        );
                        switch (format) {
                          case CompressFormat.jpeg:
                            mimeType = 'image/jpeg';
                          case CompressFormat.png:
                            mimeType = 'image/png';
                          case CompressFormat.webp:
                            mimeType = 'image/webp';
                          case CompressFormat.heic:
                            mimeType = 'image/heic';
                        }
                      }

                      final methodChannel = AndroidMethodChannel();
                      await methodChannel.openItem(
                        file: _capturedFile!,
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
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final cameraControls = <Widget>[
      if (Preferences.getEnableModeRow()) _cameraModesWidget(),
      if (Preferences.getEnableModeRow()) const Divider(),
      if (Preferences.getEnableExposureSlider())
        ValueListenableBuilder(
          valueListenable: _currentExposureOffsetNotifier,
          builder: (context, currentExposureOffset, child) {
            return ExposureSlider(
              setExposureOffset: _setExposureOffset,
              currentExposureOffset: currentExposureOffset,
              minAvailableExposureOffset: _minAvailableExposureOffset,
              maxAvailableExposureOffset: _maxAvailableExposureOffset,
            );
          },
        ),
      if (Preferences.getEnableExposureSlider()) const Divider(),
      Container(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: ValueListenableBuilder(
          valueListenable: _isRearCameraSelectedNotifier,
          builder: (context, isRearCameraSelected, child) {
            return ValueListenableBuilder(
              valueListenable: _isVideoCameraSelectedNotifier,
              builder: (context, isVideoCameraSelected, child) {
                return CaptureControlWidget(
                  controller: _cameraController,
                  onTakePictureButtonPressed: onTakePictureButtonPressed,
                  onVideoRecordButtonPressed: onVideoRecordButtonPressed,
                  onResumeButtonPressed: onResumeButtonPressed,
                  onPauseButtonPressed: onPauseButtonPressed,
                  onStopButtonPressed: onStopButtonPressed,
                  onNewCameraSelected: onNewCameraSelected,
                  isVideoCameraSelected: isVideoCameraSelected,
                  isRecordingInProgress:
                      _cameraController?.value.isRecordingVideo ?? false,
                  /*flashWidget: FlashModeControlRowWidget(
                        controller: controller,
                        isRearCameraSelected: isRearCameraSelected,
                      ),*/
                  leadingWidget: _thumbnailPreviewWidget(),
                  isRearCameraSelected: isRearCameraSelected,
                  setIsRearCameraSelected: () =>
                      _isRearCameraSelectedNotifier.value =
                          !_isRearCameraSelectedNotifier.value,
                );
              },
            );
          },
        ),
      ),
    ];

    final bottomControls = <Widget>[
      ValueListenableBuilder(
        valueListenable: _isVideoCameraSelectedNotifier,
        builder: (context, isVideoCameraSelected, child) {
          if (_cameraController != null &&
              isVideoCameraSelected &&
              _cameraController!.value.isRecordingVideo) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 400),
                  turns:
                      MediaQuery.orientationOf(context) == Orientation.portrait
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
            );
          } else {
            return const SizedBox.shrink();
          }
        },
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
      quarterTurns: MediaQuery.orientationOf(context) == Orientation.portrait
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
        ExposureModeControlWidget(controller: _cameraController),
        FocusModeControlWidget(controller: _cameraController),
      ],
    );
  }

  //Selecting camera
  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (_cameraController != null) {
      await _cameraController!.setDescription(cameraDescription);
    } else {
      await _initializeCameraController(cameraDescription);
    }

    // Reset zoom level
    _currentScaleNotifier.value = _defaultZoomLevel;
  }

  Future<void> _initializeCameraController(
    CameraDescription cameraDescription,
  ) async {
    final flashMode = getFlashMode();
    final resolution = getResolution();

    final cameraController = CameraController(
      cameraDescription,
      resolution,
      enableAudio:
          _isVideoCameraSelectedNotifier.value && Preferences.getEnableAudio(),
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    _cameraController = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        if (kDebugMode) {
          print(
            'Camera error ${cameraController.value.errorDescription}',
          );
        }
      }
    });

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

  //Camera button functions
  Future<void> onTakePictureButtonPressed() async {
    await takePicture();
  }

  Future<void> onVideoRecordButtonPressed() async {
    if (!Preferences.getDisableShutterSound()) {
      await AndroidMethodChannel().startVideoSound();
    }

    await startVideoRecording();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> onStopButtonPressed() async {
    final file = await stopVideoRecording();

    if (mounted) {
      setState(() {});
    }
    if (file != null) {
      _capturedFile = File(file.path);

      final directory = Preferences.getSavePath();

      final fileFormat = _capturedFile!.path.split('.').last;
      final path = '$directory/VID_${timestamp()}.$fileFormat';

      try {
        final tempFile = await _capturedFile!.copy(path);

        final methodChannel = AndroidMethodChannel();
        await methodChannel.updateItem(file: tempFile);
        _capturedFile = File(path);
      } catch (e) {
        if (mounted) showSnackbar(text: e.toString());
      }

      await File(file.path).delete();

      if (kDebugMode) {
        print('Video recorded to $path');
      }
      await _refreshGalleryImages();
    }
  }

  Future<void> onPauseButtonPressed() async {
    await pauseVideoRecording();

    if (kDebugMode) {
      print('Video recording paused');
    }
  }

  Future<void> onResumeButtonPressed() async {
    await resumeVideoRecording();

    if (kDebugMode) {
      print('Video recording resumed');
    }
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

    final cameraController = _cameraController;
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
        await AndroidMethodChannel().shutterSound();
      }

      _capturedFile = File(file.path);
      final imageBytes = await _capturedFile!.readAsBytes();
      var decodedImage = img.decodeImage(imageBytes);

      final directory = Preferences.getSavePath();

      //String fileFormat = capturedFile!.path.split('.').last;
      final format = CompressFormat.values.firstWhere(
        (format) => format.name == Preferences.getCompressFormat(),
        orElse: () => CompressFormat.jpeg,
      );
      final String fileFormat;
      switch (format) {
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

      if (!_isRearCameraSelectedNotifier.value &&
          Preferences.getFlipFrontCameraPhoto()) {
        decodedImage = img.flipHorizontal(decodedImage!);
      }

      if (!Preferences.getKeepEXIFMetadata()) {
        decodedImage!.exif = img.ExifData();
      }

      await _capturedFile!.writeAsBytes(
        img.encodeJpg(decodedImage!),
        flush: true,
      );

      Uint8List? fileBytes;

      if (Preferences.getEnableCompression()) {
        fileBytes = await FlutterImageCompress.compressWithFile(
          _capturedFile!.path,
          minHeight: decodedImage.height,
          minWidth: decodedImage.width,
          quality: Preferences.getCompressQuality(),
          keepExif: Preferences.getKeepEXIFMetadata(),
          format: format,
        );
      } else {
        fileBytes = await _capturedFile!.readAsBytes();
      }

      try {
        if (fileBytes == null) {
          throw Exception('Failed to compress image.');
        }

        final file = await _capturedFile!.copy(path);
        await file.writeAsBytes(fileBytes);

        final methodChannel = AndroidMethodChannel();
        await methodChannel.updateItem(file: file);
        _capturedFile = File(path);
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

    final cameraController = _cameraController;

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
      _stopwatch
        ..stop()
        ..reset();
    });

    final cameraController = _cameraController;

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

    final cameraController = _cameraController;

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

    final cameraController = _cameraController;

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
  Widget _zoomSlider() {
    final leftHandedMode =
        Preferences.getLeftHandedMode() &&
        MediaQuery.orientationOf(context) == Orientation.landscape;

    return Column(
      children: [
        if (!leftHandedMode &&
            MediaQuery.orientationOf(context) == Orientation.landscape)
          _zoomResetButton(),
        Padding(
          padding: .fromLTRB(
            16,
            MediaQuery.orientationOf(context) == Orientation.portrait
                ? 16
                : leftHandedMode
                ? 16
                : 0,
            16,
            MediaQuery.orientationOf(context) == Orientation.portrait
                ? 0
                : leftHandedMode
                ? 0
                : 16,
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: SliderTheme(
              data: SliderThemeData(
                showValueIndicator: ShowValueIndicator.onDrag,
                overlayShape: SliderComponentShape.noOverlay,
              ),
              child: ValueListenableBuilder(
                valueListenable: _currentScaleNotifier,
                builder: (context, currentScale, child) {
                  return Slider(
                    value: currentScale.clamp(
                      _minAvailableZoom,
                      _maxAvailableZoom,
                    ),
                    min: _minAvailableZoom,
                    max: _maxAvailableZoom,
                    label: currentScale.toStringAsFixed(2),
                    onChangeStart: (value) {
                      _isInteractingWithSlider = true;
                      _peekZoomSlider();
                    },
                    onChanged: (value) async {
                      _currentScaleNotifier.value = value.clamp(
                        _minAvailableZoom,
                        _maxAvailableZoom,
                      );
                      await _cameraController!.setZoomLevel(value);
                      _peekZoomSlider();
                    },
                    onChangeEnd: (value) {
                      _isInteractingWithSlider = false;
                      _peekZoomSlider();
                    },
                  );
                },
              ),
            ),
          ),
        ),
        if (leftHandedMode ||
            MediaQuery.orientationOf(context) == Orientation.portrait)
          _zoomResetButton(),
      ],
    );
  }

  Widget _zoomResetButton() => ValueListenableBuilder(
    valueListenable: _currentScaleNotifier,
    builder: (context, currentScale, child) {
      if (currentScale < _defaultZoomLevel ||
          currentScale > _defaultZoomLevel) {
        return RotatedBox(
          quarterTurns:
              MediaQuery.orientationOf(context) == Orientation.portrait ? 0 : 3,
          child: IconButton(
            onPressed: () async {
              _peekZoomSlider();
              _currentScaleNotifier.value = _defaultZoomLevel;
              await _cameraController!.setZoomLevel(_defaultZoomLevel);
            },
            icon: const Icon(Icons.restore, color: primaryColor),
            tooltip: AppLocalizations.of(context)!.reset,
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    },
  );

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScaleNotifier.value;
  }

  Future<void> _onViewFinderTap(
    TapDownDetails details,
    BoxConstraints constraints,
  ) async {
    if (_cameraController == null || _pointers >= 2) {
      return;
    }

    final cameraController = _cameraController!;

    _circlePosX = details.localPosition.dx;
    _circlePosY = details.localPosition.dy;

    await _displayCircle();

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    await cameraController.setExposurePoint(offset);
    await cameraController.setFocusPoint(offset);
  }

  Future<void> _displayCircle() async {
    _circleEnabledNotifier.value = true;
    await Future<void>.delayed(const Duration(milliseconds: 600));
    _circleEnabledNotifier.value = false;
  }

  Widget _circleWidget() {
    const circleRadius = 52.0;

    return ValueListenableBuilder(
      valueListenable: _circleEnabledNotifier,
      builder: (context, circleEnabled, child) {
        if (circleEnabled) {
          return Positioned(
            top: _circlePosY - (circleRadius / 2),
            left: _circlePosX - (circleRadius / 2),
            child: TweenAnimationBuilder(
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
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _peekZoomSlider() {
    const duration = Duration(milliseconds: 1500);
    _showZoomSliderNotifier.value = true;
    _zoomSliderHideTimer?.cancel();

    _zoomSliderHideTimer = Timer(duration, () {
      if (!_isInteractingWithSlider) {
        _showZoomSliderNotifier.value = false;
      }
    });
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (_cameraController == null || _pointers != 2) {
      return;
    }

    _currentScaleNotifier.value = (_baseScale * details.scale).clamp(
      _minAvailableZoom,
      _maxAvailableZoom,
    );

    _peekZoomSlider();

    await _cameraController!.setZoomLevel(_currentScaleNotifier.value);
  }

  //Exposure
  Future<void> _setExposureOffset(double offset) async {
    if (_cameraController == null) {
      return;
    }

    _currentExposureOffsetNotifier.value = offset;

    try {
      await _cameraController!.setExposureOffset(offset);
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('$e: ${e.description}');
      }
    }
  }

  //Thumbnail
  Widget _thumbnailWidget() => switch (_recentMediaFile) {
    VideoMediaFile()
        when (_videoPlayerController?.value.isInitialized ?? false) =>
      Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _thumbnailImageSize,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: AspectRatio(
                      aspectRatio: _videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController!),
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
      ),
    ImageMediaFile() when _capturedFile != null => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(File(_capturedFile!.path)),
        ),
      ),
    ),
    _ => const Center(), //child: CircularProgressIndicator(),
  };

  Future<void> _refreshGalleryImages() async {
    final directory = Directory(Preferences.getSavePath());

    var fileList = <FileSystemEntity>[];
    try {
      fileList = await directory.list().toList();
    } catch (e) {
      showSnackbar(text: e.toString());
      return;
    }

    // Collect valid media files with their modification times
    final mediaFiles =
        <({File file, DateTime modifiedTime, MediaFile mediaFile})>[];
    for (final fileEntity in fileList) {
      final mediaFile = fileEntity.path.mediaFileByEnding();
      if (mediaFile is ImageMediaFile || mediaFile is VideoMediaFile) {
        final stat = await FileStat.stat(fileEntity.path);
        mediaFiles.add((
          file: File(fileEntity.path),
          modifiedTime: stat.modified,
          mediaFile: mediaFile!,
        ));
      }
    }

    if (mediaFiles.isNotEmpty) {
      // Sort by modification time descending (most recent first)
      mediaFiles.sort((a, b) => b.modifiedTime.compareTo(a.modifiedTime));

      // Pick the most recent file
      final mostRecent = mediaFiles.first;
      _recentMediaFile = mostRecent.mediaFile;
      _capturedFile = mostRecent.file;

      // Initialize video player if it's a video
      if (_recentMediaFile is VideoMediaFile) {
        await _initializeVideoThumbnail();
      }
    } else {
      // No media files found
      _recentMediaFile = null;
      _capturedFile = null;
    }
  }

  Future<void> _initializeVideoThumbnail() async {
    if (_capturedFile == null) {
      return;
    }

    await _videoPlayerController?.dispose();
    _videoPlayerController = VideoPlayerController.file(
      File(_capturedFile!.path),
    );
    await _videoPlayerController!.initialize();

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
