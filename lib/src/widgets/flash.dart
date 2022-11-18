import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlashModeWidget extends StatefulWidget {
  const FlashModeWidget({
    Key? key,
    required this.controller,
    required this.isRearCameraSelected,
    required this.isVideoCameraSelected,
  }) : super(key: key);

  final CameraController? controller;
  final bool isRearCameraSelected;
  final bool isVideoCameraSelected;

  @override
  State<FlashModeWidget> createState() => _FlashModeWidgetState();
}

class _FlashModeWidgetState extends State<FlashModeWidget> {
  void _toggleFlashMode() {
    if (widget.controller != null) {
      if (widget.controller?.value.flashMode == FlashMode.off) {
        _onSetFlashModeButtonPressed(
            widget.isVideoCameraSelected ? FlashMode.torch : FlashMode.always);
      } else if (widget.controller?.value.flashMode == FlashMode.always) {
        _onSetFlashModeButtonPressed(
            widget.isVideoCameraSelected ? FlashMode.off : FlashMode.auto);
      } else if (widget.controller?.value.flashMode == FlashMode.auto) {
        _onSetFlashModeButtonPressed(
            widget.isVideoCameraSelected ? FlashMode.off : FlashMode.torch);
      } else if (widget.controller?.value.flashMode == FlashMode.torch) {
        _onSetFlashModeButtonPressed(FlashMode.off);
      }
    } else {
      null;
    }
  }

  void _onSetFlashModeButtonPressed(FlashMode mode) {
    _setFlashMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      print('Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  Future<void> _setFlashMode(FlashMode mode) async {
    if (widget.controller == null) {
      return;
    }

    try {
      await widget.controller!.setFlashMode(mode);
      Preferences.setFlashMode(mode.name);
    } on CameraException catch (e) {
      print('Error: ${e.code}\nError Message: ${e.description}');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isVideoCameraSelected) {
      if (widget.controller?.value.flashMode == FlashMode.always) {
        _onSetFlashModeButtonPressed(FlashMode.off);
      } else if (widget.controller?.value.flashMode == FlashMode.auto) {
        _onSetFlashModeButtonPressed(FlashMode.off);
      }
    }

    return AnimatedRotation(
      duration: const Duration(milliseconds: 400),
      turns:
          MediaQuery.of(context).orientation == Orientation.portrait ? 0 : 0.25,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: widget.isRearCameraSelected
            ? (() {
                _toggleFlashMode();
              })
            : null,
        disabledColor: Colors.white24,
        color: Colors.white,
        iconSize: 60,
        icon: Stack(
          alignment: Alignment.center,
          children: [
            /*const Icon(
                    Icons.circle,
                    color: Colors.black38,
                    size: 60,
                  ),*/
            Icon(
              _getFlashlightIcon(
                  flashMode: widget.controller != null
                      ? widget.controller!.value.isInitialized
                          ? widget.controller!.value.flashMode
                          : getFlashMode()
                      : FlashMode.off),
              size: 30,
            ),
          ],
        ),
        tooltip: AppLocalizations.of(context)!.flashlight,
      ),
    );
  }
}

IconData _getFlashlightIcon({required FlashMode flashMode}) {
  switch (flashMode) {
    case FlashMode.always:
      return Icons.flash_on;
    case FlashMode.off:
      return Icons.flash_off;
    case FlashMode.auto:
      return Icons.flash_auto;
    case FlashMode.torch:
      return Icons.highlight;
    default:
      return Icons.flashlight_on;
  }
}

FlashMode getFlashMode() {
  final flashModeString = Preferences.getFlashMode();
  FlashMode flashMode = FlashMode.off;
  for (var mode in FlashMode.values) {
    if (mode.name == flashModeString) flashMode = mode;
  }
  return flashMode;
}
