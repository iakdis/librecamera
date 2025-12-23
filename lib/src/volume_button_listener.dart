import 'dart:async';

import 'package:flutter/services.dart';

/// Implementation of volume button listener
class VolumeButtonListener {
  static const EventChannel _channel = EventChannel(
    'com.iakmds.librecamera/volume_keydown',
  );

  /// Stream of volume button events
  static Stream<VolumeButton> get stream => _channel
      .receiveBroadcastStream()
      .cast<bool>()
      .map((event) => event ? VolumeButton.down : VolumeButton.up);
}

enum VolumeButton { up, down }
