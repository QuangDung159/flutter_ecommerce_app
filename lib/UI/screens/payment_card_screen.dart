// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/payment_card_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:get/get.dart';

class PaymentCardScreen extends StatefulWidget {
  const PaymentCardScreen({super.key});

  @override
  State<PaymentCardScreen> createState() => _PaymentCardScreenState();
}

class _PaymentCardScreenState extends State<PaymentCardScreen> {
  GetxAppController getxApp = Get.find<GetxAppController>();
  double total = CartServices.calTotal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).padding.top,
            ),
            MyAppBar(
              hasBackButton: true,
              title: 'Payment card',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    renderPaymentSection(),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                left: AppDimension.contentPadding,
                right: AppDimension.contentPadding,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimension.contentPadding,
                  ),
                  LoadingButtonWidget(
                    label: 'Add payment card',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderPaymentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            PaymentCardItem(),
          ],
        ),
      ],
    );
  }
}
