import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:get/get.dart';

class GetxAppController extends GetxController {
  final RxString sortSelectedValue = 'recommended'.obs;
  final Rx<SortItemModel> sortSelected = listSortDummy[0].obs;
  final RxList listFilterLevel1 = [].obs;
  final RxList listFilterLevel2 = [].obs;
  final RxList listFilterSelected = [].obs;
  final RxList listCartItem = [].obs;
  final Rx<ShippingPolicyModel> shippingPolicySelected =
      listShippingPolicyDummy[0].obs;
  final Rx<PromotionUserModel?> promotionSelected = null.obs;

  void setData({
    String? sortSelectedValue,
    SortItemModel? sortSelected,
    List<FilterItemModel>? listFilterLevel1,
    List<FilterItemModel>? listFilterLevel2,
    List<int>? listFilterSelected,
    List<CartItemModel>? listCartItem,
    ShippingPolicyModel? shippingPolicySelected,
    PromotionUserModel? promotionSelected,
  }) {
    if (sortSelectedValue != null) {
      this.sortSelectedValue.value = sortSelectedValue;
    }

    if (sortSelected != null) {
      this.sortSelected.value = sortSelected;
    }

    if (listFilterLevel1 != null) {
      this.listFilterLevel1.value = listFilterLevel1;
    }

    if (listFilterLevel2 != null) {
      this.listFilterLevel2.value = listFilterLevel2;
    }

    if (listFilterSelected != null) {
      this.listFilterSelected.value = listFilterSelected;
    }

    if (listCartItem != null) {
      this.listCartItem.value = listCartItem;
    }

    if (shippingPolicySelected != null) {
      this.shippingPolicySelected.value = shippingPolicySelected;
    }
  }

  void setPromotionSelected (PromotionUserModel? promotionSelected) {
    this.promotionSelected.value = promotionSelected;
  }
}
