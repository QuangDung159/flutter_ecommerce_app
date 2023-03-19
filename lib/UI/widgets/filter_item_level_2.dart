// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_level_2_model.dart';
import 'package:flutter_ecommerce_app/core/services/sort_filter_services.dart';
import 'package:get/get.dart';

class FilterItemLevel2 extends StatefulWidget {
  const FilterItemLevel2({
    Key? key,
    required this.filterItemLevel2,
  }) : super(key: key);

  final FilterItemLevel2Model filterItemLevel2;

  @override
  State<FilterItemLevel2> createState() => _FilterItemLevel2State();
}

class _FilterItemLevel2State extends State<FilterItemLevel2> {
  Widget renderListFilterLevel2() {
    GetxAppController getxAppController = Get.find<GetxAppController>();

    List listFilterSelected = getxAppController.listFilterItemSelected;

    bool isSelected = SortFilterServices.isFilterSelected(
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
