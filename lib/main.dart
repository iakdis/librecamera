import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:librecamera/src/app.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

List<CameraDescription> cameras = <CameraDescription>[];

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  try {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();
    // Obtain a list of the available cameras on the device.
    cameras = await availableCameras();
  } on CameraException catch (e) {
    if (kDebugMode) {
      print('Error: ${e.code}\nError Message: ${e.description}');
    }
  }

  await Preferences.init();

  if (Preferences.getMaximumScreenBrightness()) {
    await ScreenBrightness().setApplicationScreenBrightness(1);
  }

  await WakelockPlus.enable();

  await SystemChrome.setPreferredOrientations(_getDeviceOrientations());

  runApp(CameraApp(onboardingCompleted: Preferences.getOnBoardingComplete()));
}

List<DeviceOrientation> _getDeviceOrientations() {
  if (Preferences.getIsCaptureOrientationLocked()) {
    return [DeviceOrientation.portraitUp];
  } else {
    return [
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ];
  }
}
