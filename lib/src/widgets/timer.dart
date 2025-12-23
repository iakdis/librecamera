import 'package:flutter/material.dart';
import 'package:librecamera/l10n/app_localizations.dart';
import 'package:librecamera/src/utils/preferences.dart';

class TimerButton extends StatefulWidget {
  const TimerButton({required this.enabled, super.key});

  final bool enabled;

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  List<Duration> durations = [
    const Duration(seconds: 1),
    const Duration(seconds: 2),
    const Duration(seconds: 3),
    const Duration(seconds: 5),
    const Duration(seconds: 10),
    const Duration(seconds: 15),
    const Duration(seconds: 30),
    const Duration(minutes: 1),
    const Duration(minutes: 2),
    const Duration(minutes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: AppLocalizations.of(context)!.timer,
      child: DropdownButton<Duration>(
        isDense: true,
        menuMaxHeight: 384,
        icon: RotatedBox(
          quarterTurns:
              MediaQuery.orientationOf(context) == Orientation.portrait ? 0 : 1,
          child: const Icon(Icons.av_timer),
        ),
        iconEnabledColor: Colors.white,
        value: Duration(seconds: Preferences.getTimerDuration()),
        selectedItemBuilder: (context) {
          return durations.map((duration) {
            final name = duration.inSeconds < 60
                ? '${duration.inSeconds}s'
                : '${duration.inMinutes}m';

            return DropdownMenuItem<Duration>(
              child: Text(
                name,
                style: TextStyle(
                  color: widget.enabled ? Colors.white : Colors.white24,
                ),
              ),
            );
          }).toList()..insert(
            0,
            DropdownMenuItem<Duration>(
              child: Text(
                '––',
                style: TextStyle(
                  color: widget.enabled ? Colors.white : Colors.white24,
                ),
              ),
            ),
          );
        },
        items:
            durations.map((duration) {
              final name = duration.inSeconds < 60
                  ? '${duration.inSeconds}s'
                  : '${duration.inMinutes}m';

              return DropdownMenuItem(
                value: duration,
                onTap: () async {
                  await Preferences.setTimerDuration(duration.inSeconds);
                  setState(() {});
                },
                child: Text(name),
              );
            }).toList()..insert(
              0,
              DropdownMenuItem<Duration>(
                value: Duration.zero,
                onTap: () async {
                  await Preferences.setTimerDuration(0);
                  setState(() {});
                },
                child: Text(
                  AppLocalizations.of(context)!.off,
                ),
              ),
            ),
        onChanged: widget.enabled ? (_) {} : null,
        iconDisabledColor: Colors.white24,
      ),
    );
  }
}
