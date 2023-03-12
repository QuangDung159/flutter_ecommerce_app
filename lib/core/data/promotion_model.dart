class PromotionModel {
  final String id;
  final int quantity;
  final double maxDiscount;
  final double discountValue;
  final double subTotalMin;
  final String desc;
  final String title;
  final String promoType;
  final String code;
  final String startDate;
  final String endDate;

  PromotionModel({
    required this.id,
    required this.quantity,
    required this.code,
    required this.maxDiscount,
    required this.desc,
    required this.discountValue,
    required this.endDate,
    required this.startDate,
    required this.subTotalMin,
    required this.title,
    required this.promoType,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    {
      return PromotionModel(
        id: json['_id'],
        quantity: json['quantity'],
        maxDiscount: json['max_discount'].toDouble(),
        desc: json['description'],
        discountValue: json['discount_value'].toDouble(),
        code: json['code'],
        endDate: json['end_date'],
        startDate: json['start_date'],
        subTotalMin: json['sub_total_min'].toDouble(),
        title: json['title'],
        promoType: json['promo_type'],
      );
    }
  }
}
