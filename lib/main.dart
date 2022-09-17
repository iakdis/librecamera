import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:librecamera/src/app.dart';
import 'package:librecamera/src/utils/preferences.dart';

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

  SystemChrome.setPreferredOrientations(_getDeviceOrientations()).then((_) {
    runApp(CameraApp(onboardingCompleted: Preferences.getOnBoardingComplete()));
  });

  //Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemStatusBarContrastEnforced: true,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    //systemNavigationBarIconBrightness: Brightness.light,
    //statusBarIconBrightness: Brightness.light
  ));

  //Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
