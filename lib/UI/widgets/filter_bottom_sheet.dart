// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/sort_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String sortSelectedValue = 'recommended';

  List<Widget> renderListSortItem() {
    List<Widget> listSortItemRender = [];
    for (var i = 0; i < listSortDummy.length; i++) {
      listSortItemRender.add(
        GestureDetector(
          onTap: () {
            setState(() {
              sortSelectedValue = listSortDummy[i].value;
            });
          },
          child: ShortItem(
            sortItemModel: listSortDummy[i],
            isChecked: sortSelectedValue == listSortDummy[i].value,
          ),
        ),
      );
    }

    return listSortItemRender;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 10,
        ),
        Image.asset(
          AssetHelper.iconBottomSheet,
          width: 40,
          height: 4,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Sort',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 36,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimension.contentPadding,
          ),
          child: Column(
            children: renderListSortItem(),
          ),
        ),
        SizedBox(
          height: 36,
        ),
      ],
    );
  }
}
