// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class ShippingPolicyItem extends StatelessWidget {
  const ShippingPolicyItem({
    Key? key,
    required this.shippingPolicy,
  }) : super(key: key);

  final ShippingPolicyModel shippingPolicy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.blackPrimary,
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
                        shippingPolicy.deliveryInfo,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(' | '),
                    Text('+123123'),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  shippingPolicy.displayFee,
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
          Image.asset(
            AssetHelper.iconChevronRight,
            width: 6,
          ),
        ],
      ),
    );
  }
}