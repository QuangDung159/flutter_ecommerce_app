// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/category_panel_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      shrinkWrap: true,
      childAspectRatio: (512 / 406),
      children: [
        CategoryPanelItem(
          title: 'Swim',
          imagePath: AssetHelper.panelSwim,
        ),
        CategoryPanelItem(
          title: 'Bike',
          imagePath: AssetHelper.panelBike,
        ),
        CategoryPanelItem(
          title: 'Run',
          imagePath: AssetHelper.panelRun,
        ),
        CategoryPanelItem(
          title: 'Train',
          imagePath: AssetHelper.panelTrain,
        ),
        CategoryPanelItem(
          title: 'Yoga',
          imagePath: AssetHelper.panelYoga,
        ),
        CategoryPanelItem(
          title: 'Equipment',
          imagePath: AssetHelper.panelEquipment,
        ),
      ],
    );
  }
}
