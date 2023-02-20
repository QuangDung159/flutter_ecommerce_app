import 'package:flutter_ecommerce_app/core/data/product_model.dart';

class OrderItemModel {
  final int id;
  final int quantity;
  final String price;
  final ProductModel product;
  final dynamic variant;

  OrderItemModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.product,
    this.variant,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    {
      return OrderItemModel(
        id: json['id'],
        quantity: json['quantity'],
        price: json['price'],
        product: ProductModel.fromJson(json['product']),
        variant: json['variant'],
      );
    }
  }
}
