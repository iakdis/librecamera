// LibreCamera modification: not part of the upstream camera_android_camerax plugin.
//
// Holds a global "disable camera post-processing" switch. When it is on, the CameraX use cases
// (Preview, ImageCapture, VideoCapture) are built with Camera2 capture request options that turn
// off the sensor/ISP processing steps (noise reduction, edge sharpening, hot pixel correction and
// chromatic aberration correction). Only modes that every camera on the device reports as
// available are applied, so devices that cannot turn a step off are left untouched.
//
// The switch is flipped from Dart over a MethodChannel. It takes effect for use cases that are
// built afterwards, so the Dart side re-initializes the camera after toggling it.

package io.flutter.plugins.camerax;

import android.content.Context;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CameraMetadata;
import android.hardware.camera2.CaptureRequest;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.OptIn;
import androidx.camera.camera2.interop.Camera2Interop;
import androidx.camera.camera2.interop.ExperimentalCamera2Interop;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

/** Global switch for turning off sensor/ISP post-processing on the CameraX use cases. */
public final class PostProcessingConfig {
  static final String CHANNEL_NAME = "com.iakmds.librecamera/post_processing";

  private static volatile boolean disabled = false;
  @Nullable private static volatile Context appContext;
  @Nullable private static volatile Support cachedSupport;
  @Nullable private static MethodChannel channel;

  private PostProcessingConfig() {}

  /** Which post-processing steps can be turned off on this device. */
  private static final class Support {
    final boolean noiseReduction;
    final boolean edge;
    final boolean hotPixel;
    final boolean aberration;

    Support(boolean noiseReduction, boolean edge, boolean hotPixel, boolean aberration) {
      this.noiseReduction = noiseReduction;
      this.edge = edge;
      this.hotPixel = hotPixel;
      this.aberration = aberration;
    }

    boolean any() {
      return noiseReduction || edge || hotPixel || aberration;
    }
  }

  /** Registers the MethodChannel that Dart uses to flip the switch. */
  static void register(@NonNull Context context, @NonNull BinaryMessenger messenger) {
    appContext = context.getApplicationContext();
    channel = new MethodChannel(messenger, CHANNEL_NAME);
    channel.setMethodCallHandler(
        (call, result) -> {
          switch (call.method) {
            case "setDisabled":
              final Boolean value = call.argument("disabled");
              if (value == null) {
                result.error("invalid_argument", "Missing boolean argument 'disabled'.", null);
                return;
              }
              disabled = value;
              result.success(null);
              break;
            case "isDisabled":
              result.success(disabled);
              break;
            case "isSupported":
              result.success(getSupport().any());
              break;
            default:
              result.notImplemented();
          }
        });
  }

  static void unregister() {
    if (channel != null) {
      channel.setMethodCallHandler(null);
      channel = null;
    }
    appContext = null;
    cachedSupport = null;
  }

  static boolean isDisabled() {
    return disabled;
  }

  /**
   * Adds the "post-processing off" capture request options to {@code extender} when the switch is
   * on. Does nothing when it is off.
   */
  @OptIn(markerClass = ExperimentalCamera2Interop.class)
  static <T> void applyTo(@NonNull Camera2Interop.Extender<T> extender) {
    if (!disabled) {
      return;
    }
    final Support support = getSupport();
    if (support.noiseReduction) {
      extender.setCaptureRequestOption(
          CaptureRequest.NOISE_REDUCTION_MODE, CameraMetadata.NOISE_REDUCTION_MODE_OFF);
    }
    if (support.edge) {
      extender.setCaptureRequestOption(CaptureRequest.EDGE_MODE, CameraMetadata.EDGE_MODE_OFF);
    }
    if (support.hotPixel) {
      extender.setCaptureRequestOption(
          CaptureRequest.HOT_PIXEL_MODE, CameraMetadata.HOT_PIXEL_MODE_OFF);
    }
    if (support.aberration) {
      extender.setCaptureRequestOption(
          CaptureRequest.COLOR_CORRECTION_ABERRATION_MODE,
          CameraMetadata.COLOR_CORRECTION_ABERRATION_MODE_OFF);
    }
  }

  @NonNull
  private static Support getSupport() {
    final Support cached = cachedSupport;
    if (cached != null) {
      return cached;
    }
    final Support computed = computeSupport();
    cachedSupport = computed;
    return computed;
  }

  /**
   * A step counts as supported only when every camera on the device lists "off" among its
   * available modes, because the use cases are built before the camera is chosen.
   */
  @NonNull
  private static Support computeSupport() {
    final Context context = appContext;
    if (context == null) {
      return new Support(false, false, false, false);
    }

    boolean noiseReduction = true;
    boolean edge = true;
    boolean hotPixel = true;
    boolean aberration = true;
    boolean sawCamera = false;

    try {
      final CameraManager manager = (CameraManager) context.getSystemService(Context.CAMERA_SERVICE);
      if (manager == null) {
        return new Support(false, false, false, false);
      }
      for (final String id : manager.getCameraIdList()) {
        final CameraCharacteristics characteristics = manager.getCameraCharacteristics(id);
        sawCamera = true;
        noiseReduction &=
            containsMode(
                characteristics.get(
                    CameraCharacteristics.NOISE_REDUCTION_AVAILABLE_NOISE_REDUCTION_MODES),
                CameraMetadata.NOISE_REDUCTION_MODE_OFF);
        edge &=
            containsMode(
                characteristics.get(CameraCharacteristics.EDGE_AVAILABLE_EDGE_MODES),
                CameraMetadata.EDGE_MODE_OFF);
        hotPixel &=
            containsMode(
                characteristics.get(CameraCharacteristics.HOT_PIXEL_AVAILABLE_HOT_PIXEL_MODES),
                CameraMetadata.HOT_PIXEL_MODE_OFF);
        aberration &=
            containsMode(
                characteristics.get(
                    CameraCharacteristics.COLOR_CORRECTION_AVAILABLE_ABERRATION_MODES),
                CameraMetadata.COLOR_CORRECTION_ABERRATION_MODE_OFF);
      }
    } catch (CameraAccessException | RuntimeException e) {
      return new Support(false, false, false, false);
    }

    if (!sawCamera) {
      return new Support(false, false, false, false);
    }
    return new Support(noiseReduction, edge, hotPixel, aberration);
  }

  private static boolean containsMode(@Nullable int[] modes, int wanted) {
    if (modes == null) {
      return false;
    }
    for (final int mode : modes) {
      if (mode == wanted) {
        return true;
      }
    }
    return false;
  }
}
