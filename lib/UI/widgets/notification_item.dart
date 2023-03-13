// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/notification_detail_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/notification_icon.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/data/datetime_model.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/notification_services.dart';
import 'package:get/get.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.notificationModel,
  }) : super(key: key);

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    bool isRead = notificationModel.isRead;
    DateTimeModel dateTimeModel = getDateTimeFromString(
      notificationModel.sendAt,
    );

    return GestureDetector(
      onTap: () {
        Get.to(
          () => NotificationDetailScreen(
            notificationModel: notificationModel,
          ),
        );
        NotificationServices.onUserReadNotification(notificationModel.id);
      },
      child: Container(
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
                color: isRead
                    ? AppColors.greyScale.withOpacity(0.6)
                    : AppColors.primary,
              ),
              child: NotificationIcon(
                notificationModel: notificationModel,
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
                    notificationModel.type,
                    style: TextStyle(
                      fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                      fontSize: 16,
                      color: isRead
                          ? AppColors.blackPrimary.withOpacity(0.6)
                          : AppColors.blackPrimary,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    notificationModel.subTitle,
                    style: TextStyle(
                      color: isRead
                          ? AppColors.greyScale.withOpacity(0.6)
                          : AppColors.greyScale,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isRead ? Colors.white : AppColors.primary,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  '${dateTimeModel.day} ${dateTimeModel.monthShort}',
                  style: TextStyle(
                    color: isRead
                        ? AppColors.greyScale.withOpacity(0.6)
                        : AppColors.greyScale,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
