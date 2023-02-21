// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/cart_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/main_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/voucher_screen.dart';
import 'package:get/get.dart';

String formatPrice(String price) {
  return '\$${double.parse(price)}';
}

void showSnackBar({
  String? title,
  required String content,
  bool? isSuccess,
}) {
  Get.snackbar(
    title ?? 'Flutter E-Commerce App',
    content,
    duration: Duration(seconds: 2),
    borderColor: isSuccess ?? true ? Colors.green : Colors.red,
    borderWidth: 1,
    margin: EdgeInsets.all(12),
    barBlur: 30,
  );
}

void printCustom({String? title, content}) {
  if (title != null && title != '') {
    print('$title $content');
  } else {
    print('$content');
  }
}

int getIdFromUrl(String payloadUrl) {
  List<String> listSegment = payloadUrl.split('/');

  if (listSegment.length >= 3) {
    return int.parse(listSegment[2]);
  }

  return -1;
}

String getScreenFromUrl(String payloadUrl) {
  List<String> listSegment = payloadUrl.split('/');

  if (listSegment.length >= 2) {
    return listSegment[1];
  }

  return '';
}

Widget navigationByRouterName(String? routerName) {
  switch (routerName) {
    case 'voucher_screen':
      return VoucherScreen();
    case 'cart_screen':
      return CartScreen();
    default:
      return MainScreen();
  }
}
