import 'package:flutter_ecommerce_app/core/data/product_model.dart';

class CartItemModel {
  final int id;
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
        id: json['id'],
        product: json['product'],
        quantity: json['quantity'],
        variant: json['variant'],
      );
    }
  }
}
