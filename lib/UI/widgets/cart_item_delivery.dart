// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';

class CartItemDelivery extends StatelessWidget {
  const CartItemDelivery({
    Key? key,
    required this.cartItem,
    this.isEndItem,
  }) : super(key: key);

  final CartItemModel cartItem;
  final bool? isEndItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: isEndItem ?? false ? Colors.white : AppColors.border,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  cartItem.product.thumbnail,
                  width: 60,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Black, Size S',
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text('x1'),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
