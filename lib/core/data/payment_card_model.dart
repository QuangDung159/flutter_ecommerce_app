class PaymentCardModel {
  final int id;
  final String cardType, cardNumber, clientSecret, cvvCode, expiryDate;

  PaymentCardModel({
    required this.id,
    required this.cardType,
    required this.cardNumber,
    required this.clientSecret,
    required this.cvvCode,
    required this.expiryDate,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) {
    {
      return PaymentCardModel(
        id: json['id'],
        cardType: json['card_type'],
        cardNumber: json['card_number'],
        clientSecret: json['client_secret'],
        cvvCode: json['cvv_code'],
        expiryDate: json['expiry_date'],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'card_type': cardType,
        'card_number': cardNumber,
        'client_secret': clientSecret,
        'cvv_code': cvvCode,
        'expiry_date': expiryDate,
      };
}
