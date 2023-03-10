// ignore_for_file: prefer_const_constructors, unused_element

import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/cart_screen.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:flutter_ecommerce_app/core/data/received_notification_model.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static GetxAppController getxApp = Get.find<GetxAppController>();
  static String uri = '$baseUrl/notification';

  static tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static tz.TZDateTime _nextInstanceOfTenAMLastYear() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    return tz.TZDateTime(tz.local, now.year - 1, now.month, now.day, 10);
  }

  static tz.TZDateTime _nextInstanceOfMondayTenAM() {
    tz.TZDateTime scheduledDate = _nextInstanceOfTenAM();
    while (scheduledDate.weekday != DateTime.monday) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static Future<void> configureLocalTimeZone() async {
    if (kIsWeb || Platform.isLinux) {
      return;
    }
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  static Future<void> showNotification({
    String? title,
    String? body,
    String? soundName,
    String? payload,
    bool? usingCustomSound = false,
    Duration? duration,
  }) async {
    bool isPlayCustomSound = usingCustomSound != null && usingCustomSound;

    NotificationServices.fetchListNotificationByUser();

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      sound: isPlayCustomSound
          ? RawResourceAndroidNotificationSound('slow_spring_board')
          : null,
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    if (isPlayCustomSound) {
      DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails(sound: 'slow_spring_board.aiff');

      final LinuxNotificationDetails linuxPlatformChannelSpecifics =
          LinuxNotificationDetails(
        sound: AssetsLinuxSound('sound/slow_spring_board.mp3'),
      );

      notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails,
        macOS: darwinNotificationDetails,
        linux: linuxPlatformChannelSpecifics,
      );
    }

    if (duration != null) {
      await zonedSchedule(
        title: title,
        body: body,
        duration: duration,
        notificationDetails: notificationDetails,
      );
    } else {
      await flutterLocalNotificationsPlugin.show(
        id++,
        title,
        body,
        notificationDetails,
        payload: payload,
      );
    }
  }

  static Future<void> zonedSchedule({
    String? title,
    String? body,
    String? payload,
    required Duration duration,
    required NotificationDetails notificationDetails,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id++,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(duration),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  static Future<void> repeatNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'repeating channel id', 'repeating channel name',
            channelDescription: 'repeating description');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id++,
        'repeating title',
        'repeating body',
        RepeatInterval.everyMinute,
        notificationDetails,
        androidAllowWhileIdle: true);
  }

  static Future<void> scheduleDailyTenAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'daily scheduled notification title',
        'daily scheduled notification body',
        _nextInstanceOfTenAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id',
              'daily notification channel name',
              channelDescription: 'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  /// To test we don't validate past dates when using `matchDateTimeComponents`
  static Future<void> scheduleDailyTenAMLastYearNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'daily scheduled notification title',
        'daily scheduled notification body',
        _nextInstanceOfTenAMLastYear(),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id',
              'daily notification channel name',
              channelDescription: 'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  static Future<void> scheduleWeeklyTenAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'weekly scheduled notification title',
        'weekly scheduled notification body',
        _nextInstanceOfTenAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'weekly notification channel id',
            'weekly notification channel name',
            channelDescription: 'weekly notificationdescription',
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  }

  static void onTapLocalNotification() {
    selectNotificationStream.stream.listen((String? payload) async {
      navigationByUrl(payload);
    });
  }

  static Future<InitializationSettings> initializeLocalNotificationSettings(
      {String? initialRoute}) async {
    await NotificationServices.configureLocalTimeZone();

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        !kIsWeb && Platform.isLinux
            ? null
            : await flutterLocalNotificationsPlugin
                .getNotificationAppLaunchDetails();

    if (initialRoute == null || initialRoute == '') {
      initialRoute = '/cart_screen';
    }

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload =
          notificationAppLaunchDetails!.notificationResponse?.payload;
      printCustom(
          title: 'selectedNotificationPayload :>>',
          content: selectedNotificationPayload);
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final List<DarwinNotificationCategory> darwinNotificationCategories =
        <DarwinNotificationCategory>[
      DarwinNotificationCategory(
        darwinNotificationCategoryText,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.text(
            'text_1',
            'Action 1',
            buttonTitle: 'Send',
            placeholder: 'Placeholder',
          ),
        ],
      ),
      DarwinNotificationCategory(
        darwinNotificationCategoryPlain,
        actions: <DarwinNotificationAction>[
          DarwinNotificationAction.plain('id_1', 'Action 1'),
          DarwinNotificationAction.plain(
            'id_2',
            'Action 2 (destructive)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.destructive,
            },
          ),
          DarwinNotificationAction.plain(
            navigationActionId,
            'Action 3 (foreground)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.foreground,
            },
          ),
          DarwinNotificationAction.plain(
            'id_4',
            'Action 4 (auth required)',
            options: <DarwinNotificationActionOption>{
              DarwinNotificationActionOption.authenticationRequired,
            },
          ),
        ],
        options: <DarwinNotificationCategoryOption>{
          DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
        },
      )
    ];

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        didReceiveLocalNotificationStream.add(
          ReceivedNotificationModel(
            id: id,
            title: title,
            body: body,
            payload: payload,
          ),
        );
      },
      notificationCategories: darwinNotificationCategories,
    );

    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(
      defaultActionName: 'Open notification',
      defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );

    return initializationSettings;
  }

  static void configureDidReceiveLocalNotificationSubject(
      BuildContext context) {
    didReceiveLocalNotificationStream.stream
        .listen((ReceivedNotificationModel receivedNotification) async {
      printCustom(
          title: 'receivedNotification :>>', content: receivedNotification);

      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title!)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body!)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                Get.to(() => CartScreen());
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  static Future<void> setupInteractedFirebaseMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  static void _handleMessage(RemoteMessage message) async {
    if (message.data['payload'] == null || message.data['payload'] == '') {
      return;
    }
    navigationByUrl(message.data['payload']);
  }

  static List<NotificationModel> getListNotificationFromRes(res) {
    Iterable listJson = jsonDecode(res.body)['data']['listNotification'];
    List<NotificationModel> listNotification = List<NotificationModel>.from(
      listJson.map(
        (e) => NotificationModel.fromJson(e),
      ),
    );

    return listNotification;
  }

  static Future<void> fetchListNotificationByUser() async {
    try {
      UserModel? user = getxApp.userLogged.value;
      if (user == null) {
        return;
      }

      final res = await httpGet(uri: '$uri/${user.id}');
      if (isRequestSuccess(res)) {
        List<NotificationModel> listNotification =
            getListNotificationFromRes(res);
        getxApp.setData(listNoti: listNotification);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> onUserReadNotification(String notificationId) async {
    try {
      UserModel? user = getxApp.userLogged.value;
      List<NotificationModel> listNoti = getxApp.listNoti;
      int index =
          listNoti.indexWhere((element) => element.id == notificationId);

      if (index == -1) {
        return;
      }

      NotificationModel noti = NotificationModel(
        type: listNoti[index].type,
        title: listNoti[index].title,
        subTitle: listNoti[index].subTitle,
        content: listNoti[index].content,
        sendAt: listNoti[index].sendAt,
        id: listNoti[index].id,
        isRead: true,
        payloadUrl: listNoti[index].payloadUrl,
      );

      listNoti[index] = noti;

      Map<String, dynamic> reqBody = {'is_read': true};

      httpPut(
        uri: '$uri/${user!.id}/$notificationId',
        reqBody: reqBody,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> onUserReadAllNotification() async {
    try {
      UserModel? user = getxApp.userLogged.value;
      List<NotificationModel> listNoti = getxApp.listNoti;
      List<String> listNotiId = [];

      for (var item in listNoti) {
        if (!item.isRead) {
          listNotiId.add(item.id);
        }
      }

      if (listNotiId.isEmpty) {
        return;
      }

      Map<String, dynamic> reqBody = {
        'is_read': true,
        'listNotificationId': listNotiId,
      };

      final res = await httpPut(
        uri: '$uri/updateMany/${user!.id}',
        reqBody: reqBody,
      );

      if (isRequestSuccess(res)) {
        List<NotificationModel> listNotification =
            getListNotificationFromRes(res);
        getxApp.setData(listNoti: listNotification);

        showSnackBar(content: 'Read all notification');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
