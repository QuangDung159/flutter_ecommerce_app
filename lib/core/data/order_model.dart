import 'package:flutter_ecommerce_app/core/data/order_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/payment_transaction.dart';

class OrderModel {
  final int id;
  final String subTotalAmount;
  final String totalAmount;
  final String createdAt;
  final String promotionAmount;
  final List<OrderItemModel> orderItems;
  final PaymentTransaction paymentTransaction;
  final String? description;
  final String? promotionCode;
  final String? deliveryAt;

  OrderModel({
    required this.id,
    required this.subTotalAmount,
    required this.totalAmount,
    required this.createdAt,
    required this.promotionAmount,
    required this.orderItems,
    required this.paymentTransaction,
    this.description,
    this.promotionCode,
    this.deliveryAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    {
      return OrderModel(
        id: json['id'],
        subTotalAmount: json['sub_total_amount'],
        totalAmount: json['total_amount'],
        createdAt: json['created_at'],
        promotionAmount: json['promotion_amount'],
        orderItems: List<dynamic>.from(json['order_items'])
            .map(
              (e) => OrderItemModel.fromJson(e),
            )
            .toList(),
        paymentTransaction: PaymentTransaction.fromJson(
          json['last_payment_transaction'],
        ),
        description: json['description'],
        promotionCode: json['promotion_code'],
        deliveryAt: json['delivery_at'],
      );
    }
  }
}
