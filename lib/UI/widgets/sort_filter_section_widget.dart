// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/filter_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/sort_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SortFilterSectionWidget extends StatefulWidget {
  const SortFilterSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SortFilterSectionWidget> createState() =>
      _SortFilterSectionWidgetState();
}

class _SortFilterSectionWidgetState extends State<SortFilterSectionWidget> {
  GetxAppController getxAppController = Get.find<GetxAppController>();

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
                    child: SortBottomSheet(),
                  ),
                );
              },
              child: Obx(
                () => Text(
                  getxAppController.sortSelected.value.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 21,
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Get.to(() => FilterScreen()),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Image.asset(
                  AssetHelper.iconFilter,
                  width: 18,
                  height: 18,
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: getxAppController.listFilterItemSelected.isNotEmpty
                        ? Colors.red
                        : Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
