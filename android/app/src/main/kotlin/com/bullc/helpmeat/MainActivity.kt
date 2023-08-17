package com.bullc.helpmeat

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {
    companion object {
        const val METHOD_CHANNEL_ID = "com.bullc.helpmeat"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor, METHOD_CHANNEL_ID)
        channel.setMethodCallHandler(handler)
    }

    private val handler = MethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
        if (methodCall.method == "getPlatformVersion") {
            result.success("Android Version: " + Build.VERSION.RELEASE)
        } else {
            result.notImplemented()
        }
    }
}
