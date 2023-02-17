// ignore_for_file: prefer_const_constructors

import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:get/get.dart';

class CartServices {
  static addCart({
    required ProductModel product,
    required int quantity,
    bool? isShowSnackBar,
  }) {
    GetxAppController getxAppController = Get.find<GetxAppController>();
    List listCart = getxAppController.listCartItem;

    int theSameItemId =
        listCart.indexWhere((element) => element.id == product.id);

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

  static removeCart({
    required ProductModel product,
    required int quantity,
    bool? isShowSnackBar,
    bool? removeAll,
  }) {
    GetxAppController getxAppController = Get.find<GetxAppController>();
    List listCart = getxAppController.listCartItem;

    int theSameItemId =
        listCart.indexWhere((element) => element.id == product.id);

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
}
