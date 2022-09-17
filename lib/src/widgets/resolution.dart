import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:librecamera/src/utils/preferences.dart';

class ResolutionButton extends StatefulWidget {
  const ResolutionButton({Key? key}) : super(key: key);

  @override
  State<ResolutionButton> createState() => _ResolutionButtonState();
}

class _ResolutionButtonState extends State<ResolutionButton> {
  List<ResolutionPreset> presets = ResolutionPreset.values;

  ResolutionPreset _getResolution() {
    final resolutionString = Preferences.getResolution();
    ResolutionPreset resolution = ResolutionPreset.high;
    for (var res in ResolutionPreset.values) {
      if (res.name == resolutionString) resolution = res;
    }

    return resolution;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(AppLocalizations.of(context)!.selectResolution),
      iconEnabledColor: Colors.blue,
      value: _getResolution(),
      items: const [
        DropdownMenuItem<ResolutionPreset>(
          value: ResolutionPreset.low,
          child: Text(
            'LOW (320x240)',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
        DropdownMenuItem<ResolutionPreset>(
          value: ResolutionPreset.medium,
          child: Text(
            'MEDIUM (720x480)',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
        DropdownMenuItem<ResolutionPreset>(
          value: ResolutionPreset.high,
          child: Text(
            'HD (1280x720)',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
        DropdownMenuItem<ResolutionPreset>(
          value: ResolutionPreset.veryHigh,
          child: Text(
            'FULL HD (1920x1080)',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
        DropdownMenuItem<ResolutionPreset>(
          value: ResolutionPreset.ultraHigh,
          child: Text(
            '4K (3840x2860)',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
      ],
      onChanged: (resolution) {
        setState(() {
          Preferences.setResolution((resolution as ResolutionPreset).name);
        });
      },
    );
  }
}
