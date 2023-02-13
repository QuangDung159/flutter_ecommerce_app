// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class SortFilterSectionWidget extends StatelessWidget {
  const SortFilterSectionWidget({
    Key? key,
    required this.sortItemModel,
  }) : super(key: key);

  final SortItemModel sortItemModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Sort by: '),
            Text(
              sortItemModel.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 21,
            ),
          ],
        ),
        Image.asset(
          AssetHelper.iconFilter,
          width: 20,
          height: 20,
        )
      ],
    );
  }
}
