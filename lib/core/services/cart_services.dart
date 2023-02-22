// ignore_for_file: prefer_const_constructors

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/address_model.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartServices {
  static GetxAppController getxAppController = Get.find<GetxAppController>();
  static List listCart = getxAppController.listCartItem;
  static List<CartItemModel> listCartItemCheckout =
      getxAppController.listCartItemCheckout;
  static GetStorage localStorage = GetStorage();

  static addCart({
    required ProductModel product,
    required int quantity,
    bool? isShowSnackBar,
  }) {
    int theSameItemId =
        listCart.indexWhere((element) => element.product.id == product.id);

    if (theSameItemId != -1) {
      listCart.replaceRange(
        theSameItemId,
        theSameItemId + 1,
        [
          CartItemModel(
            id: product.id,
            product: product,
            quantity: listCart[theSameItemId].quantity + quantity,
          ),
        ],
      );
    } else {
      listCart.add(
        CartItemModel(id: product.id, product: product, quantity: quantity),
      );
    }

    if (isShowSnackBar ?? true) {
      showSnackBar(
        title: 'Add to cart success',
        content: product.name,
      );
    }
  }

  static int findCartInList(
      List<CartItemModel> listCart, CartItemModel cartItem) {
    return listCart.indexWhere(
      (element) => cartItem.id == element.id,
    );
  }

  static updateCartCheckout({
    required CartItemModel cartItem,
  }) {
    int index = findCartInList(listCartItemCheckout, cartItem);

    if (index == -1) {
      listCartItemCheckout.add(cartItem);
    } else {
      listCartItemCheckout.removeAt(index);
    }
  }

  static removeCart({
    required ProductModel product,
    required int quantity,
    bool? isShowSnackBar,
    bool? removeAll,
  }) {
    int theSameItemId =
        listCart.indexWhere((element) => element.product.id == product.id);

    if (theSameItemId != -1) {
      if (removeAll ?? false) {
        listCart.removeAt(theSameItemId);
      } else {
        listCart.replaceRange(
          theSameItemId,
          theSameItemId + 1,
          [
            CartItemModel(
              id: product.id,
              product: product,
              quantity: listCart[theSameItemId].quantity - 1,
            ),
          ],
        );
      }
    }

    if (isShowSnackBar ?? true) {
      showSnackBar(
        title: 'Remove product success',
        content: product.name,
      );
    }
  }

  static double calSubtotal(List list) {
    double subtotal = 0;
    for (var item in list.cast<CartItemModel>()) {
      subtotal += double.parse(item.product.price) * item.quantity;
    }
    return subtotal;
  }

  static double calTotal() {
    ShippingPolicyModel shippingSelected =
        getxAppController.shippingPolicySelected.value;

    PromotionUserModel? promotionSelected =
        getxAppController.promotionSelected.value;

    bool hasSelectedPromotion = promotionSelected != null;

    double discount = hasSelectedPromotion
        ? double.parse(promotionSelected.promotion.value)
        : 0.0;
    double subtotal = CartServices.calSubtotal(listCartItemCheckout);
    double total = subtotal + double.parse(shippingSelected.fee) - discount;

    return total;
  }

  static String getFullAddress(AddressModel? addressModel) {
    if (addressModel == null) {
      return '';
    }

    String fullAddress =
        '${addressModel.addressLine}, ${addressModel.ward.name}, ${addressModel.district.name}, ${addressModel.city.name}';

    return fullAddress;
  }

  static ProductModel? getProductById(int id) {
    int index = listProductDummy.indexWhere(
      (item) => item.id == id,
    );

    if (index == -1) {
      return null;
    }

    return listProductDummy[index];
  }

  static void removeItemCheckout() {
    for (var i = 0; i < listCartItemCheckout.length; i++) {
      CartServices.removeCart(
        product: listCartItemCheckout[i].product,
        quantity: listCartItemCheckout[i].quantity,
        removeAll: true,
        isShowSnackBar: false,
      );
    }

    getxAppController.setData(listCartItemCheckout: []);
  }
}
