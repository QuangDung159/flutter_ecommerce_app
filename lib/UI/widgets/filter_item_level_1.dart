// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/expanded_section.dart';
import 'package:flutter_ecommerce_app/UI/widgets/filter_item_level_2.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_level_1_model.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_level_2_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:get/get.dart';

class FilterItemLevel1 extends StatefulWidget {
  const FilterItemLevel1({
    Key? key,
    required this.filterItemLevel1,
  }) : super(key: key);

  final FilterItemLevel1Model filterItemLevel1;

  @override
  State<FilterItemLevel1> createState() => _FilterItemLevel1State();
}

class _FilterItemLevel1State extends State<FilterItemLevel1> {
  bool showListLevel2 = false;
  GetxAppController getxApp = Get.find<GetxAppController>();

  void onTapFilterItem(List<String> listFilterSelected, filterLevel2) {
    int index =
        listFilterSelected.indexWhere((element) => element == filterLevel2.id);

    if (index == -1) {
      listFilterSelected.add(filterLevel2.id);
    } else {
      listFilterSelected.removeAt(index);
    }
  }

  List<Widget> renderListFilterLevel2(FilterItemLevel1Model filterLevel1) {
    List<FilterItemLevel2Model> listFilterLevel2 =
        filterLevel1.listFilterLevel2 ?? [];
    List<Widget> listLevel2Render = [];

    List<String> listFilterSelected = getxApp.listFilterItemSelected;

    for (var filterLevel2 in listFilterLevel2) {
      listLevel2Render.add(
        GestureDetector(
          onTap: () => onTapFilterItem(listFilterSelected, filterLevel2),
          child: FilterItemLevel2(
            filterItemLevel2: filterLevel2,
          ),
        ),
      );
    }

    return listLevel2Render;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.filterItemLevel1.name,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                showListLevel2 = !showListLevel2;
              }),
              child: Image.asset(
                showListLevel2
                    ? AssetHelper.iconChevronUp
                    : AssetHelper.iconChevronDown,
                width: 10,
              ),
            ),
          ],
        ),
        ExpandedSection(
          expand: showListLevel2,
          child: Column(
            children: [
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
                children: renderListFilterLevel2(widget.filterItemLevel1),
              ),
            ],
          ),
        ),
        Container(
          height: 18,
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
