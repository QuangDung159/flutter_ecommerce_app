import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_level_1_model.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_level_2_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:get/get.dart';

class SortFilterServices {
  static GetxAppController getxAppController = Get.find<GetxAppController>();
  static String uri = '$baseUrl/filter';

  static List<FilterItemLevel1Model> getListFilterFromRes(res) {
    try {
      Iterable listJson = jsonDecode(res.body)['data']['listFilter'];

      List<FilterItemLevel1Model> listFilter = List<FilterItemLevel1Model>.from(
        listJson.map(
          (e) => FilterItemLevel1Model.fromJson(e),
        ),
      );

      return listFilter;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<FilterItemLevel1Model>> fetchListFilter() async {
    try {
      final res = await httpGet(uri: uri);

      if (isRequestSuccess(res)) {
        List<FilterItemLevel1Model> listFilter = getListFilterFromRes(res);
        getxAppController.setData(listFilterItemLevel1: listFilter);

        return listFilter;
      }

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  static bool isFilterSelected(
    List listFilterSelected,
    FilterItemLevel2Model filterItem,
  ) {
    bool isSelected = false;
    for (var item in listFilterSelected) {
      if (item == filterItem.id) {
        isSelected = true;
        break;
      }
    }
    return isSelected;
  }
}
