// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    children: [
                      Text('asd'),
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
