// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/main_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_total_section.dart';
import 'package:flutter_ecommerce_app/UI/widgets/payment_method_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/payment_card_model.dart';
import 'package:flutter_ecommerce_app/core/data/payment_method_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:flutter_ecommerce_app/core/services/payment_service.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();
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
              title: 'Checkout',
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
            CartTotalSection(
              buttonTitle: 'Checkout',
              onTapButton: onCheckout,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onCheckout() async {
    try {
      PaymentMethodModel paymentMethodSelected =
          getxAppController.paymentMethodSelected.value;
      PaymentCardModel? paymentCardDefault =
          getxAppController.paymentCardDefault.value;

      if (paymentMethodSelected.type == 'payment_card') {
        if (paymentCardDefault == null) {
          showSnackBar(
            content: 'Please choose payment card',
            isSuccess: false,
          );
          return;
        }

        await PaymentService.handlePayment(
          cardNumber: paymentCardDefault.cardNumber,
          cvvCode: paymentCardDefault.cvvCode,
          onPaymentSuccess: () {
            onCheckoutSuccess();
          },
          expiryDate: paymentCardDefault.expiryDate,
        );
      } else {
        onCheckoutSuccess();
      }
    } catch (e) {
      log(e.toString());
      return;
    }
  }

  void onCheckoutSuccess() {
    Get.offAll(() => MainScreen());
    CartServices.checkout();
    Future.delayed(
      Duration(milliseconds: 400),
      () => showSnackBar(
        title: 'Create order success',
        content: 'Your order has been created, thanks for your shopping!',
      ),
    );
  }

  Widget renderPaymentSection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Obx(
            () => Column(
              children: renderListPaymentMethods(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> renderListPaymentMethods() {
    List<Widget> listRender = [];
    GetxAppController getxAppController = Get.find<GetxAppController>();

    for (var item in listPaymentMethodDummy) {
      listRender.add(
        GestureDetector(
          onTap: () => getxAppController.setData(
            paymentMethodSelected: item,
          ),
          child: PaymentMethodItem(
            paymentMethodItem: item,
            isSelected:
                getxAppController.paymentMethodSelected.value.id == item.id,
          ),
        ),
      );
    }
    return listRender;
  }
}
