// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/order_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/data/order_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({
    super.key,
    required this.listOrderModel,
  });

  final List<OrderModel> listOrderModel;

  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppDimension.contentPadding / 2,
        ),
        child: Column(
          children: renderListOrder(),
        ),
      ),
    );
  }

  List<Widget> renderListOrder() {
    List<Widget> listRendered = [];

    for (var i = 0; i < widget.listOrderModel.length; i++) {
      listRendered.add(
        renderOrder(
          orderModel: widget.listOrderModel[i],
        ),
      );
    }

    return listRendered;
  }

  Widget renderOrder({
    required OrderModel orderModel,
  }) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          if (orderModel.deliveryAt != null && orderModel.deliveryAt != '')
            renderDeliveredAt(orderModel),
          Column(
            children: renderListOrderItem(orderModel),
          ),
          Container(
            padding: EdgeInsets.only(
              left: AppDimension.contentPadding,
              right: AppDimension.contentPadding,
              bottom: AppDimension.contentPadding,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 72,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AssetHelper.iconVisa,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        orderModel.paymentTransaction.cardLast4,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Total ${orderModel.orderItems.length} items',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      formatPrice(orderModel.totalAmount),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> renderListOrderItem(OrderModel orderModel) {
    List<Widget> listRendered = [];

    for (var i = 0; i < orderModel.orderItems.length; i++) {
      listRendered.add(
        OrderItem(
          orderItemModel: orderModel.orderItems[i],
          isEndItem: i == orderModel.orderItems.length - 1,
        ),
      );
    }

    return listRendered;
  }

  Widget renderDeliveredAt(OrderModel orderModel) {
    return Container(
      margin: EdgeInsets.only(
        top: AppDimension.contentPadding,
        left: AppDimension.contentPadding,
        right: AppDimension.contentPadding,
      ),
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Image.asset(
            AssetHelper.iconDelivery,
            width: 16,
            height: 16,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '${orderModel.deliveryAt} - Your package has been delivered',
            style: TextStyle(
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
