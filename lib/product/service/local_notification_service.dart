import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../../feature/reminder/model/pill_model.dart';

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  final BehaviorSubject<String?> onNotifationClick = BehaviorSubject();

  Future<void> intialize() async {
    _configureLocalTimeZone();
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _androidInitializationSettings,
    );

    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _localNotificationService.initialize(
      settings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channel id',
      'channel Name',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );

    IOSNotificationDetails iosNotificationDetails =
        const IOSNotificationDetails();

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();

    await _localNotificationService.show(id, title, body, details);
  }

  Future<void> cancelNotification({
    required int id,
  }) async {
    await _localNotificationService.cancel(id);
  }

  Future<void> showScheduleNotification({
    required int id,
    required int hour,
    required int minute,
    required PillModel item,
  }) async {
    final details = await _notificationDetails();

    await _localNotificationService.zonedSchedule(
      item.key,
      item.name,
      item.amount,
      _convertTime(hour, minute),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    /*  if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    } */
    return scheduleDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  Future<void> showNotificationWithPayload(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    final details = await _notificationDetails();

    await _localNotificationService.show(id, title, body, details,
        payload: payload);
  }

  void _androidInitializationSettings(
      int id, String? title, String? body, String? payload) {}

  void onSelectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      onNotifationClick.add(payload);
    }
  }
}
