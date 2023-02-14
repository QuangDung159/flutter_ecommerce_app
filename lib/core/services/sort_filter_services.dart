import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:get/get.dart';

class SortFilterServices {
  static GetxAppController getxAppController = Get.find<GetxAppController>();

  static void initListFilter() {
    List<FilterItemModel> listLevel1 = [];
    List<FilterItemModel> listLevel2 = [];

    for (var item in listFilterDummy) {
      if (item.parentId == null) {
        listLevel1.add(item);
      } else {
        listLevel2.add(item);
      }
    }

    getxAppController.setData(
      listFilterLevel1: listLevel1,
      listFilterLevel2: listLevel2,
    );
  }
}
