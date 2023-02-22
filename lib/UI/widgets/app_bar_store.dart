// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/search_product_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_icon.dart';
import 'package:get/get.dart';

class AppBarStore extends StatelessWidget {
  const AppBarStore({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26),
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => SearchProductScreen());
            },
            child: Icon(
              Icons.search,
              size: 24,
            ),
          ),
          Text(
            title ?? 'Store',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CartIcon(),
        ],
      ),
    );
  }
}
