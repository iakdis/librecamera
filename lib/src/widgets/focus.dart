import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:librecamera/l10n/app_localizations.dart' show AppLocalizations;
import 'package:librecamera/src/provider/theme_provider.dart';

class FocusModeControlWidget extends StatefulWidget {
  const FocusModeControlWidget({required this.controller, super.key});

  final CameraController? controller;

  @override
  State<FocusModeControlWidget> createState() => _FocusModeControlWidgetState();
}

class _FocusModeControlWidgetState extends State<FocusModeControlWidget> {
  List<FocusMode> focusModes = [FocusMode.auto, FocusMode.locked];
  final ValueNotifier<FocusMode?> _selectedFocusModeNotifier = ValueNotifier(
    FocusMode.auto,
  );

  Future<void> onSetFocusModeButtonPressed(FocusMode? mode) async {
    await setFocusMode(mode);
    if (kDebugMode) {
      print('Focus mode set to ${mode.toString().split('.').last}');
    }
  }

  Future<void> setFocusMode(FocusMode? mode) async {
    if (widget.controller == null) {
      return;
    }

    try {
      await widget.controller!.setFocusMode(mode ?? FocusMode.auto);
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('Error: ${e.code}\nError Message: ${e.description}');
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: AppLocalizations.of(context)!.focusMode,
      child: Row(
        children: [
          RotatedBox(
            quarterTurns:
                MediaQuery.orientationOf(context) == Orientation.portrait
                ? 0
                : 1,
            child: const Icon(Icons.filter_center_focus, color: primaryColor),
          ),
          const SizedBox(width: 6),
          DropdownButtonHideUnderline(
            child: ValueListenableBuilder(
              valueListenable: _selectedFocusModeNotifier,
              builder: (context, selectedFocusMode, child) {
                return DropdownButton(
                  menuWidth: 250,
                  iconEnabledColor: primaryColor,
                  value: selectedFocusMode,
                  /*selectedItemBuilder: (context) => [
                    for (final item in focusModes)
                      DropdownMenuItem<FocusMode>(
                        value: item,
                        child: Text(
                          item.name.toUpperCase(),
                          style: const TextStyle(
                              color: primaryColor, fontWeight: FontWeight.w500),
                        ),
                      ),
                  ],*/
                  selectedItemBuilder: (context) => [
                    DropdownMenuItem(
                      value: FocusMode.auto,
                      child: Text(
                        AppLocalizations.of(context)!.autoSmall,
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: FocusMode.locked,
                      child: Text(
                        AppLocalizations.of(context)!.lockedSmall,
                        style: const TextStyle(
                          color: primaryColor,
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
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: FocusMode.locked,
                      child: Text(
                        AppLocalizations.of(context)!.focusModeLocked,
                        style: const TextStyle(
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
                                color: primaryColor, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                      .toList(),*/
                  onChanged: (item) async {
                    _selectedFocusModeNotifier.value = item;
                    if (widget.controller != null) {
                      await onSetFocusModeButtonPressed(item);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
