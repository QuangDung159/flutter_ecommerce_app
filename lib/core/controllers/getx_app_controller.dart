import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:get/get.dart';

class GetxAppController extends GetxController {
  final RxString sortSelectedValue = 'recommended'.obs;
  final Rx<SortItemModel> sortSelected = listSortDummy[0].obs;

  void setData({
    String? sortSelectedValue,
    SortItemModel? sortSelected,
  }) {
    if (sortSelectedValue != null) {
      this.sortSelectedValue.value = sortSelectedValue;
    }

    if (sortSelected != null) {
      this.sortSelected.value = sortSelected;
    }
  }
}
