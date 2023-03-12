// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/notification_item.dart';
import 'package:flutter_ecommerce_app/UI/widgets/sign_in_section.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:flutter_ecommerce_app/core/services/notification_services.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => renderAppBar(),
            ),
            Obx(() => renderMainContentBySignedStatus())
          ],
        ),
      ),
    );
  }

  MyAppBar renderAppBar() {
    bool isSigned = getx.userLogged.value != null;
    return MyAppBar(
      title: 'Notifications',
      action: isSigned
          ? GestureDetector(
              onTap: () => NotificationServices.onUserReadAllNotification(),
              child: Icon(
                Icons.checklist_rtl,
                size: 24,
              ),
            )
          : null,
    );
  }

  Widget renderMainContentBySignedStatus() {
    bool isSigned = getx.userLogged.value != null;

    if (isSigned) {
      return renderMainContent();
    }
    return SignInSection();
  }

  Widget renderMainContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: AppDimension.contentPadding,
          ),
          margin: EdgeInsets.only(bottom: 12),
          child: Column(
            children: renderListNoti(getx.listNoti),
          ),
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
