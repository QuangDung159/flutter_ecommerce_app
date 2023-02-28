// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class PaymentCardItem extends StatefulWidget {
  const PaymentCardItem({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentCardItem> createState() => _PaymentCardItemState();
}

class _PaymentCardItemState extends State<PaymentCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimension.contentPadding,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  AssetHelper.iconVisa,
                  width: 48,
                  height: 48,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '**** **** **** 4242',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Visa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Default',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.close,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
