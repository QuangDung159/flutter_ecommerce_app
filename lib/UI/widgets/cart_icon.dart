// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

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
  int cartItemCount = 100;
  Widget renderNumberCartItem(int numberCartItem) {
    double fontSize = 10;
    if (numberCartItem > 99) {
      fontSize = 6;
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
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Image.asset(
            AssetHelper.iconCartBag,
            width: 20,
            height: 20,
            color: widget.color ?? AppColors.blackPrimary,
          ),
          Positioned(
            bottom: 2.5,
            left: 1,
            right: 0,
            child: SizedBox(
              width: 12,
              height: 12,
              child: Center(
                child: renderNumberCartItem(cartItemCount),
              ),
            ),
          )
        ],
      ),
    );
  }
}
