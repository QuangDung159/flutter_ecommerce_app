// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/order_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/order_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:get/get.dart';

class ListOrderScreen extends StatefulWidget {
  const ListOrderScreen({super.key});

  @override
  State<ListOrderScreen> createState() => _ListOrderScreenState();
}

class _ListOrderScreenState extends State<ListOrderScreen> {
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
              title: 'Your orders',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimension.contentPadding / 2,
                  ),
                  child: Column(
                    children: renderListOrder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> renderListOrder() {
    List<Widget> listRendered = [];

    for (var i = 0; i < listOrderDummy.length; i++) {
      listRendered.add(
        renderOrder(
          orderModel: listOrderDummy[i],
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
          Container(
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
          ),
          Column(
            children: [
              OrderItem(
                orderItemModel: orderModel.orderItems[0],
                isEndItem: false,
              ),
              OrderItem(
                orderItemModel: orderModel.orderItems[1],
                isEndItem: true,
              ),
            ],
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
                        height: 14,
                        width: 27,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '4242',
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
                      'Total 2 items',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      formatPrice('200.0'),
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
}
