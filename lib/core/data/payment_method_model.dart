class PaymentMethodModel {
  final int id;
  final String title, type;
  final String? stripeClientKey;

  PaymentMethodModel({
    required this.id,
    required this.title,
    required this.type,
    this.stripeClientKey,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type,
        'stripeClientKey': stripeClientKey,
      };

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    {
      return PaymentMethodModel(
        id: json['id'],
        title: json['title'],
        type: json['type'],
        stripeClientKey: json['stripeClientKey'],
      );
    }
  }
}
