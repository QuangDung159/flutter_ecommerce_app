// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/card_form_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/cart_screen.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/services/profile_services.dart';
import 'package:get/get.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  int cartItemCount = 900;
  Widget renderNumberCartItem(int numberCartItem) {
    double fontSize = 10;
    if (numberCartItem > 99) {
      fontSize = 7;
    }

    return Text(
      numberCartItem > 99 ? '99+' : numberCartItem.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: widget.color ?? AppColors.blackPrimary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    GetxAppController getxAppController = Get.find<GetxAppController>();

    return GestureDetector(
      onTap: () {
        if (getxAppController.userLogged.value == null) {
          ProfileService.showSigninBottomSheet(
            context,
            onSignInSuccess: () {
              Navigator.pop(context);
              Get.to(() => CartScreen());
            },
          );
        } else {
          Get.to(() => CardFormScreen());
        }
      },
      child: Stack(
        children: [
          Image.asset(
            AssetHelper.iconCartBag,
            width: 26,
            height: 26,
            color: widget.color ?? AppColors.blackPrimary,
          ),
          Positioned(
            bottom: 2.5,
            left: 0,
            right: 0,
            child: SizedBox(
              width: 18,
              height: 18,
              child: Obx(
                () => Center(
                  child: renderNumberCartItem(
                      getxAppController.listCartItem.length),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
