class PromotionModel {
  final int id, qty;
  final int? qtyPerUser;
  final bool isClaimed, isValid;
  final String code, discountType, endDate, sourceType, startDate, title, value;
  final String? maxDiscount;
  final String? desc;

  PromotionModel({
    required this.id,
    required this.qty,
    this.qtyPerUser,
    required this.isClaimed,
    required this.isValid,
    required this.code,
    required this.discountType,
    required this.endDate,
    required this.sourceType,
    required this.startDate,
    required this.title,
    required this.value,
    this.maxDiscount,
    this.desc,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    {
      return PromotionModel(
        id: json['id'],
        qty: json['qty'],
        isClaimed: json['is_claimed'],
        isValid: json['is_valid'],
        code: json['code'],
        discountType: json['discount_type'],
        endDate: json['end_date'],
        sourceType: json['source_type'],
        startDate: json['start_date'],
        title: json['title'],
        value: json['value'],
        qtyPerUser: json['qty_per_user'],
        maxDiscount: json['max_discount'],
        desc: json['desc'],
      );
    }
  }
}
