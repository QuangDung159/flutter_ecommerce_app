import 'package:flutter_ecommerce_app/core/data/order_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/payment_transaction.dart';

class OrderModel {
  final String id;
  final String subTotalAmount;
  final String totalAmount;
  final String createdAt;
  final String promotionAmount;
  final List<OrderItemModel> orderItems;
  final PaymentTransaction? paymentTransaction;
  final String? description;
  final String? promotionCode;
  final String? deliveryAt;
  final String? shippingFee;
  final String paymentType;
  final String paymentCardLast4;
  final String paymentCardType;

  OrderModel({
    required this.id,
    required this.subTotalAmount,
    required this.totalAmount,
    required this.createdAt,
    required this.promotionAmount,
    required this.orderItems,
    this.paymentTransaction,
    this.description,
    this.promotionCode,
    this.deliveryAt,
    this.shippingFee,
    required this.paymentCardLast4,
    required this.paymentCardType,
    required this.paymentType,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    {
      return OrderModel(
        id: json['id'],
        subTotalAmount: json['sub_total']?.toString() ?? '0',
        totalAmount: json['total']?.toString() ?? '0',
        createdAt: json['createdAt'],
        promotionAmount: json['promotion_amount']?.toString() ?? '0',
        orderItems: List<dynamic>.from(json['list_order_item'])
            .map(
              (e) => OrderItemModel.fromJson(e),
            )
            .toList(),
        paymentTransaction: PaymentTransaction(
          id: 1,
          amountRequest: '1',
          amountCaptured: '1',
          cardLast4: '1',
          cardBrand: '1',
          description: '1',
          userId: 1,
          createdAt: '',
          updatedAt: '',
          sourceableType: 'sourceableType',
          sourceableId: 1,
        ),
        description: json['description'],
        promotionCode: json['promotion_code'],
        deliveryAt: json['delivery_at'],
        shippingFee: json['shipping_fee']?.toString() ?? '0',
        paymentCardLast4: json['payment_card_last_4'],
        paymentCardType: json['payment_card_type'],
        paymentType: json['payment_type'],
      );
    }
  }
}
