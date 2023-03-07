// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/address_model.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartServices {
  static GetxAppController getxAppController = Get.find<GetxAppController>();
  static List listCart = getxAppController.listCartItem;
  static List<CartItemModel> listCartItemCheckout =
      getxAppController.listCartItemCheckout;
  static GetStorage localStorage = GetStorage();
  static String uri = '$baseUrl/cartItem';

  static List<CartItemModel> getListCartFromRes(res) {
    if (isRequestSuccess(res)) {
      Iterable list = jsonDecode(res.body)['data']['listCartItem'];

      List<CartItemModel> listCart = List<CartItemModel>.from(
        list.map(
          (e) => CartItemModel.fromJson(e),
        ),
      );

      getxAppController.setData(listCartItem: listCart);

      return listCart;
    }
    return [];
  }

  static Future<List<CartItemModel>> fetchListCart() async {
    try {
      final res = await httpGet(
        uri: '$baseUrl/cartItem/${getxAppController.userLogged.value!.id}',
      );

      return getListCartFromRes(res);
    } catch (e) {
      throw Exception(e);
    }
  }

  static void addToCart({
    required ProductModel product,
    required int quantity,
    bool? isShowSnackBar,
  }) async {
    try {
      int theSameItemIndex =
          listCart.indexWhere((element) => element.product.id == product.id);

      dynamic res;

      if (theSameItemIndex != -1) {
        Map<String, dynamic> reqBody = {
          'quantity': listCart[theSameItemIndex].quantity + quantity,
        };

        res = await httpPut(
          uri:
              '$baseUrl/cartItem/${getxAppController.userLogged.value!.id}/${listCart[theSameItemIndex].id}',
          reqBody: reqBody,
        );

        if (!isRequestSuccess(res)) {
          showSnackBar(
            content: 'Something went wrong!',
            isSuccess: false,
          );
          return;
        }
      } else {
        Map<String, dynamic> reqBody = {
          'product_id': product.id,
          'user_id': getxAppController.userLogged.value!.id,
          'quantity': quantity,
        };

        res = await httpPost(uri: '$baseUrl/cartItem', reqBody: reqBody);

        if (!isRequestSuccess(res)) {
          showSnackBar(
            content: 'Something went wrong!',
            isSuccess: false,
          );
          return;
        }
      }

      // fetchListCart();

      List<CartItemModel> listCarItem = getListCartFromRes(res);
      getxAppController.setData(listCartItem: listCarItem);

      if (isShowSnackBar ?? true) {
        showSnackBar(
          title: 'Add to cart success',
          content: product.name,
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static int findCartInList(
      List<CartItemModel> listCart, CartItemModel cartItem) {
    return listCart.indexWhere(
      (element) => cartItem.id == element.id,
    );
  }

  static updateQuantityCartCheckout(CartItemModel cartItem, int quantity) {
    int index = findCartInList(listCartItemCheckout, cartItem);

    if (index == -1) {
      return;
    }

    CartItemModel cartItemToUpdate = CartItemModel(
      id: cartItem.product.id,
      product: cartItem.product,
      quantity: quantity,
    );

    listCartItemCheckout.replaceRange(
      index,
      index + 1,
      [cartItemToUpdate],
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

  static void decreaseCartItemQuantity({
    required ProductModel product,
    required int quantity,
    bool? isShowSnackBar,
  }) async {
    int theSameItemIndex =
        listCart.indexWhere((element) => element.product.id == product.id);

    if (theSameItemIndex != -1) {
      Map<String, dynamic> reqBody = {
        'quantity': listCart[theSameItemIndex].quantity - quantity,
      };

      final res = await httpPut(
        uri:
            '$baseUrl/cartItem/${getxAppController.userLogged.value!.id}/${listCart[theSameItemIndex].id}',
        reqBody: reqBody,
      );

      if (!isRequestSuccess(res)) {
        showSnackBar(
          content: 'Something went wrong!',
          isSuccess: false,
        );
        return;
      }

      List<CartItemModel> listCarItem = getListCartFromRes(res);
      getxAppController.setData(listCartItem: listCarItem);

      if (isShowSnackBar ?? true) {
        showSnackBar(
          title: 'Remove product success',
          content: product.name,
        );
      }
    }
  }

  static void removeCartItem({
    required CartItemModel cartItem,
    bool? isShowSnackBar,
  }) async {
    final res = await httpDelete(
      uri: '$uri/${getxAppController.userLogged.value!.id}/${cartItem.id}',
    );

    List<CartItemModel> listCarItem = getListCartFromRes(res);
    getxAppController.setData(listCartItem: listCarItem);

    if (isShowSnackBar ?? true) {
      showSnackBar(
        title: 'Remove product success',
        content: cartItem.product.name,
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

  static ProductModel? getProductById(String id) {
    int index = listProductDummy.indexWhere(
      (item) => item.id == id,
    );

    if (index == -1) {
      return null;
    }

    return listProductDummy[index];
  }

  static void selectAllCartItem({
    required bool isDeselect,
  }) {
    getxAppController.setData(listCartItemCheckout: []);

    if (!isDeselect) {
      for (var i = 0; i < listCart.length; i++) {
        listCartItemCheckout.add(listCart[i]);
      }
    }
  }
}
