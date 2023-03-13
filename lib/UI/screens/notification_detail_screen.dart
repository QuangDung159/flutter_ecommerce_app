// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/notification_icon.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/datetime_model.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_html/flutter_html.dart';
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
    DateTimeModel dateTimeModel = getDateTimeFromString(
      widget.notificationModel.sendAt,
    );

    String payloadUrl = widget.notificationModel.payloadUrl;

    return Scaffold(
      backgroundColor: AppColors.primary,
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
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.contentPadding,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 49,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text(
                                        widget.notificationModel.type,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.greyScale,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        widget.notificationModel.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                AssetHelper.iconCalendar,
                                                width: 15,
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${dateTimeModel.year}/${dateTimeModel.month}/${dateTimeModel.day}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.greyScale,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Image.asset(
                                                AssetHelper.iconTime,
                                                width: 15,
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${dateTimeModel.hour}:${dateTimeModel.minute}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.greyScale,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: AppDimension.contentPadding,
                                      ),
                                      renderHtml(
                                        widget.notificationModel.content,
                                      ),
                                      if (payloadUrl != '')
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 16,
                                            ),
                                            LoadingButtonWidget(
                                              label: 'Go to',
                                              onTap: () => navigationByUrl(payloadUrl),
                                            ),
                                          ],
                                        ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 25,
                            child: renderIcon(),
                          ),
                        ],
                      )
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

  Widget renderHtml(String content) {
    Widget html = Html(
      data: content,
      style: {
        'body': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
        ),
        'p': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
        ),
      },
    );
    return html;
  }

  Widget renderIcon() {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: NotificationIcon(
        notificationModel: widget.notificationModel,
        color: AppColors.primary,
        size: 30,
      ),
    );
  }
}
