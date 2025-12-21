import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:librecamera/l10n/app_localizations.dart';

class ExposureModeControlWidget extends StatefulWidget {
  const ExposureModeControlWidget({required this.controller, super.key});

  final CameraController? controller;

  @override
  State<ExposureModeControlWidget> createState() =>
      _ExposureModeControlWidgetState();
}

class _ExposureModeControlWidgetState extends State<ExposureModeControlWidget> {
  List<ExposureMode> exposureModes = [ExposureMode.auto, ExposureMode.locked];
  ExposureMode? selectedExposureMode = ExposureMode.auto;

  Future<void> onSetExposureModeButtonPressed(ExposureMode? mode) async {
    await setExposureMode(mode);
    if (mounted) {
      setState(() {});
    }
    if (kDebugMode) {
      print('Exposure mode set to ${mode.toString().split('.').last}');
    }
  }

  Future<void> setExposureMode(ExposureMode? mode) async {
    if (widget.controller == null) {
      return;
    }

    try {
      await widget.controller!.setExposureMode(mode ?? ExposureMode.auto);
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('Error: ${e.code}\nError Message: ${e.description}');
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tooltip(
          message: AppLocalizations.of(context)!.exposureMode,
          child: Row(
            children: [
              const Icon(Icons.exposure, color: Colors.blue),
              const SizedBox(width: 6),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconEnabledColor: Colors.blue,
                  value: selectedExposureMode,
                  selectedItemBuilder: (context) => [
                    DropdownMenuItem(
                      value: ExposureMode.auto,
                      child: Text(
                        AppLocalizations.of(context)!.autoSmall,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: ExposureMode.locked,
                      child: Text(
                        AppLocalizations.of(context)!.lockedSmall,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  /*selectedItemBuilder: (context) => [
                    for (final item in exposureModes)
                      DropdownMenuItem<ExposureMode>(
                        value: item,
                        child: Text(
                          item.name.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w500),
                        ),
                      ),
                  ],*/
                  /*items: exposureModes
                      .map(
                        (item) => DropdownMenuItem<ExposureMode>(
                          value: item,
                          child: Text(
                            "${item.name.toUpperCase()} EXPOSURE",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                      .toList(),*/
                  items: [
                    DropdownMenuItem(
                      value: ExposureMode.auto,
                      child: Text(
                        AppLocalizations.of(context)!.exposureModeAuto,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: ExposureMode.locked,
                      child: Text(
                        AppLocalizations.of(context)!.exposureModeLocked,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (item) => setState(() {
                    selectedExposureMode = item;
                    if (widget.controller != null) {
                      onSetExposureModeButtonPressed(item);
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(widget.minAvailableExposureOffset.toString()),
            Slider(
              value: widget.currentExposureOffset,
              min: widget.minAvailableExposureOffset,
              max: widget.maxAvailableExposureOffset,
              label: widget.currentExposureOffset.toString(),
              onChanged: widget.minAvailableExposureOffset ==
                      widget.maxAvailableExposureOffset
                  ? null
                  : widget.setExposureOffset,
            ),
            Text(widget.maxAvailableExposureOffset.toString()),
          ],
        ),*/
      ],
    );
  }
}

class ExposureSlider extends StatefulWidget {
  const ExposureSlider({
    required this.minAvailableExposureOffset,
    required this.maxAvailableExposureOffset,
    required this.currentExposureOffset,
    required this.setExposureOffset,
    super.key,
  });

  final double minAvailableExposureOffset;
  final double maxAvailableExposureOffset;
  final double currentExposureOffset;
  final void Function(double) setExposureOffset;

  @override
  State<ExposureSlider> createState() => _ExposureSliderState();
}

class _ExposureSliderState extends State<ExposureSlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Tooltip(
          message: AppLocalizations.of(context)!.defaultExposure,
          child: TextButton(
            onPressed: () {
              widget.setExposureOffset(0);
            },
            child: Row(
              children: [
                const Icon(Icons.restore),
                const SizedBox(width: 8),
                Text(AppLocalizations.of(context)!.reset),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.minAvailableExposureOffset.toString(),
              style: const TextStyle(color: Colors.blue),
            ),
            SliderTheme(
              data: SliderThemeData(
                showValueIndicator: ShowValueIndicator.onDrag,
                overlayShape: SliderComponentShape.noOverlay,
              ),
              child: Slider(
                value: widget.currentExposureOffset,
                min: widget.minAvailableExposureOffset,
                max: widget.maxAvailableExposureOffset,
                label: widget.currentExposureOffset.toStringAsFixed(2),
                onChanged:
                    widget.minAvailableExposureOffset ==
                        widget.maxAvailableExposureOffset
                    ? null
                    : widget.setExposureOffset,
              ),
            ),
            Text(
              widget.maxAvailableExposureOffset.toString(),
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}
