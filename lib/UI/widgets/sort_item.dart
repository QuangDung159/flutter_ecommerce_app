// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class ShortItem extends StatelessWidget {
  const ShortItem({
    Key? key,
    this.isChecked, required this.sortItemModel,
  }) : super(key: key);

  final bool? isChecked;
  final SortItemModel sortItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sortItemModel.title,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Image.asset(
              isChecked ?? false
                  ? AssetHelper.iconCheck
                  : AssetHelper.iconUncheck,
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
