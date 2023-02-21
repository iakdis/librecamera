import 'package:flutter/material.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimerButton extends StatefulWidget {
  const TimerButton({
    Key? key,
    required this.enabled,
  }) : super(key: key);

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
      child: DropdownButton(
        isDense: true,
        menuMaxHeight: 384.0,
        icon: const Icon(Icons.av_timer),
        iconEnabledColor: Colors.white,
        value: Duration(seconds: Preferences.getTimerDuration()),
        selectedItemBuilder: (context) {
          return durations.map(
            (duration) {
              final name = duration.inSeconds < 60
                  ? '${duration.inSeconds}s'
                  : '${duration.inMinutes}m';

              return DropdownMenuItem(
                child: Text(
                  name,
                  style: TextStyle(
                      color: widget.enabled ? Colors.white : Colors.white24),
                ),
              );
            },
          ).toList()
            ..insert(
              0,
              DropdownMenuItem<Duration>(
                child: Text(
                  '––',
                  style: TextStyle(
                      color: widget.enabled ? Colors.white : Colors.white24),
                ),
              ),
            );
        },
        items: durations.map(
          (duration) {
            final name = duration.inSeconds < 60
                ? '${duration.inSeconds}s'
                : '${duration.inMinutes}m';

            return DropdownMenuItem(
              value: duration,
              onTap: () {
                setState(() {
                  Preferences.setTimerDuration(duration.inSeconds);
                });
              },
              child: Text(
                name,
                style: const TextStyle(color: Colors.blue),
              ),
            );
          },
        ).toList()
          ..insert(
            0,
            DropdownMenuItem<Duration>(
              value: const Duration(),
              onTap: () {
                setState(() {
                  Preferences.setTimerDuration(0);
                });
              },
              child: Text(
                AppLocalizations.of(context)!.off,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ),
        onChanged: widget.enabled ? (_) {} : null,
        iconDisabledColor: Colors.white24,
      ),
    );
  }
}
