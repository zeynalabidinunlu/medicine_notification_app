import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medicine_notification_app/service/tts/tts_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
   debugPrint("Bildirim tıklandı - ID: ${notificationResponse.id}");
    debugPrint("Bildirim payload: ${notificationResponse.payload}");

    if (notificationResponse.payload != null && notificationResponse.payload!.isNotEmpty) {
      TTSService().speak(notificationResponse.payload!);
    } else {
      TTSService().speak("İlaç alma zamanı");
      debugPrint("Payload boş veya null");
    }
  }


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
    await notificationsPlugin.initialize(initSettings,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          "kanal_id",
          "kanal_isim",
          channelDescription: 'Günlük bildirim',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails());
  }

  Future<void> showNotification(
      {int id = 0, String? title, String? body}) async {
    return notificationsPlugin.show(id, title, body, notificationDetails(),
     payload: body);
  }

  Future<void> scheduledNotification({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    final now = tz.TZDateTime.now(tz.local);

    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate
          .add(const Duration(days: 1)); // Geçmiş saatler için ertesi güne al
    }

    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: jsonEncode(body), // EKLENDİ
    );
    debugPrint("DEBUG++++++++++++++++++++++++++++++++++++++++++++++++" + body);
  }

  Future<void> repeatNotification({
    required int id,
    required String title,
    required String body,
    required RepeatInterval repeatInterval,
    String? payload,
  }) async {
    await notificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      repeatInterval,
      notificationDetails(),
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  /// Tüm planlanmış veya gösterilmiş bildirimleri iptal eder.
  Future<void> cancellAllNotifications() async {
    await notificationsPlugin.cancelAll();
  }

  /// Belirli bir ID'ye sahip bildirimi iptal eder.
  Future<void> cancelNotificationById(int id) async {
    await notificationsPlugin.cancel(id);
  }

  void onDidReceiveNotificationResponse(NotificationResponse details) {
    debugPrint("Bildirim tıklandı - ID: ${details.id}");
    debugPrint("Bildirim payload: ${details.payload}");
     _ttsService.speak(details.payload!);
    if (details.payload != null && details.payload!.isNotEmpty) {
      _ttsService.speak(details.payload!);
    } else {
      _ttsService.speak("İlaç alma zamanı");
      debugPrint("Payload boş veya null");
    }
  }
}
