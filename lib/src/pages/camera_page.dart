import 'dart:async';
import 'dart:io';

import 'package:image/image.dart' as img;
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:librecamera/main.dart';
import 'package:video_player/video_player.dart';

import 'package:librecamera/src/pages/settings_page.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:librecamera/src/widgets/exposure.dart';
import 'package:librecamera/src/widgets/flash.dart';
import 'package:librecamera/src/widgets/focus.dart';
import 'package:librecamera/src/widgets/capture_control.dart';

/// Camera example home widget.
class CameraPage extends StatefulWidget {
  /// Default Constructor
  const CameraPage({Key? key}) : super(key: key);

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
  VideoPlayerController? videoController;
  VoidCallback? videoPlayerListener;

  //Zoom
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;
  int _pointers = 0;

  //Exposure
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;

  //Current camera
  bool isRearCameraSelected = Preferences.getStartWithRearCamera();
  bool isVideoCameraSelected = false;

  //Circle position
  double _circlePosX = 0, _circlePosY = 0;
  bool _circleEnabled = false;
  final Tween<double> _scaleTween = Tween<double>(begin: 1, end: 0.75);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    onNewCameraSelected(cameras[Preferences.getStartWithRearCamera() ? 0 : 1]);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller?.dispose();
    videoController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _cameraPreview(),
      ),
    );
  }

  Widget _cameraPreview() {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          _previewWidget(),
          _topRightControlsWidget(),
          _bottomControlsWidget(),
          _circleWidget(),
        ],
      ),
    );
  }

  Widget _previewWidget() {
    final CameraController? cameraController = controller;

    if (cameraController != null && cameraController.value.isInitialized) {
      return Listener(
        onPointerDown: (_) => _pointers++,
        onPointerUp: (_) => _pointers--,
        child: CameraPreview(
          controller!,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onScaleStart: _handleScaleStart,
              onScaleUpdate: _handleScaleUpdate,
              onTapDown: (TapDownDetails details) =>
                  _onViewFinderTap(details, constraints),
            );
          }),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Widget _topRightControlsWidget() {
    return Positioned(
      top: 0,
      right:
          MediaQuery.of(context).orientation == Orientation.portrait ? 0 : null,
      left:
          MediaQuery.of(context).orientation == Orientation.portrait ? null : 0,
      child: RotatedBox(
        quarterTurns:
            MediaQuery.of(context).orientation == Orientation.portrait ? 0 : 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 0
                        : 1,
                child: SettingsButton(
                  controller: controller,
                  onNewCameraSelected: onNewCameraSelected,
                ),
              ),
              RotatedBox(
                quarterTurns:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 0
                        : 1,
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    if (!isVideoCameraSelected) {
                      setState(() {
                        isVideoCameraSelected = true;
                      });
                    } else {
                      controller?.value.isRecordingVideo ?? false
                          ? null
                          : setState(() {
                              isVideoCameraSelected = false;
                            });
                    }
                  },
                  iconSize: 36,
                  icon: isVideoCameraSelected
                      ? const Icon(Icons.camera_alt)
                      : const Icon(Icons.videocam),
                  tooltip: isVideoCameraSelected
                      ? AppLocalizations.of(context)!.switchToPictureMode
                      : AppLocalizations.of(context)!
                          .switchToVideoRecordingMode,
                ),
              ),
              const SizedBox(height: 10.0),
              RotatedBox(
                quarterTurns:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 0
                        : 1,
                child: Tooltip(
                  message:
                      AppLocalizations.of(context)!.openCapturedPictureOrVideo,
                  child: SizedBox(
                    width: 42,
                    height: 42,
                    child: GestureDetector(
                        onTap: () {
                          final intent = AndroidIntent(
                            action: 'action_view',
                            type: 'image/*, video/*',
                            data: capturedFile?.path ?? '',
                            flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
                          );
                          intent.launch();
                        },
                        child: _thumbnailWidget()),
                  ),
                ),
              ),
              const SizedBox(height: 14.0),
              Preferences.getEnableZoomSlider()
                  ? RotatedBox(
                      quarterTurns: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 0
                          : 2,
                      child: _zoomSlider(update: false))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomControlsWidget() {
    return RotatedBox(
      quarterTurns:
          MediaQuery.of(context).orientation == Orientation.portrait ? 0 : 3,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
              color: Colors.black12,
              child: CaptureControlWidget(
                controller: controller,
                onTakePictureButtonPressed: onTakePictureButtonPressed,
                onVideoRecordButtonPressed: onVideoRecordButtonPressed,
                onResumeButtonPressed: onResumeButtonPressed,
                onPauseButtonPressed: onPauseButtonPressed,
                onStopButtonPressed: onStopButtonPressed,
                onNewCameraSelected: onNewCameraSelected,
                isVideoCameraSelected: isVideoCameraSelected,
                isRecordingInProgress:
                    controller?.value.isRecordingVideo ?? false,
                flashWidget: FlashModeControlRowWidget(
                  controller: controller,
                  isRearCameraSelected: isRearCameraSelected,
                ),
                isRearCameraSelected: getIsRearCameraSelected(),
                setIsRearCameraSelected: setIsRearCameraSelected,
              ),
            ),
            Preferences.getEnableModeRow()
                ? Container(color: Colors.black12, child: _cameraModesWidget())
                : Container(),
            Container(
              color: Colors.black12,
              child: Column(
                children: [
                  Preferences.getEnableExposureSlider()
                      ? const Divider(color: Colors.blue)
                      : Container(),
                  Preferences.getEnableExposureSlider()
                      ? ExposureSlider(
                          setExposureOffset: _setExposureOffset,
                          currentExposureOffset: _currentExposureOffset,
                          minAvailableExposureOffset:
                              _minAvailableExposureOffset,
                          maxAvailableExposureOffset:
                              _maxAvailableExposureOffset,
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
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
    final flashModeString = Preferences.getFlashMode();
    FlashMode flashMode = FlashMode.off;
    for (var mode in FlashMode.values) {
      if (mode.name == flashModeString) flashMode = mode;
    }

    final resolutionString = Preferences.getResolution();
    ResolutionPreset resolution = ResolutionPreset.high;
    for (var res in ResolutionPreset.values) {
      if (res.name == resolutionString) resolution = res;
    }

    final CameraController? oldController = controller;
    if (oldController != null) {
      controller = null;
      await oldController.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      resolution,
      enableAudio: Preferences.getEnableAudio(),
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        print('Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
      await Future.wait(<Future<Object?>>[
        cameraController.setFlashMode(flashMode),
        cameraController
            .getMinExposureOffset()
            .then((double value) => _minAvailableExposureOffset = value),
        cameraController
            .getMaxExposureOffset()
            .then((double value) => _maxAvailableExposureOffset = value),
        cameraController
            .getMaxZoomLevel()
            .then((double value) => _maxAvailableZoom = value),
        cameraController
            .getMinZoomLevel()
            .then((double value) => _minAvailableZoom = value),
      ]);
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          print('You have denied camera access.');
          break;
        case 'AudioAccessDenied':
          print('You have denied audio access.');
          break;
        default:
          print('$e: ${e.description}');
          break;
      }
    }

    if (mounted) {
      await _refreshGalleryImages();

      setState(() {});
    }
  }

  bool getIsRearCameraSelected() {
    return isRearCameraSelected;
  }

  void setIsRearCameraSelected() {
    isRearCameraSelected = !isRearCameraSelected;
  }

  //Camera button functions
  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          videoController?.dispose();
          videoController = null;
        });
      }
    });
  }

  void onVideoRecordButtonPressed() {
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

        File finalVideoFile = File(file.path);

        final directory = Preferences.getSavePath();

        String fileFormat = finalVideoFile.path.split('.').last;
        String path = '$directory/VID_${timestamp()}.$fileFormat';

        await finalVideoFile.copy(path);

        capturedFile = File(path);

        print('Video recorded to $path');
        await _refreshGalleryImages();

        _showVideoPlayer();
      }
    });
  }

  void onPauseButtonPressed() {
    pauseVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
      print('Video recording paused');
    });
  }

  void onResumeButtonPressed() {
    resumeVideoRecording().then((_) {
      if (mounted) {
        setState(() {});
      }
      print('Video recording resumed');
    });
  }

  //Camera controls
  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      print('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already going on, return
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      capturedFile = File(file.path);

      final directory = Preferences.getSavePath();

      String fileFormat = capturedFile!.path.split('.').last;

      String path = '$directory/IMG_${timestamp()}.$fileFormat';

      if (!isRearCameraSelected && Preferences.getFlipFrontCameraPhoto()) {
        List<int> imageBytes = await capturedFile!.readAsBytes();
        img.Image? originalImage = img.decodeImage(imageBytes);
        img.Image fixedImage = img.flipHorizontal(originalImage!);

        await capturedFile!.writeAsBytes(
          img.encodeJpg(fixedImage),
          flush: true,
        );
      }

      await FlutterImageCompress.compressAndGetFile(capturedFile!.path, path,
          quality: Preferences.getCompressQuality(),
          keepExif: Preferences.getKeepEXIFMetadata());

      //OLD without compression and removal of EXIF data: await capturedFile!.copy(path);

      print('Picture saved to $path');
      await _refreshGalleryImages();

      return file;
    } on CameraException catch (e) {
      print('$e: ${e.description}');
      return null;
    }
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      print('Error: select a camera first.');
      return;
    }

    if (cameraController.value.isRecordingVideo) {
      // A recording already started, return
      return;
    }

    try {
      await cameraController.startVideoRecording();
    } on CameraException catch (e) {
      print('$e: ${e.description}');
      return;
    }
  }

  Future<XFile?> stopVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }

    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      print('$e: ${e.description}');
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.pauseVideoRecording();
    } on CameraException catch (e) {
      print('$e: ${e.description}');
      rethrow;
    }
  }

  Future<void> resumeVideoRecording() async {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return;
    }

    try {
      await cameraController.resumeVideoRecording();
    } on CameraException catch (e) {
      print('$e: ${e.description}');
      rethrow;
    }
  }

  //Zoom
  Widget _zoomSlider({required bool update}) {
    if (mounted && update) {
      setState(() {});
    }

    return RotatedBox(
      quarterTurns: 3,
      child: SliderTheme(
        data: SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Slider(
          value: _currentScale,
          min: _minAvailableZoom,
          max: _maxAvailableZoom,
          label: _currentScale.toStringAsFixed(2),
          onChanged: ((value) async {
            setState(() {
              _currentScale = value;
            });
            await controller!.setZoomLevel(value);
          }),
        ),
      ),
    );
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  void _onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final CameraController cameraController = controller!;

    _circlePosX = details.localPosition.dx;
    _circlePosY = details.localPosition.dy;

    _displayCircle();

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController.setExposurePoint(offset);
    cameraController.setFocusPoint(offset);
  }

  void _displayCircle() async {
    setState(() {
      _circleEnabled = true;
    });
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      _circleEnabled = false;
    });
  }

  Widget _circleWidget() {
    return Positioned(
      top: _circlePosY - 20.0,
      left: _circlePosX - 20.0,
      child: _circleEnabled
          ? TweenAnimationBuilder(
              tween: _scaleTween,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              builder: (context, scale, child) {
                return Transform.scale(scale: scale as double, child: child);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.circle,
                  color: Colors.transparent,
                  size: 42.0,
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

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

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
      print('$e: ${e.description}');
      rethrow;
    }
  }

  //Thumbnail
  Widget _thumbnailWidget() {
    final VideoPlayerController? localVideoController = videoController;

    if (localVideoController == null && capturedFile == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (localVideoController == null) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(
                File(capturedFile!.path),
              ),
            ),
          ),
        );
      } else {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: localVideoController.value.size.width,
                      height: localVideoController.value.size.height,
                      child: VideoPlayer(localVideoController),
                    ),
                  ),
                ),
              ),
            ),
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black45,
              child: Icon(
                Icons.play_arrow,
                size: 20,
                color: Colors.white,
              ),
            )
          ],
        );
      }
    }
  }

  Future<void> _refreshGalleryImages() async {
    List<File> allFileList = [];

    final directory = Directory(Preferences.getSavePath());

    List<FileSystemEntity> fileList = await directory.list().toList();
    List<String> fileNames = [];
    List<DateTime> dateTimes = [];

    String recentFileName = '';

    for (var file in fileList) {
      if (file.path.contains('.jpg') || file.path.contains('.mp4')) {
        allFileList.add(File(file.path));
        String name = file.path.split('/').last; //.split('.').first;
        final stat = FileStat.statSync(file.path);

        dateTimes.add(stat.modified);

        fileNames.add(name);
      }
    }

    if (fileNames.isNotEmpty) {
      for (var name in fileNames) {
        final now = DateTime.now();
        final mostRecentDateTimeToNow = dateTimes.reduce((a, b) =>
            a.difference(now).abs() < b.difference(now).abs() ? a : b);

        final file = File('${directory.path}/$name');

        final stat = FileStat.statSync(file.path);
        if (stat.changed.isAtSameMomentAs(mostRecentDateTimeToNow)) {
          recentFileName = name;
        }
      }

      capturedFile = File('${directory.path}/$recentFileName');

      if (recentFileName.contains('.mp4')) {
        _showVideoPlayer();
      }
    }
  }

  Future<void> _showVideoPlayer() async {
    if (capturedFile == null) {
      return;
    }

    final VideoPlayerController thumbnailVideoController =
        VideoPlayerController.file(File(capturedFile!.path));

    videoPlayerListener = () {
      if (videoController != null) {
        if (mounted) {
          setState(() {});
        }
        videoController!.removeListener(videoPlayerListener!);
      }
    };
    thumbnailVideoController.addListener(videoPlayerListener!);
    await thumbnailVideoController.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        videoController = thumbnailVideoController;
      });
    }
    await thumbnailVideoController.pause();
  }

  //Misc
  String timestamp() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyyMMdd_msS');
    final String formatted = formatter.format(now);
    return formatted;
  }
}
