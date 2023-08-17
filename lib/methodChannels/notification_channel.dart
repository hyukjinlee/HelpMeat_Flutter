
import 'package:flutter/services.dart';

class AppNotificationChannel {
  static Future<String> getPlatformVersion(MethodChannel channel) async {
    final String version = await channel.invokeMethod('getPlatformVersion');
    return version;
  }
}