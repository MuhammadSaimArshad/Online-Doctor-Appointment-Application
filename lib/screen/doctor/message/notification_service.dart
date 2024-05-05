// ignore_for_file: avoid_print

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
// import 'package:timezone/timezone.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tzdata;
// import 'package:timezone/browser.dart' as d;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (String? id) async {
      //   print("onSelectNotification");
      //   if (id!.isNotEmpty) {
      //     print("Router Value1234 $id");

      //     // Navigator.of(context).push(
      //     //   MaterialPageRoute(
      //     //     builder: (context) => DemoScreen(
      //     //       id: id,
      //     //     ),
      //     //   ),
      //     // );

      //   }
      // },
    );
  }

  static void createAndDisplayCallNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: message.notification!.title,
            body: message.notification!.body),
        actionButtons: <NotificationActionButton>[
          NotificationActionButton(key: 'yes', label: 'Yes'),
          NotificationActionButton(key: 'no', label: 'No'),
        ],
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  // static Future<void> scheduleNotification(title, hour, minute) async {
  //   // tz.initializeDatabase([

  //   // ]);
  //   d.initializeTimeZone();
  //   final loc_egypt = tz.getLocation('Africa/Cairo');
  //   final tz.TZDateTime now = tz.TZDateTime.now(loc_egypt);
  //   var schedule_30before = tz.TZDateTime(loc_egypt, DateTime.now().year,
  //           DateTime.now().month, DateTime.now().day, hour, minute)
  //       .subtract(Duration(minutes: 30));

  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       0,
  //       title,
  //       "The Webinar will start after 30 minutes",
  //       schedule_30before,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //             "pushnotificationapp", "pushnotificationappchannel",
  //             importance: Importance.max,
  //             priority: Priority.high,
  //             icon: '@mipmap/ic_launcher'),
  //       ),
  //       // androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);
  // }

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // static Future<void> scheduleNotification(
  //   String time,
  // ) async {
  //   //  await  tz.initializeTimeZones();
  //   int increasetime = await convertToRemainingMinutes(time);
  //   const NotificationDetails notificationDetails = NotificationDetails(
  //     android: AndroidNotificationDetails(
  //         "pushnotificationapp", "pushnotificationappchannel",
  //         importance: Importance.max,
  //         priority: Priority.high,
  //         icon: '@mipmap/ic_launcher'),
  //   );
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //       "pushnotificationapp", "pushnotificationappchannel",
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       icon: '@mipmap/ic_launcher');
  //   //////////
  //   final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  //   await _notificationsPlugin.show(
  //       id,
  //       "Appointment remaning time ${increasetime} mint ",
  //       "${time} Appointment time",
  //       notificationDetails);
  //   ////////
  //   var platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics, iOS: null);

  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     0,
  //     'Scheduled Notification Title',
  //     'Scheduled Notification Body',
  //     tz.TZDateTime.now(tz.local).add(Duration(minutes: increasetime)),
  //     platformChannelSpecifics,
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }

  static List<int> convertToRemainingMinutes(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1].substring(0, 2));
    final isAM = parts[1].substring(2).toLowerCase() == 'am';
    int adjustedHour = isAM ? hour : hour + 12;

    DateTime now = DateTime.now();
    DateTime modifiedTime = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    ).subtract(const Duration(minutes: 20));
    List<int> list = [];
    list.add(modifiedTime.hour);
    list.add(modifiedTime.minute);
    return list;
  }
//   static Future<tz.TZDateTime> getCurrentTime(double latitude, double longitude) async {
//   tzdata.initializeTimeZones();

//   tz.Location location = await getTimeZone(latitude, longitude);

//   tz.TZDateTime currentTime = tz.TZDateTime.now(location);

//   return currentTime;
// }

  static void createAndDisplayChatNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            "pushnotificationapp", "pushnotificationappchannel",
            importance: Importance.max,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher'),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
