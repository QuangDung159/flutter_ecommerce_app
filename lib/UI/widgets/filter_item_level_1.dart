// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/filter_item_level_2.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class FilterItemLevel1 extends StatefulWidget {
  const FilterItemLevel1({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterItemLevel1> createState() => _FilterItemLevel1State();
}

class _FilterItemLevel1State extends State<FilterItemLevel1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sport',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Image.asset(
              AssetHelper.iconChevronUp,
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        GridView.count(
          primary: false,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          childAspectRatio: (102 / 34),
          children: [
            FilterItemLevel2(isSelected: true),
            FilterItemLevel2(isSelected: false),
            FilterItemLevel2(isSelected: true),
            FilterItemLevel2(isSelected: true),
          ],
        ),
        Container(
          height: 24,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.border,
                width: 1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
