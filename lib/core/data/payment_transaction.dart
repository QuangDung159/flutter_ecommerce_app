class PaymentTransaction {
  final String id;
  final String amountRequest;
  final String amountCaptured;
  final String cardLast4;
  final String cardBrand;
  final String description;
  final int userId;
  final String createdAt;
  final String updatedAt;
  final String sourceableType;
  final int sourceableId;

  PaymentTransaction({
    required this.id,
    required this.amountRequest,
    required this.amountCaptured,
    required this.cardLast4,
    required this.cardBrand,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.sourceableType,
    required this.sourceableId,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) {
    {
      return PaymentTransaction(
        id: json['id'],
        amountRequest: json['amount_request'],
        amountCaptured: json['amount_capture'],
        cardLast4: json['card_last_4'],
        cardBrand: json['card_brand'],
        description: json['description'],
        userId: json['user_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        sourceableType: json['sourceable_type'],
        sourceableId: json['sourceable_id'],
      );
    }
  }
}
