package com.iakmds.librecamera

import android.content.ContentValues
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.util.Log
import android.webkit.MimeTypeMap
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.IOException
import android.media.MediaScannerConnection

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "media_store"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "updateItem" -> {
                    updateItem(call.argument("path")!!)
                    result.success(null)
                }
            }
        }
    }

    private fun updateItem(path: String) {
        val file = File(path) 
        MediaScannerConnection.scanFile(context, arrayOf(file.toString()),
            null, null)
    }
}