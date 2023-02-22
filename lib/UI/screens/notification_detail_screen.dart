// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:get/get.dart';

class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({
    super.key,
    required this.notificationModel,
  });

  final NotificationModel notificationModel;

  @override
  State<NotificationDetailScreen> createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).padding.top,
            ),
            MyAppBar(
              hasBackButton: true,
              title: 'Notification',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
