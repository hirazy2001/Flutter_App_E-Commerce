import 'package:flutter/services.dart';

class CallNativeUtils {
  static var _CHANNEL = "battery_channel";
  static late MethodChannel _platform;

  static void setChannel(channel) {
    _CHANNEL = channel;
    _platform = MethodChannel(_CHANNEL);
  }

  static Future invokeMethod(
      {required String method, dynamic arguments}) async {
    return _platform.invokeMethod(method, arguments);
  }

  static Future callBatteryChannel({required String method}) async{
    _platform = MethodChannel(method);
    _platform.invokeMethod(method);
  }

}
