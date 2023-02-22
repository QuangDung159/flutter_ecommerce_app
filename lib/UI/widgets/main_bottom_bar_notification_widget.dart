// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/notification_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_google_info_controller.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:get/get.dart';

class MainBottomBarNotificationWidget extends StatefulWidget {
  const MainBottomBarNotificationWidget({super.key});

  @override
  State<MainBottomBarNotificationWidget> createState() =>
      _MainBottomBarNotificationWidgetState();
}

class _MainBottomBarNotificationWidgetState
    extends State<MainBottomBarNotificationWidget> {
  GetxAppController getx = Get.find<GetxAppController>();
  GetxGoogleInfoController googleGetx = Get.find<GetxGoogleInfoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              title: 'Notifications',
              action: Icon(Icons.checklist),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.contentPadding,
                  ),
                  margin: EdgeInsets.only(bottom: 12),
                  child: Obx(
                    () => Column(
                      children: renderListNoti(getx.listNoti),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> renderListNoti(List<NotificationModel> listNotification) {
    if (listNotification.isEmpty) {
      return [
        Container(
          height: 40,
          alignment: Alignment.center,
          child: Text('Notification empty'),
        )
      ];
    }

    List<Widget> listRender = [];

    for (var i = 0; i < listNotification.length; i++) {
      listRender.add(
        NotificationItem(
          notificationModel: listNotification[i],
        ),
      );
    }

    return listRender;
  }
}
