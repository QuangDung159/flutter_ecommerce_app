// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/filter_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SortFilterSectionWidget extends StatefulWidget {
  const SortFilterSectionWidget({
    Key? key,
    required this.sortItemModel,
  }) : super(key: key);

  final SortItemModel sortItemModel;

  @override
  State<SortFilterSectionWidget> createState() =>
      _SortFilterSectionWidgetState();
}

class _SortFilterSectionWidgetState extends State<SortFilterSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Sort by: '),
            GestureDetector(
              onTap: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: FilterBottomSheet(),
                  ),
                );
              },
              child: Text(
                widget.sortItemModel.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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
