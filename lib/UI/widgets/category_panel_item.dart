// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/list_product_screen.dart';
import 'package:get/get.dart';

class CategoryPanelItem extends StatefulWidget {
  const CategoryPanelItem({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  final String title;
  final String imagePath;

  @override
  State<CategoryPanelItem> createState() => _CategoryPanelItemState();
}

class _CategoryPanelItemState extends State<CategoryPanelItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => ListProductScreen(
          title: widget.title,
          category: widget.title,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
