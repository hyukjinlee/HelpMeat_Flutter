import 'package:notification_permissions/notification_permissions.dart';

class PermissionUtils {
  static const PERMISSION_GRANTED = "granted";
  static const PERMISSION_DENIED = "denied";
  static const PERMISSION_UNKNOWN = "unknown";
  static const PERMISSION_PROVISIONAL = "provisional";


  static void requestNotificationPermission<R>(void Function() onCompleted) {
    NotificationPermissions.requestNotificationPermissions(
        iosSettings: const NotificationSettingsIos(
            sound: true, badge: true, alert: true))
        .then((_) {
      onCompleted.call();
    });
  }

  /// Checks the notification permission status
  static Future<String> getCheckNotificationPermStatus() {
    return NotificationPermissions.getNotificationPermissionStatus()
        .then((status) {
      switch (status) {
        case PermissionStatus.denied:
          return PERMISSION_DENIED;
        case PermissionStatus.granted:
          return PERMISSION_GRANTED;
        case PermissionStatus.unknown:
          return PERMISSION_UNKNOWN;
        case PermissionStatus.provisional:
          return PERMISSION_PROVISIONAL;
        default:
          return "";
      }
    });
  }
}