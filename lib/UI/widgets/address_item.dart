// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    Key? key,
    this.isSelected,
  }) : super(key: key);

  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
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
                        'Samantha Lee',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                  '111 Chu Thien, Hiep Tan ward',
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
        ],
      ),
    );
  }
}
