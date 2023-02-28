// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/card_form_screen.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/payment_card_model.dart';
import 'package:flutter_ecommerce_app/core/data/payment_method_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:get/get.dart';

class PaymentMethodItem extends StatelessWidget {
  PaymentMethodItem({
    Key? key,
    this.isSelected,
    required this.paymentMethodItem,
  }) : super(key: key);

  final bool? isSelected;
  final PaymentMethodModel paymentMethodItem;

  final GetxAppController getxApp = Get.find<GetxAppController>();

  @override
  Widget build(BuildContext context) {
    bool isPaymentCard = paymentMethodItem.type == 'payment_card';

    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ?? false ? AppColors.blackPrimary : Colors.white,
          width: 1,
        ),
      ),
      child: renderPaymentMethod(isPaymentCard),
    );
  }

  Widget renderPaymentMethod(bool isPaymentCard) {
    PaymentCardModel? paymentCardDefault = getxApp.paymentCardDefault.value;
    String title = paymentCardDefault != null
        ? '${paymentCardDefault.cardType} | **** ${getLast4(paymentCardDefault.cardNumber)}'
        : paymentMethodItem.title;

    String iconName = getCardLogo(
        paymentCardDefault != null ? paymentCardDefault.cardNumber : 'unknown');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              isPaymentCard ? iconName : AssetHelper.iconMap,
              width: 24,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              isPaymentCard ? title : paymentMethodItem.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
        if (isPaymentCard)
          GestureDetector(
            onTap: () {
              Get.to(() => CardFormScreen());
            },
            child: Container(
              margin: EdgeInsets.only(top: 3),
              child: Image.asset(
                AssetHelper.iconChevronRight,
                width: 6,
              ),
            ),
          )
      ],
    );
  }
}
