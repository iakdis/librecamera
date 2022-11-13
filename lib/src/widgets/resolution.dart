import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

class ResolutionButton extends StatefulWidget {
  const ResolutionButton({
    Key? key,
    this.isDense = false,
    this.onNewCameraSelected,
    this.isRearCameraSelected,
    required this.enabled,
  }) : super(key: key);

  final Function(CameraDescription)? onNewCameraSelected;
  final bool? isRearCameraSelected;
  final bool isDense;
  final bool enabled;

  @override
  State<ResolutionButton> createState() => _ResolutionButtonState();
}

class _ResolutionButtonState extends State<ResolutionButton> {
  List<ResolutionPreset> presets = ResolutionPreset.values;
  List<String> texts = [
    'LOW (320x240)',
    'MEDIUM (720x480)',
    'HD (1280x720)',
    'FULL HD (1920x1080)',
    '4K (3840x2160)',
    'MAX',
  ];
  List<String> textsDense = [
    '320x240',
    '720x480',
    '1280x720',
    '1920x1080',
    '3840x2160',
    'MAX',
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.isDense) {
      for (var i = 0; i < texts.length; i++) {
        texts[i] = textsDense[i];
      }
    }

    return Tooltip(
      message: AppLocalizations.of(context)!.resolution,
      child: DropdownButton(
        icon: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Icon(Icons.aspect_ratio,
                color: widget.enabled
                    ? widget.isDense
                        ? Colors.white
                        : null
                    : Colors.white24)),
        value: getResolution(),
        isDense: widget.isDense ? true : false,
        selectedItemBuilder: widget.isDense
            ? (context) {
                return [
                  Text('LOW',
                      style: TextStyle(
                          color: widget.enabled ? Colors.white : Colors.white24,
                          fontWeight: FontWeight.w500)),
                  Text('MEDIUM',
                      style: TextStyle(
                          color: widget.enabled ? Colors.white : Colors.white24,
                          fontWeight: FontWeight.w500)),
                  Text('HD',
                      style: TextStyle(
                          color: widget.enabled ? Colors.white : Colors.white24,
                          fontWeight: FontWeight.w500)),
                  Text('FULL HD',
                      style: TextStyle(
                          color: widget.enabled ? Colors.white : Colors.white24,
                          fontWeight: FontWeight.w500)),
                  Text('4K',
                      style: TextStyle(
                          color: widget.enabled ? Colors.white : Colors.white24,
                          fontWeight: FontWeight.w500)),
                  Text('MAX',
                      style: TextStyle(
                          color: widget.enabled ? Colors.white : Colors.white24,
                          fontWeight: FontWeight.w500)),
                ];
              }
            : null,
        items: [
          DropdownMenuItem<ResolutionPreset>(
            value: ResolutionPreset.low,
            child: Text(
              texts[0],
              style: TextStyle(
                  color: widget.isDense ? Colors.blue : null,
                  fontWeight: widget.isDense ? FontWeight.w500 : null),
            ),
          ),
          DropdownMenuItem<ResolutionPreset>(
            value: ResolutionPreset.medium,
            child: Text(
              texts[1],
              style: TextStyle(
                  color: widget.isDense ? Colors.blue : null,
                  fontWeight: widget.isDense ? FontWeight.w500 : null),
            ),
          ),
          DropdownMenuItem<ResolutionPreset>(
            value: ResolutionPreset.high,
            child: Text(
              texts[2],
              style: TextStyle(
                  color: widget.isDense ? Colors.blue : null,
                  fontWeight: widget.isDense ? FontWeight.w500 : null),
            ),
          ),
          DropdownMenuItem<ResolutionPreset>(
            value: ResolutionPreset.veryHigh,
            child: Text(
              texts[3],
              style: TextStyle(
                  color: widget.isDense ? Colors.blue : null,
                  fontWeight: widget.isDense ? FontWeight.w500 : null),
            ),
          ),
          DropdownMenuItem<ResolutionPreset>(
            value: ResolutionPreset.ultraHigh,
            child: Text(
              texts[4],
              style: TextStyle(
                  color: widget.isDense ? Colors.blue : null,
                  fontWeight: widget.isDense ? FontWeight.w500 : null),
            ),
          ),
          DropdownMenuItem<ResolutionPreset>(
            value: ResolutionPreset.max,
            child: Text(
              texts[5],
              style: TextStyle(
                  color: widget.isDense ? Colors.blue : null,
                  fontWeight: widget.isDense ? FontWeight.w500 : null),
            ),
          ),
        ],
        onChanged: widget.enabled
            ? widget.isDense
                ? (resolution) {
                    setState(() {
                      Preferences.setResolution(
                          (resolution as ResolutionPreset).name);
                    });
                    widget.onNewCameraSelected!(
                        cameras[widget.isRearCameraSelected! ? 0 : 1]);
                  }
                : (resolution) {
                    setState(() {
                      Preferences.setResolution(
                          (resolution as ResolutionPreset).name);
                    });
                  }
            : null,
      ),
    );
  }
}

ResolutionPreset getResolution() {
  final resolutionString = Preferences.getResolution();
  ResolutionPreset resolution = ResolutionPreset.high;
  for (var res in ResolutionPreset.values) {
    if (res.name == resolutionString) resolution = res;
  }

  return resolution;
}
