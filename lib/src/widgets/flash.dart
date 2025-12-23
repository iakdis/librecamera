import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:librecamera/l10n/app_localizations.dart' show AppLocalizations;
import 'package:librecamera/src/utils/preferences.dart';

class FlashModeWidget extends StatefulWidget {
  const FlashModeWidget({
    required this.controller,
    required this.isRearCameraSelected,
    required this.isVideoCameraSelected,
    super.key,
  });

  final CameraController? controller;
  final bool isRearCameraSelected;
  final bool isVideoCameraSelected;

  @override
  State<FlashModeWidget> createState() => _FlashModeWidgetState();
}

class _FlashModeWidgetState extends State<FlashModeWidget> {
  Future<void> _toggleFlashMode() async {
    if (widget.controller != null) {
      if (widget.controller?.value.flashMode == FlashMode.off) {
        await _onSetFlashModeButtonPressed(
          widget.isVideoCameraSelected ? FlashMode.torch : FlashMode.always,
        );
      } else if (widget.controller?.value.flashMode == FlashMode.always) {
        await _onSetFlashModeButtonPressed(
          widget.isVideoCameraSelected ? FlashMode.off : FlashMode.auto,
        );
      } else if (widget.controller?.value.flashMode == FlashMode.auto) {
        await _onSetFlashModeButtonPressed(
          widget.isVideoCameraSelected ? FlashMode.off : FlashMode.torch,
        );
      } else if (widget.controller?.value.flashMode == FlashMode.torch) {
        await _onSetFlashModeButtonPressed(FlashMode.off);
      }
    }
  }

  Future<void> _onSetFlashModeButtonPressed(FlashMode mode) async {
    await _setFlashMode(mode);
    if (kDebugMode) {
      print('Flash mode set to ${mode.toString().split('.').last}');
    }
  }

  Future<void> _setFlashMode(FlashMode mode) async {
    if (widget.controller == null) {
      return;
    }

    try {
      await widget.controller!.setFlashMode(mode);
      await Preferences.setFlashMode(mode.name);
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('Error: ${e.code}\nError Message: ${e.description}');
      }
      rethrow;
    }
  }

  @override
  void didUpdateWidget(FlashModeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Ensure flash mode is compatible when switching to video
    if (widget.isVideoCameraSelected && !oldWidget.isVideoCameraSelected) {
      if (widget.controller?.value.flashMode
          case FlashMode.always || FlashMode.auto) {
        unawaited(_onSetFlashModeButtonPressed(FlashMode.off));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      duration: const Duration(milliseconds: 400),
      turns: MediaQuery.orientationOf(context) == .portrait ? 0 : 0.25,
      child: IconButton(
        padding: .zero,
        onPressed: widget.isRearCameraSelected ? _toggleFlashMode : null,
        disabledColor: Colors.white24,
        color: Colors.white,
        iconSize: 60,
        icon: Stack(
          alignment: .center,
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
                    : .off,
              ),
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
    case .always:
      return Icons.flash_on;
    case .off:
      return Icons.flash_off;
    case .auto:
      return Icons.flash_auto;
    case .torch:
      return Icons.highlight;
  }
}

FlashMode getFlashMode() {
  final flashModeString = Preferences.getFlashMode();
  var flashMode = FlashMode.off;
  for (final mode in FlashMode.values) {
    if (mode.name == flashModeString) flashMode = mode;
  }
  return flashMode;
}
