// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:get/get.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    Key? key,
    this.action, required this.title,
  }) : super(key: key);

  final Widget? action;
  final String title;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.amber,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.border,
          ),
        ),
      ),
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.chevron_left_outlined,
                  size: 32,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: widget.action,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderNumberCartItem(int numberCartItem) {
    double fontSize = 10;
    if (numberCartItem > 99) {
      fontSize = 7.5;
    }

    return Text(
      numberCartItem > 99 ? '99+' : numberCartItem.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
