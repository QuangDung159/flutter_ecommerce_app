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
}
