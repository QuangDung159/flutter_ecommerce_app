// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';

class ProductItemHorizontal extends StatelessWidget {
  const ProductItemHorizontal({
    Key? key, required this.productItem,
  }) : super(key: key);

  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
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
          ),
          Text(
            '\$${productItem.price}',
          ),
        ],
      ),
    );
  }
}
