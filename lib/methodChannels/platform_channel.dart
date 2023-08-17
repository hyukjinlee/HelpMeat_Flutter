
import 'package:flutter/services.dart';

class AppPlatformChannel {
  static Future<String> getPlatformVersion(MethodChannel channel) async {
    final String version = await channel.invokeMethod('getPlatformVersion');
    return version;
  }
}