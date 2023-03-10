// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/product_detail_screen.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:get/get.dart';

class ProductItemHorizontal extends StatelessWidget {
  const ProductItemHorizontal({
    Key? key,
    required this.productItem,
    this.width,
  }) : super(key: key);

  final double? width;

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    bool hasOriginalPrice = productItem.originalPrice != '';
    return GestureDetector(
      onTap: () => Get.to(
        () => ProductDetailScreen(
          product: productItem,
        ),
        preventDuplicates: false,
      ),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(productItem.thumbnail),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              productItem.name,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                if (hasOriginalPrice)
                  Text(
                    '${formatPrice(productItem.originalPrice)} ',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                Text(
                  formatPrice(productItem.price),
                  style: TextStyle(
                    color: hasOriginalPrice ? AppColors.primary : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
