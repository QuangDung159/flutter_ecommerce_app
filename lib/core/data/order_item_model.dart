import 'package:flutter_ecommerce_app/core/data/product_model.dart';

class OrderItemModel {
  final String id;
  final int quantity;
  final String price;
  final ProductModel product;

  OrderItemModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.product,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    {
      return OrderItemModel(
        id: json['_id'],
        quantity: json['quantity'],
        price: json['price']?.toString() ?? '100',
        product: ProductModel.fromJson(json['product_id']),
      );
    }
  }
}
