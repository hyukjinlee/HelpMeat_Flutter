
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:helpmeat/controller/notification.dart';
import 'package:vibration/vibration.dart';

class AlarmManager {
  AlarmManager._();

  static void start() {
    NotificationManager.sendNotificationForTimer();
    FlutterRingtonePlayer.playAlarm();
    Vibration.vibrate(duration: 1000);
  }

  static void stop() {
    FlutterRingtonePlayer.stop();
    Vibration.cancel();
  }
}