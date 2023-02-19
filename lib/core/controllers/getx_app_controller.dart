import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/data/address_model.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/payment_method_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';
import 'package:get/get.dart';

class GetxAppController extends GetxController {
  final sortSelectedValue = RxString('recommended');

  final Rx<SortItemModel> sortSelected = listSortDummy[0].obs;

  final RxList listFilterLevel1 = [].obs;

  final RxList listFilterLevel2 = [].obs;

  final RxList listFilterSelected = [].obs;

  final RxList listCartItem = [].obs;

  final Rx<ShippingPolicyModel> shippingPolicySelected =
      listShippingPolicyDummy[0].obs;

  final promotionSelected = Rxn<PromotionUserModel>();

  final paymentMethodSelected =
      Rx<PaymentMethodModel>(listPaymentMethodDummy[0]);

  final addressSelected = Rxn<AddressModel>();

  final citySelected = Rx<CityModel>(listCityDummy[0]);

  final districtSelected = Rx<DistrictModel>(listCityDummy[0].listDistrict![0]);

  final wardSelected = Rx<WardModel>(
    listCityDummy[0].listDistrict![0].listWard![0],
  );

  final listAddress = RxList<AddressModel>([]);

  void setData({
    String? sortSelectedValue,
    SortItemModel? sortSelected,
    List<FilterItemModel>? listFilterLevel1,
    List<FilterItemModel>? listFilterLevel2,
    List<int>? listFilterSelected,
    List<CartItemModel>? listCartItem,
    ShippingPolicyModel? shippingPolicySelected,
    PaymentMethodModel? paymentMethodSelected,
    CityModel? citySelected,
    DistrictModel? districtSelected,
    WardModel? wardSelected,
    List<AddressModel>? listAddress,
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

    if (paymentMethodSelected != null) {
      this.paymentMethodSelected.value = paymentMethodSelected;
    }

    if (citySelected != null) {
      this.citySelected.value = citySelected;
    }

    if (districtSelected != null) {
      this.districtSelected.value = districtSelected;
    }

    if (wardSelected != null) {
      this.wardSelected.value = wardSelected;
    }

    if (listAddress != null) {
      this.listAddress.value = listAddress;
    }
  }

// accept null
  void setPromotionSelected(PromotionUserModel? promotionSelected) {
    this.promotionSelected.value = promotionSelected;
  }

  // accept null
  void setAddressSelected(AddressModel? addressSelected) {
    this.addressSelected.value = addressSelected;
  }
}
