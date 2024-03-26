package com.vts.flutterPOC

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.vts.flutterPOC/camera"

    companion object {
        init {
            System.loadLibrary("hello-world")
        }
    }

    // Declare the native method
    external fun invokePrintHelloWorld(): String

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getCameraView") {
                result.success("Android version not implemented")
            } else {
                result.notImplemented()
            }
        }

        val message = invokePrintHelloWorld()
        Log.d("MainActivity", message)
    }
}
