// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/cart_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/main_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/product_detail_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/voucher_screen.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:flutter_share/flutter_share.dart';
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

int getIdFromUrl(String? payloadUrl) {
  if (payloadUrl != null) {
    List<String> listSegment = payloadUrl.split('/');

    if (listSegment.length >= 3) {
      return int.parse(listSegment[2]);
    }
  }

  return -1;
}

String getReferCodeFromUrl(String? payloadUrl) {
  if (payloadUrl != null) {
    List<String> listSegment = payloadUrl.split('/');

    if (listSegment.length >= 3) {
      return listSegment[2];
    }
  }

  return '';
}

String getScreenFromUrl(String? payloadUrl) {
  if (payloadUrl != null) {
    List<String> listSegment = payloadUrl.split('/');
    if (listSegment.length >= 2) {
      return listSegment[1];
    }
  }
  return '';
}

Widget? getScreen(
  String? screenName, {
  String? payload,
}) {
  GetxAppController getx = Get.find<GetxAppController>();

  switch (screenName) {
    case 'voucher_screen':
      return VoucherScreen();
    case 'cart_screen':
      return CartScreen();
    case 'product_detail_screen':
      int id = getIdFromUrl(payload);

      ProductModel? product = CartServices.getProductById(id);
      if (product == null) {
        return null;
      }

      return ProductDetailScreen(
        product: product,
      );
    case 'profile_screen':
      String referCode = getReferCodeFromUrl(payload);
      if (referCode == '') {}
      // showSnackBar(content: referCode, title: 'Using refer code success');
      getx.setReferCodeReceived(referCode);
      return MainScreen();
    default:
      return null;
  }
}

void navigationByUrl(String? payload) {
  String screenName = getScreenFromUrl(payload);
  Widget? screen = getScreen(
    screenName,
    payload: payload,
  );

  if (screen == null) {
    showSnackBar(content: 'No screen has been navigator!');
  } else {
    Get.to(() => screen);
  }
}

Future<void> share({
  required String text,
  required String title,
  required String linkUrl,
}) async {
  await FlutterShare.share(
    title: title,
    text: text,
    linkUrl: linkUrl,
  );
}

  // Future<void> shareFile() async {
  //   List<dynamic> docs = await DocumentsPicker.pickDocuments;
  //   if (docs == null || docs.isEmpty) return null;

  //   await FlutterShare.shareFile(
  //     title: 'Example share',
  //     text: 'Example share text',
  //     filePath: docs[0] as String,
  //   );
  // }
