// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/checkout_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_item_delivery.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_total_section.dart';
import 'package:flutter_ecommerce_app/UI/widgets/filter_item_level_1.dart';
import 'package:flutter_ecommerce_app/UI/widgets/shipping_policy_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/address_model.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:get/get.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();
  List<Widget> renderListFilterLevel1() {
    List<Widget> listFilterLevel1Render = [];

    List listFilterLevel1 = getxAppController.listFilterLevel1;

    for (FilterItemModel item in listFilterLevel1) {
      listFilterLevel1Render.add(
        FilterItemLevel1(
          filterItemLevel1: item,
        ),
      );
    }

    return listFilterLevel1Render;
  }

  @override
  Widget build(BuildContext context) {
    GetxAppController getxAppController = Get.find<GetxAppController>();
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).padding.top,
          ),
          MyAppBar(
            hasBackButton: true,
            title: 'Delivery',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimension.contentPadding,
                    ),
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppDimension.contentPadding,
                        ),
                        Text(
                          '${getxAppController.listCartItemCheckout.length} items',
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: renderListCartItem(
                      getxAppController.listCartItemCheckout,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  renderDeliverySection(),
                ],
              ),
            ),
          ),
          CartTotalSection(
            buttonTitle: 'Payment',
            onTapButton: () {
              AddressModel? addressSelected =
                  getxAppController.addressSelected.value;

              if (getxAppController.shippingPolicySelected.value.deliveryInfo !=
                  'Self-Pickup') {
                if (addressSelected == null ||
                    addressSelected.receiverName == '') {
                  return;
                }
              }

              if (getxAppController.listCartItemCheckout.isNotEmpty) {
                Get.to(() => CheckoutScreen());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget renderDeliverySection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
          ),
          Text(
            'Delivery information',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Obx(
            () => Column(
              children: renderListShippingPolicy(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> renderListCartItem(List<CartItemModel> listCartItem) {
    List<Widget> listRender = [];

    if (listCartItem.isEmpty) {
      return [
        Center(
          child: Text('Cart empty'),
        )
      ];
    }

    for (var i = 0; i < listCartItem.length; i++) {
      listRender.add(
        CartItemDelivery(
          cartItem: listCartItem[i],
          isEndItem: i == listCartItem.length - 1,
        ),
      );
    }

    return listRender;
  }

  List<Widget> renderListShippingPolicy() {
    List<Widget> listRender = [];
    GetxAppController getxAppController = Get.find<GetxAppController>();

    for (var item in listShippingPolicyDummy) {
      listRender.add(
        GestureDetector(
          onTap: () => getxAppController.setData(
            shippingPolicySelected: item,
          ),
          child: ShippingPolicyItem(
            shippingPolicy: item,
            isSelected: getxAppController
                    .shippingPolicySelected.value.orderAmountInfo ==
                item.orderAmountInfo,
          ),
        ),
      );
    }
    return listRender;
  }
}
