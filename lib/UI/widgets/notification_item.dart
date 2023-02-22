// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/notification_icon.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.notificationModel,
  }) : super(key: key);

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  notificationModel.subTitle,
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
    );
  }
}
