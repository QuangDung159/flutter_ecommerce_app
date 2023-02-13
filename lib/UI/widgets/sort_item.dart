// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class ShortItem extends StatelessWidget {
  const ShortItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommended',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Image.asset(
              AssetHelper.iconCheck,
              width: 24,
              height: 24,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.border,
                width: 1,
              ),
            ),
          ),
          height: 18,
        ),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
