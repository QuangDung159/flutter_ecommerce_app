// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/product_detail_screen.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:get/get.dart';

class ProductItemVertical extends StatelessWidget {
  const ProductItemVertical({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    bool hasOriginalPrice = product.originalPrice != '';

    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      margin: EdgeInsets.only(
        bottom: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              product.thumbnail,
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => ProductDetailScreen(
                    product: product,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      if (hasOriginalPrice)
                        Text(
                          '${formatPrice(product.originalPrice)} ',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Text(
                        formatPrice(product.price),
                        style: TextStyle(
                          color: hasOriginalPrice
                              ? AppColors.primary
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () {
              CartServices.addCart(
                product: product,
                quantity: 1,
              );
            },
            child: Icon(
              Icons.add_shopping_cart_outlined,
              color: AppColors.primary,
            ),
          )
        ],
      ),
    );
  }
}