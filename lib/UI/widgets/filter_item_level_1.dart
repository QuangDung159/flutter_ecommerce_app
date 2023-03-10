// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/expanded_section.dart';
import 'package:flutter_ecommerce_app/UI/widgets/filter_item_level_2.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/services/sort_filter_services.dart';
import 'package:get/get.dart';

class FilterItemLevel1 extends StatefulWidget {
  const FilterItemLevel1({
    Key? key,
    required this.filterItemLevel1,
  }) : super(key: key);

  final FilterItemModel filterItemLevel1;

  @override
  State<FilterItemLevel1> createState() => _FilterItemLevel1State();
}

class _FilterItemLevel1State extends State<FilterItemLevel1> {
  bool showListLevel2 = false;

  void onTapFilterItem(listFilterSelected, filterItem) {
    List<int> listSelected = listFilterSelected;
    if (SortFilterServices.isFilterSelected(
      listFilterSelected,
      filterItem,
    )) {
      listSelected.remove(filterItem.id);
    } else {
      listSelected.add(filterItem.id);
    }
  }

  List<Widget> renderListFilterLevel2() {
    GetxAppController getxAppController = Get.find<GetxAppController>();
    List<Widget> listLevel2Render = [];
    List listFilterLevel2 = getxAppController.listFilterLevel2;
    List<int> listFilterSelected =
        getxAppController.listFilterSelected.cast<int>();

    for (FilterItemModel item in listFilterLevel2) {
      if (item.parentId == widget.filterItemLevel1.id) {
        listLevel2Render.add(
          GestureDetector(
            onTap: () => onTapFilterItem(listFilterSelected, item),
            child: FilterItemLevel2(
              filterItemLevel2: item,
            ),
          ),
        );
      }
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
              Obx(
                () => GridView.count(
                  primary: false,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  childAspectRatio: (102 / 34),
                  children: renderListFilterLevel2(),
                ),
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
