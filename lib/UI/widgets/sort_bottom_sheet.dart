// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/sort_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:get/get.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  GetxAppController getxAppController = Get.find<GetxAppController>();

  List<Widget> renderListSortItem() {
    SortItemModel sortSelected = getxAppController.sortSelected.value;
    List<Widget> listSortItemRender = [];
    for (var i = 0; i < listSortDummy.length; i++) {
      listSortItemRender.add(
        GestureDetector(
          onTap: () {
            getxAppController.setData(sortSelected: listSortDummy[i]);
          },
          child: ShortItem(
            sortItemModel: listSortDummy[i],
            isChecked: sortSelected.value == listSortDummy[i].value,
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
          child: Obx(
            () => Column(
              children: renderListSortItem(),
            ),
          ),
        ),
        SizedBox(
          height: 36,
        ),
      ],
    );
  }
}
