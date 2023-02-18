import 'package:flutter_ecommerce_app/core/data/promotion_model.dart';

class PromotionUserModel {
  final int id;
  final String? redeemAt;
  final PromotionModel promotion;

  PromotionUserModel({
    required this.id,
    this.redeemAt,
    required this.promotion,
  });

  factory PromotionUserModel.fromJson(Map<String, dynamic> json) {
    {
      return PromotionUserModel(
        id: json['id'],
        promotion: PromotionModel.fromJson(
          json['promotion'],
        ),
      );
    }
  }
}
