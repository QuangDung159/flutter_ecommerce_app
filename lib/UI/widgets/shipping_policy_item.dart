// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/delivery_address_screen.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:get/get.dart';

class ShippingPolicyItem extends StatelessWidget {
  const ShippingPolicyItem({
    Key? key,
    required this.shippingPolicy,
    this.isSelected,
  }) : super(key: key);

  final ShippingPolicyModel shippingPolicy;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    bool isSelfPickup = shippingPolicy.deliveryInfo == 'Self-Pickup';
    GetxAppController getx = Get.find<GetxAppController>();

    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ?? false ? AppColors.blackPrimary : Colors.white,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            isSelfPickup ? AssetHelper.iconMap : AssetHelper.iconDelivery,
            width: 24,
          ),
          SizedBox(
            width: 12,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: renderName(isSelfPickup, getx),
                    ),
                  ],
                ),
                if (!isSelfPickup)
                  Obx(
                    () => Text(
                      getx.addressSelected.value != null
                          ? getx.addressSelected.value!.phone
                          : '',
                    ),
                  ),
                SizedBox(
                  height: 6,
                ),
                renderAddress(isSelfPickup, getx),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          if (shippingPolicy.fee != '0.0')
            Text(
              formatPrice(shippingPolicy.fee),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          SizedBox(
            width: 12,
          ),
          if (!isSelfPickup)
            GestureDetector(
              onTap: () => Get.to(() => DeliveryAddressScreen()),
              child: Container(
                margin: EdgeInsets.only(top: 3),
                child: Image.asset(
                  AssetHelper.iconChevronRight,
                  width: 6,
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget renderAddress(bool isSelfPickup, GetxAppController getx) {
    if (isSelfPickup) {
      return Text(
        shippingPolicy.displayFee,
        style: TextStyle(
          fontSize: 12,
          color: AppColors.greyMid,
        ),
      );
    }

    return Obx(
      () => Text(
        CartServices.getFullAddress(getx.addressSelected.value),
        style: TextStyle(
          fontSize: 12,
          color: AppColors.greyMid,
        ),
      ),
    );
  }

  Widget renderName(bool isSelfPickup, GetxAppController getx) {
    if (isSelfPickup) {
      return Text(
        shippingPolicy.deliveryInfo,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Obx(
      () => Text(
        getx.addressSelected.value != null
            ? getx.addressSelected.value!.receiverName
            : 'Please choose delivery address',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
