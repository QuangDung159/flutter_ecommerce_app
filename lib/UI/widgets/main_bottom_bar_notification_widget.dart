// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/notification_icon.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_google_info_controller.dart';
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.contentPadding,
                  ),
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.border,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.primary,
                              ),
                              child: NotificationIcon(
                                notificationModel: listNotificationDummy[0],
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listNotificationDummy[0].type,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    listNotificationDummy[0].subTitle,
                                    style: TextStyle(
                                      color: AppColors.greyScale,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    '31 May',
                                    style: TextStyle(
                                      color: AppColors.greyScale,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
