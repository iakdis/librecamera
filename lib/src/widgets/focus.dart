import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:librecamera/l10n/app_localizations.dart' show AppLocalizations;

class FocusModeControlWidget extends StatefulWidget {
  const FocusModeControlWidget({super.key, required this.controller});

  final CameraController? controller;

  @override
  State<FocusModeControlWidget> createState() => _FocusModeControlWidgetState();
}

class _FocusModeControlWidgetState extends State<FocusModeControlWidget> {
  List<FocusMode> focusModes = [FocusMode.auto, FocusMode.locked];
  FocusMode? selectedFocusMode = FocusMode.auto;

  void onSetFocusModeButtonPressed(FocusMode mode) {
    setFocusMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      print('Focus mode set to ${mode.toString().split('.').last}');
    });
  }

  Future<void> setFocusMode(FocusMode mode) async {
    if (widget.controller == null) {
      return;
    }

    try {
      await widget.controller!.setFocusMode(mode);
    } on CameraException catch (e) {
      print('Error: ${e.code}\nError Message: ${e.description}');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: AppLocalizations.of(context)!.focusMode,
      child: Row(
        children: [
          const Icon(Icons.filter_center_focus, color: Colors.blue),
          const SizedBox(width: 6.0),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              iconEnabledColor: Colors.blue,
              value: selectedFocusMode,
              /*selectedItemBuilder: (context) => [
                for (final item in focusModes)
                  DropdownMenuItem<FocusMode>(
                    value: item,
                    child: Text(
                      item.name.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  ),
              ],*/
              selectedItemBuilder: (context) => [
                DropdownMenuItem(
                  value: FocusMode.auto,
                  child: Text(
                    AppLocalizations.of(context)!.autoSmall,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: FocusMode.locked,
                  child: Text(
                    AppLocalizations.of(context)!.lockedSmall,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              items: [
                DropdownMenuItem(
                  value: FocusMode.auto,
                  child: Text(
                    AppLocalizations.of(context)!.focusModeAuto,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: FocusMode.locked,
                  child: Text(
                    AppLocalizations.of(context)!.focusModeLocked,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              /*items: focusModes
                  .map(
                    (item) => DropdownMenuItem<FocusMode>(
                      value: item,
                      child: Text(
                        '${item.name.toUpperCase()} FOCUS',
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                  .toList(),*/
              onChanged: (item) => setState(() {
                selectedFocusMode = item as FocusMode;
                if (widget.controller != null) {
                  onSetFocusModeButtonPressed(item);
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
