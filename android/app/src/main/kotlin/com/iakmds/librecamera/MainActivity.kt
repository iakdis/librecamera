package com.iakmds.librecamera

import android.app.PendingIntent
import android.content.ComponentName
import android.content.Intent
import android.content.pm.PackageManager
import android.media.MediaActionSound
import android.media.MediaScannerConnection
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.service.quicksettings.TileService
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.core.content.FileProvider
import androidx.core.view.ViewCompat
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsCompat
import androidx.core.view.WindowInsetsControllerCompat
import android.view.KeyEvent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Hide only the status bar, keep navigation bar visible
        val windowInsetsController = WindowCompat.getInsetsController(window, window.decorView)
        windowInsetsController.systemBarsBehavior =
            WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
        windowInsetsController.hide(WindowInsetsCompat.Type.statusBars())
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // Register volume button plugin
        flutterEngine.plugins.add(VolumeButtonPlugin())
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "media_store")
                .setMethodCallHandler { call, result ->
                    when (call.method) {
                        "updateItem" -> {
                            updateItem(call.argument("path")!!)
                            result.success(null)
                        }
                        "openItem" -> {
                            openItem(
                                    call.argument("path")!!,
                                    call.argument("mimeType")!!,
                                    call.argument("openInGallery")!!
                            )
                            result.success(null)
                        }
                        "disableIntentCamera" -> {
                            disableIntentCamera(call.argument("disable")!!)
                            result.success(null)
                        }
                        "shutterSound" -> {
                            shutterSound()
                            result.success(null)
                        }
                        "startVideoSound" -> {
                            startVideoSound()
                            result.success(null)
                        }
                    }
                }
    }

    private fun updateItem(path: String) {
        val file = File(path)
        MediaScannerConnection.scanFile(context, arrayOf(file.toString()), null, null)
    }

    private fun openItem(path: String, mimeType: String, openInGallery: Boolean) {
        val file = File(path)
        var uri = FileProvider.getUriForFile(context, "com.iakmds.librecamera.provider", file)
        if (openInGallery) {
            uri = Uri.parse("content:/$path")
        }

        // https://stackoverflow.com/questions/36597247/android-open-image-in-gallery-with-slide-through-images
        // https://stackoverflow.com/questions/34838866/how-to-scroll-among-images-viewed-via-intent-in-android
        context.grantUriPermission(
                "com.iakmds.librecamera",
                uri,
                Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        )

        /*try
		{
			val intent = Intent("com.android.camera.action.REVIEW", uri);
			intent.setFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
			startActivity(intent);
		} catch (ActivityNotFoundException ex)
		{
			try
			{
				val intent = Intent(Intent.ACTION_VIEW, uri);
				intent.setFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
				startActivity(intent);
			} catch (ActivityNotFoundException e)
			{
				
			}
		}*/

        Intent().apply {
            action = Intent.ACTION_VIEW
            setDataAndType(uri, mimeType)

            addFlags(
                    Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
            )

            startActivity(this)
        }
    }

    private fun disableIntentCamera(disable: Boolean) {
        if (disable) {
            val pm = getApplicationContext().getPackageManager()
            val compName = ComponentName(getPackageName(), "com.iakmds.librecamera.MainActivity")
            pm.setComponentEnabledSetting(
                    compName,
                    PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                    PackageManager.DONT_KILL_APP
            )
        } else {
            val pm = getApplicationContext().getPackageManager()
            val compName = ComponentName(getPackageName(), "com.iakmds.librecamera.MainActivity")
            pm.setComponentEnabledSetting(
                    compName,
                    PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                    PackageManager.DONT_KILL_APP
            )
        }
    }

    private fun shutterSound() {
        val sound = MediaActionSound()
        sound.play(MediaActionSound.SHUTTER_CLICK)
    }

    private fun startVideoSound() {
        val sound = MediaActionSound()
        sound.play(MediaActionSound.START_VIDEO_RECORDING)
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent): Boolean {
        return when (keyCode) {
            KeyEvent.KEYCODE_VOLUME_DOWN -> {
                VolumeButtonPlugin.sendVolumeEvent(true)
                true
            }
            KeyEvent.KEYCODE_VOLUME_UP -> {
                VolumeButtonPlugin.sendVolumeEvent(false)
                true
            }
            else -> super.onKeyDown(keyCode, event)
        }
    }
}

class OpenTileService : TileService() {
    override fun onClick() {
        super.onClick()

        try {
            val intent = FlutterActivity.withNewEngine().build(this)
            if (Build.VERSION.SDK_INT >= 28) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }

            val pendingIntent = PendingIntent.getActivity(
                this,
                0,
                intent,
                PendingIntent.FLAG_IMMUTABLE
            )
            startActivityAndCollapse(pendingIntent)
        } catch (e: Exception) {
            Log.d("debug", "Exception ${e.toString()}")
        }
    }
}
