// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/sort_filter_section_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';

class TabNewArrivalsWidget extends StatefulWidget {
  const TabNewArrivalsWidget({super.key});

  @override
  State<TabNewArrivalsWidget> createState() => _TabNewArrivalsWidgetState();
}

class _TabNewArrivalsWidgetState extends State<TabNewArrivalsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          SortFilterSectionWidget(
            sortItemModel: SortItemModel(
              title: 'Sale',
              value: 'sale',
            ),
          ),
          SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}
