import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:librecamera/src/utils/preferences.dart';

/// Talks to the patched camera plugin (`packages/camera_android_camerax`) to
/// turn the phone's own sensor/ISP post-processing (noise reduction, edge
/// sharpening, hot pixel and aberration correction) off or on.
class PostProcessing {
  static const MethodChannel _channel = MethodChannel(
    'com.iakmds.librecamera/post_processing',
  );

  /// Pushes the saved "no post-processing" preference to the native camera
  /// plugin.
  ///
  /// The native side applies it when the camera use cases are built, so this
  /// has to run before the camera controller is (re)initialized.
  static Future<void> syncWithPreference() async {
    try {
      await _channel.invokeMethod<void>('setDisabled', <String, Object>{
        'disabled': Preferences.getNoPostProcessing(),
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Could not set post-processing: $e');
      }
    } on MissingPluginException {
      // Not running with the patched Android camera plugin; nothing to do.
    }
  }
}
