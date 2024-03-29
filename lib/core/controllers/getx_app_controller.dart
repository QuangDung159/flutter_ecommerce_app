import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/data/address_model.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_level_1_model.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:flutter_ecommerce_app/core/data/payment_card_model.dart';
import 'package:flutter_ecommerce_app/core/data/payment_method_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:get/get.dart';

class GetxAppController extends GetxController {
  final Rx<SortItemModel> sortSelected = listSortDummy[0].obs;

  final RxList listCartItem = [].obs;

  final Rx<ShippingPolicyModel> shippingPolicySelected =
      listShippingPolicyDummy[0].obs;

  final promotionSelected = Rxn<PromotionUserModel>();

  final paymentMethodSelected =
      Rx<PaymentMethodModel>(listPaymentMethodDummy[0]);

  final addressSelected = Rxn<AddressModel>();

  final citySelected = Rx<CityModel>(listCityDummy[0]);

  final districtSelected = Rx<DistrictModel>(listCityDummy[0].listDistrict[0]);

  final wardSelected = Rx<WardModel>(
    listCityDummy[0].listDistrict[0].listWard[0],
  );

  final listAddress = RxList<AddressModel>([]);

  final referCodeReceived = RxnString();

  final listNoti = RxList<NotificationModel>([]);

  final listCartItemCheckout = RxList<CartItemModel>([]);

  final userLogged = Rxn<UserModel>(null);

  final listPaymentCard = RxList<PaymentCardModel>([]);

  final paymentCardDefault = Rxn<PaymentCardModel>(null);

  final listArrivals = RxList<ProductModel>([]);

  final listSaleItems = RxList<ProductModel>([]);

  final listRecentlyViewed = RxList<ProductModel>([]);

  final listCity = RxList<CityModel>([]);

  final countOrder = RxInt(0);

  final listPromoCode = RxList<PromotionUserModel>([]);

  final listFilterItemLevel1 = RxList<FilterItemLevel1Model>([]);

  final listFilterItemSelected = RxList<String>([]);

  final isLoading = RxBool(false);

  final referCode = RxString('');

  void setData({
    SortItemModel? sortSelected,
    List<FilterItemLevel1Model>? listFilterLevel1,
    List<FilterItemLevel1Model>? listFilterLevel2,
    List<int>? listFilterSelected,
    List<CartItemModel>? listCartItem,
    ShippingPolicyModel? shippingPolicySelected,
    PaymentMethodModel? paymentMethodSelected,
    CityModel? citySelected,
    DistrictModel? districtSelected,
    WardModel? wardSelected,
    List<AddressModel>? listAddress,
    List<NotificationModel>? listNoti,
    List<CartItemModel>? listCartItemCheckout,
    List<PaymentCardModel>? listPaymentCard,
    List<ProductModel>? listArrivals,
    List<ProductModel>? listSaleItems,
    List<ProductModel>? listRecentlyViewed,
    List<CityModel>? listCity,
    int? countOrder,
    List<PromotionUserModel>? listPromoCode,
    List<FilterItemLevel1Model>? listFilterItemLevel1,
    List<String>? listFilterItemSelected,
    bool? isLoading,
    String? referCode,
  }) {
    if (sortSelected != null) {
      this.sortSelected.value = sortSelected;
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

    if (listNoti != null) {
      this.listNoti.value = listNoti;
    }

    if (listCartItemCheckout != null) {
      this.listCartItemCheckout.value = listCartItemCheckout;
    }

    if (listPaymentCard != null) {
      this.listPaymentCard.value = listPaymentCard;
    }

    if (listArrivals != null) {
      this.listArrivals.value = listArrivals;
    }

    if (listSaleItems != null) {
      this.listSaleItems.value = listSaleItems;
    }

    if (listRecentlyViewed != null) {
      this.listRecentlyViewed.value = listRecentlyViewed;
    }

    if (listCity != null) {
      this.listCity.value = listCity;
    }

    if (countOrder != null) {
      this.countOrder.value = countOrder;
    }

    if (listPromoCode != null) {
      this.listPromoCode.value = listPromoCode;
    }

    if (listFilterItemLevel1 != null) {
      this.listFilterItemLevel1.value = listFilterItemLevel1;
    }

    if (listFilterItemSelected != null) {
      this.listFilterItemSelected.value = listFilterItemSelected;
    }

    if (isLoading != null) {
      this.isLoading.value = isLoading;
    }

    if (referCode != null) {
      this.referCode.value = referCode;
    }
  }

  // allow null
  void setPromotionSelected(PromotionUserModel? promotionSelected) {
    this.promotionSelected.value = promotionSelected;
  }

  // allow null
  void setAddressSelected(AddressModel? addressSelected) {
    LocalStorageHelper.setValue('ADDRESS_DEFAULT_ID', addressSelected?.id);
    this.addressSelected.value = addressSelected;
  }

  void setReferCodeReceived(String? referCodeReceived) {
    this.referCodeReceived.value = referCodeReceived;
  }

  void setUserLogged(UserModel? userLogged) {
    this.userLogged.value = userLogged;
  }

  void setPaymentCardDefault(PaymentCardModel? paymentCardDefault) {
    this.paymentCardDefault.value = paymentCardDefault;
  }
}
