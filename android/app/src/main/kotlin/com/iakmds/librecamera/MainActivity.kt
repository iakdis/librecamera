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
import android.content.Intent
import android.net.Uri
import androidx.core.content.FileProvider


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
                "openItem" -> {
                    openItem(call.argument("path")!!, call.argument("mimeType")!!, call.argument("openInGallery")!!)
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

    private fun openItem(path: String, mimeType: String, openInGallery: Boolean) {
        val file = File(path)
        var uri = FileProvider.getUriForFile(context, "com.iakmds.librecamera.provider", file)
        if(openInGallery) {
            uri = Uri.parse("content:/$path")
        }

        Intent().apply {
            action = Intent.ACTION_VIEW
            setDataAndType(uri, mimeType)

            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION)

            startActivity(this)
        }
    }
}