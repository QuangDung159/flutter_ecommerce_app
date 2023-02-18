// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';

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
            AssetHelper.iconMap,
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
                      child: Text(
                        isSelfPickup
                            ? shippingPolicy.deliveryInfo
                            : 'Samantha Lee',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (!isSelfPickup)
                      Row(
                        children: [
                          Text(' | '),
                          Text('+123123'),
                        ],
                      )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  isSelfPickup
                      ? shippingPolicy.displayFee
                      : '111 Chu Thien, Hiep Tan ward',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyMid,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
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
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Image.asset(
              AssetHelper.iconChevronRight,
              width: 6,
            ),
          )
        ],
      ),
    );
  }
}
