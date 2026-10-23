# LibreCamera changes to camera_android_camerax

This folder is a copy of `camera_android_camerax` 0.6.26+2
(https://github.com/flutter/packages/tree/main/packages/camera/camera_android_camerax),
used through `dependency_overrides` in the app's `pubspec.yaml`.

## What was changed

- **New:** `android/src/main/java/io/flutter/plugins/camerax/PostProcessingConfig.java`
  A global "no post-processing" switch with a MethodChannel
  (`com.iakmds.librecamera/post_processing`, method `setDisabled`). When on, the camera is
  built with Camera2 request options that turn noise reduction, edge sharpening, hot pixel
  correction and chromatic aberration correction off. A step is only turned off when every
  camera on the device lists "off" as an available mode.
- `CameraAndroidCameraxPlugin.java`: registers and unregisters that channel.
- `PreviewProxyApi.java`, `ImageCaptureProxyApi.java`, `VideoCaptureProxyApi.java`: apply the
  options while building the use cases. `ImageCapture` also asks for JPEG quality 100.

The switch is read when the use cases are built, so the app re-initializes the camera after
changing it.

Everything else (including the `test` and `example` folders, which were left out) is unchanged
from upstream. When updating the `camera` dependency, bump this copy to the matching upstream
version and re-apply the changes above.
