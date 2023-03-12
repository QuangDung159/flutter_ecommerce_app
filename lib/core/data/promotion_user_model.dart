import 'package:flutter_ecommerce_app/core/data/promotion_model.dart';

class PromotionUserModel {
  final String id;
  final PromotionModel promotion;

  PromotionUserModel({
    required this.id,
    required this.promotion,
  });

  factory PromotionUserModel.fromJson(Map<String, dynamic> json) {
    {
      return PromotionUserModel(
        id: json['_id'],
        promotion: PromotionModel.fromJson(
          json['promo_code_id'],
        ),
      );
    }
  }
}
