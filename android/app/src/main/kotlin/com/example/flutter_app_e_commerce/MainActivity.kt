package com.example.flutter_app_e_commerce

import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val BATTERY_CHANNEL = "battery_channel"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BATTERY_CHANNEL)

        val methodCallHandler = channel.setMethodCallHandler { call, result ->
            if(call.method == "getBatteryLevel"){
                val argument = call.arguments as Map<*, *>

                val name = argument["name"]

                // if(argument == "name"){
                val batteryLevel = getBatteryLevel()

                result.success("$name says: $batteryLevel%")
                // }
            }
            else{
                result.notImplemented()
            }

        }

//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
//                call, result ->
//            // This method is invoked on the main thread.
//            // TODO
//        }
    }

    private fun getBatteryLevel(): Int {
        var batteryLevel = -1
        batteryLevel = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager: BatteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent: Intent = ContextWrapper(applicationContext).registerReceiver(
                null,
                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            )!!
            intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
        return batteryLevel
    }
}
