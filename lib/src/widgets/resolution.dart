import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:librecamera/l10n/app_localizations.dart';
import 'package:librecamera/main.dart';
import 'package:librecamera/src/utils/preferences.dart';

class ResolutionButton extends StatefulWidget {
  const ResolutionButton({
    required this.enabled,
    super.key,
    this.isDense = false,
    this.onNewCameraSelected,
    this.isRearCameraSelected,
  });

  final void Function(CameraDescription)? onNewCameraSelected;
  final bool? isRearCameraSelected;
  final bool isDense;
  final bool enabled;

  @override
  State<ResolutionButton> createState() => _ResolutionButtonState();
}

class _ResolutionButtonState extends State<ResolutionButton> {
  ({String long, String middle, String short}) _textForPreset(
    ResolutionPreset resolutionPreset,
  ) => switch (resolutionPreset) {
    .low => (
      long: 'LOW (~240p)',
      middle: 'LOW',
      short: '~240p',
    ),
    .medium => (
      long: 'MEDIUM (~480p)',
      middle: 'MEDIUM',
      short: '~480p',
    ),
    .high => (
      long: 'HIGH (~720p)',
      middle: 'HIGH',
      short: '~720p',
    ),
    .veryHigh => (
      long: 'VERY HIGH (~1080p)',
      middle: 'VERY HIGH',
      short: '~1080p',
    ),
    .ultraHigh => (
      long: 'ULTRA HIGH (~2160p)',
      middle: 'ULTRA HIGH',
      short: '~2160p',
    ),
    .max => (long: 'MAX', middle: 'MAX', short: 'MAX'),
  };

  Widget _itemText(ResolutionPreset resolutionPreset) {
    return Text(
      widget.isDense
          ? _textForPreset(resolutionPreset).short
          : _textForPreset(resolutionPreset).long,
      style: TextStyle(
        color: widget.isDense ? null : null,
        fontWeight: widget.isDense ? .w500 : null,
      ),
    );
  }

  Widget _dropdownText(ResolutionPreset resolutionPreset) {
    return Text(
      _textForPreset(resolutionPreset).middle,
      style: TextStyle(
        color: widget.enabled ? Colors.white : Colors.white24,
        fontWeight: .w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: AppLocalizations.of(context)!.resolution,
      child: DropdownButton(
        icon: Padding(
          padding: const .only(left: 4),
          child: Icon(
            Icons.aspect_ratio,
            color: widget.enabled
                ? widget.isDense
                      ? Colors.white
                      : null
                : Colors.white24,
          ),
        ),
        value: getResolution(),
        isDense: widget.isDense,
        selectedItemBuilder: widget.isDense
            ? (context) {
                return [
                  ...ResolutionPreset.values.map(
                    _dropdownText,
                  ),
                ];
              }
            : null,
        items: [
          ...ResolutionPreset.values.map(
            (resolutionPreset) => DropdownMenuItem<ResolutionPreset>(
              value: resolutionPreset,
              child: _itemText(resolutionPreset),
            ),
          ),
        ],
        onChanged: widget.enabled
            ? widget.isDense
                  ? (resolution) async {
                      await Preferences.setResolution(
                        (resolution! as ResolutionPreset).name,
                      );
                      setState(() {});
                      widget.onNewCameraSelected!(
                        cameras[widget.isRearCameraSelected! ? 0 : 1],
                      );
                    }
                  : (resolution) async {
                      await Preferences.setResolution(
                        (resolution! as ResolutionPreset).name,
                      );
                      setState(() {});
                    }
            : null,
      ),
    );
  }
}

ResolutionPreset getResolution() {
  final resolutionString = Preferences.getResolution();
  var resolution = ResolutionPreset.high;
  for (final res in ResolutionPreset.values) {
    if (res.name == resolutionString) resolution = res;
  }

  return resolution;
}
