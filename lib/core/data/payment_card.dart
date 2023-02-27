class PaymentCard {
  final int id;
  final String cardType, cardNumber, clientSecret;

  PaymentCard({
    required this.id,
    required this.cardType,
    required this.cardNumber,
    required this.clientSecret,
  });

  factory PaymentCard.fromJson(Map<String, dynamic> json) {
    {
      return PaymentCard(
        id: json['id'],
        cardType: json['card_type'],
        cardNumber: json['card_number'],
        clientSecret: json['client_secret'],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'card_type': cardType,
        'card_number': cardNumber,
        'client_secret': clientSecret,
      };
}
