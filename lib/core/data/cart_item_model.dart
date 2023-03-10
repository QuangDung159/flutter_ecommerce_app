import 'package:flutter_ecommerce_app/core/data/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel product;
  final int quantity;
  final dynamic variant;

  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
    this.variant,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    {
      return CartItemModel(
        id: json['_id'],
        product: ProductModel.fromJson(json['product_id']),
        quantity: json['quantity'],
      );
    }
  }
}
