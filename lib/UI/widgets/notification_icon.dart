import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key? key,
    required this.notificationModel,
  }) : super(key: key);

  final NotificationModel notificationModel;

  String getImageByType(String type) {
    switch (type) {
      case 'Update':
        return AssetHelper.iconUpdate;
      case 'Order':
        return AssetHelper.iconDelivery;
      case 'Promotion':
        return AssetHelper.iconPromo;
      default:
        return AssetHelper.iconFeedback;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      getImageByType(notificationModel.type),
      width: 20,
      height: 20,
      color: Colors.white,
    );
  }
}
