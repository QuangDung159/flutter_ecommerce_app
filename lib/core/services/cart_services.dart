// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_signin_method.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/address_model.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CartServices {
  static GetxAppController getxAppController = Get.find<GetxAppController>();
  static List listCart = getxAppController.listCartItem;
  static GetStorage localStorage = GetStorage();

  static addCart({
    required ProductModel product,
    required int quantity,
    bool? isShowSnackBar,
  }) {
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
    double subtotal = CartServices.calSubtotal(listCart);
    double total = subtotal + double.parse(shippingSelected.fee) - discount;

    return total;
  }

  static String getFullAddress(AddressModel? addressModel) {
    if (addressModel == null) {
      return 'N/a';
    }

    String fullAddress =
        '${addressModel.addressLine}, ${addressModel.ward.name}, ${addressModel.district.name}, ${addressModel.city.name}';

    return fullAddress;
  }

  static void showSigninBottomSheet(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Container(
          color: Colors.white,
          height: 220,
          child: Column(
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
                'Please sign in before add to cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.contentPadding,
                ),
                child: ListSigninMethod(
                  onSignInSuccess: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
