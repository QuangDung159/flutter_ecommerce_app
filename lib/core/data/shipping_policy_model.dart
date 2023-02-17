class ShippingPolicyModel {
  final String deliveryInfo,
      displayFee,
      fee,
      orderAmountFrom,
      orderAmountTo,
      orderAmountInfo;
  final bool valid;

  ShippingPolicyModel({
    required this.deliveryInfo,
    required this.displayFee,
    required this.fee,
    required this.orderAmountFrom,
    required this.orderAmountTo,
    required this.valid,
    required this.orderAmountInfo,
  });

  factory ShippingPolicyModel.fromJson(Map<String, dynamic> json) {
    {
      return ShippingPolicyModel(
        deliveryInfo: json['delivery_info'],
        displayFee: json['display_fee'],
        fee: json['fee'],
        orderAmountFrom: json['order_amount_from'],
        orderAmountTo: json['order_amount_to'],
        valid: json['valid'],
        orderAmountInfo: json['order_amount_info'],
      );
    }
  }
}
