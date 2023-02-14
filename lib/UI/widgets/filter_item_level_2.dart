// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:get/get.dart';

class FilterItemLevel2 extends StatefulWidget {
  const FilterItemLevel2({
    Key? key,
    required this.isSelected,
    required this.filterItemLevel2,
  }) : super(key: key);

  final bool isSelected;
  final FilterItemModel filterItemLevel2;

  @override
  State<FilterItemLevel2> createState() => _FilterItemLevel2State();
}

class _FilterItemLevel2State extends State<FilterItemLevel2> {
  bool isFilterSelected(
    List listFilterSelected,
    FilterItemModel filterItem,
  ) {
    bool isSelected = false;
    for (var item in listFilterSelected) {
      if (item.id == filterItem.id) {
        isSelected = true;
        break;
      }
    }
    return isSelected;
  }

  Widget renderListFilterLevel2() {
    GetxAppController getxAppController = Get.find<GetxAppController>();

    List listFilterSelected = getxAppController.listFilterSelected;

    bool isSelected = isFilterSelected(
      listFilterSelected,
      widget.filterItemLevel2,
    );

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.yellowLight : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: isSelected ? AppColors.primary : AppColors.greyMid,
        ),
      ),
      width: 102,
      height: 24,
      child: Center(
        child: Text(
          widget.filterItemLevel2.name,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => renderListFilterLevel2(),
    );
  }
}
