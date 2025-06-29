import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medicine_notification_app/service/tts/tts_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class FlutterLocalNotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  final TTSService _ttsService = TTSService();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> initNotification() async {
    if (_isInitialized) return;

    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    await _ttsService.initialize();

    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true);
    const initSettings = InitializationSettings(
        android: initSettingsAndroid, iOS: initSettingsIOS);
    await notificationsPlugin.initialize(initSettings);
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails("kanal_id", "kanal_isim",
            channelDescription: 'Günlük bildirim',
            importance: Importance.max,
            priority: Priority.high),
        iOS: DarwinNotificationDetails());
  }

  Future<void> showNotification(
      {int id = 0, String? title, String? body}) async {
    return notificationsPlugin.show(id, title, body, notificationDetails());
  }

  Future<void> scheduledNotification(
      {int id = 1,
      required String title,
      required String body,
      required int hour,
      required int minute}) async {
    final now = tz.TZDateTime.now(tz.local);

    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    await notificationsPlugin.zonedSchedule(
        id, title, body, scheduledDate, notificationDetails(),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  //Bildirimleri susturmak

  Future<void> cancellAllNotifications() async {
    await notificationsPlugin.cancelAll();
  }
  Future<void> cancelNotificationById(int id) async {
    await notificationsPlugin.cancel(id);
  }
}
