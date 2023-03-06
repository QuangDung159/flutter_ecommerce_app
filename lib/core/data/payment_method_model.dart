class PaymentMethodModel {
  final int id;
  final String title, type;

  PaymentMethodModel({
    required this.id,
    required this.title,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type,
      };

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    {
      return PaymentMethodModel(
        id: json['id'],
        title: json['title'],
        type: json['type'],
      );
    }
  }
}
