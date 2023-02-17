// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

String formatPrice(String price) {
  return '\$${double.parse(price)}';
}

void showSnackBar(
    {required String title, required String content, bool? isSuccess}) {
  Get.snackbar(
    title,
    content,
    duration: Duration(seconds: 2),
    backgroundColor: Colors.white,
    borderColor: isSuccess ?? true ? Colors.green : Colors.red,
    borderWidth: 1,
  );
}
