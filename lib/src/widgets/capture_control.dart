import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:librecamera/main.dart';

class CaptureControlWidget extends StatefulWidget {
  const CaptureControlWidget({
    Key? key,
    required this.controller,
    required this.onTakePictureButtonPressed,
    required this.onVideoRecordButtonPressed,
    required this.onResumeButtonPressed,
    required this.onPauseButtonPressed,
    required this.onStopButtonPressed,
    required this.onNewCameraSelected,
    required this.isVideoCameraSelected,
    required this.isRecordingInProgress,
    required this.flashWidget,
    required this.isRearCameraSelected,
    required this.setIsRearCameraSelected,
  }) : super(key: key);

  final CameraController? controller;
  final VoidCallback onTakePictureButtonPressed;
  final VoidCallback onVideoRecordButtonPressed;
  final VoidCallback onResumeButtonPressed;
  final VoidCallback onPauseButtonPressed;
  final VoidCallback onStopButtonPressed;
  final Function(CameraDescription) onNewCameraSelected;
  final bool isVideoCameraSelected;
  final bool isRecordingInProgress;
  final Widget flashWidget;
  final bool isRearCameraSelected;
  final Function() setIsRearCameraSelected;

  @override
  State<CaptureControlWidget> createState() => _CaptureControlWidgetState();
}

class _CaptureControlWidgetState extends State<CaptureControlWidget> {
  @override
  Widget build(BuildContext context) {
    final CameraController? cameraController = widget.controller;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RotatedBox(
          quarterTurns:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 0
                  : 1,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: widget.isRecordingInProgress
                ? () {
                    if (cameraController!.value.isRecordingPaused) {
                      widget.onResumeButtonPressed();
                    } else {
                      widget.onPauseButtonPressed();
                    }
                  }
                : () {
                    widget.onNewCameraSelected(
                        cameras[widget.isRearCameraSelected ? 1 : 0]);
                    widget.setIsRearCameraSelected();
                  },
            icon: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.black38,
                  size: 60,
                ),
                widget.isRecordingInProgress
                    ? cameraController!.value.isRecordingPaused
                        ? const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          )
                        : const Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 30,
                          )
                    : Icon(
                        widget.isRearCameraSelected
                            ? Icons.camera_front
                            : Icons.camera_rear,
                        color: Colors.white,
                        size: 30,
                      ),
              ],
            ),
            tooltip: widget.isRecordingInProgress
                ? cameraController!.value.isRecordingPaused
                    ? AppLocalizations.of(context)!.resumeVideo
                    : AppLocalizations.of(context)!.pauseVideo
                : widget.isRearCameraSelected
                    ? AppLocalizations.of(context)!.flipToFrontCamera
                    : AppLocalizations.of(context)!.flipToRearCamera,
            iconSize: 60,
          ),
        ),
        /*CameraTogglesWidget(
          controller: widget.controller,
          onNewCameraSelected: widget.onNewCameraSelected,
        ),*/
        RotatedBox(
          quarterTurns:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 0
                  : 1,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: widget.isVideoCameraSelected
                ? () {
                    if (widget.isRecordingInProgress) {
                      widget.onStopButtonPressed();
                    } else {
                      widget.onVideoRecordButtonPressed();
                    }
                  }
                : () {
                    widget.onTakePictureButtonPressed();
                  },
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: widget.isVideoCameraSelected
                      ? Colors.white
                      : Colors.white38,
                  //size: 80,
                  size: 80,
                ),
                Icon(
                  Icons.circle,
                  color:
                      widget.isVideoCameraSelected ? Colors.red : Colors.white,
                  //size: 65,
                  size: 65,
                ),
                widget.isVideoCameraSelected && widget.isRecordingInProgress
                    ? const Icon(
                        Icons.stop_rounded,
                        color: Colors.white,
                        size: 32,
                      )
                    : const Icon(
                        Icons.videocam,
                        color: Colors.white,
                        size: 32,
                      ),
                !widget.isVideoCameraSelected
                    ? Icon(
                        Icons.camera_alt,
                        color: Colors.grey.shade800,
                        size: 32,
                      )
                    : Container(),
              ],
            ),
            tooltip: widget.isVideoCameraSelected
                ? widget.isVideoCameraSelected && widget.isRecordingInProgress
                    ? AppLocalizations.of(context)!.stopVideo
                    : AppLocalizations.of(context)!.startRecordingVideo
                : AppLocalizations.of(context)!.takePicture,
            iconSize: 80,
          ),
        ),
        widget.flashWidget,
      ],
    );
  }
}
