// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/card_form_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/payment_card_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/payment_card_model.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:flutter_ecommerce_app/core/services/payment_service.dart';
import 'package:get/get.dart';

class PaymentCardScreen extends StatefulWidget {
  const PaymentCardScreen({super.key});

  @override
  State<PaymentCardScreen> createState() => _PaymentCardScreenState();
}

class _PaymentCardScreenState extends State<PaymentCardScreen> {
  @override
  void initState() {
    super.initState();

    PaymentService.fetchListPaymentCard();
  }
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
                    onTap: () {
                      Get.to(() => CardFormScreen());
                    },
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
        Obx(
          () => Column(
            children: renderListPaymentCard(),
          ),
        ),
      ],
    );
  }

  List<Widget> renderListPaymentCard() {
    List<Widget> listRender = [];
    List<PaymentCardModel> listPaymentCard = getxApp.listPaymentCard;

    if (listPaymentCard.isEmpty) {
      return [
        SizedBox(
          height: 12,
        ),
        Center(
          child: Text('Payment card empty'),
        ),
      ];
    }

    for (var i = 0; i < listPaymentCard.length; i++) {
      listRender.add(
        PaymentCardItem(
          paymentCardModel: listPaymentCard[i],
          isLastItem: i == listPaymentCard.length - 1,
          key: Key(
            listPaymentCard[i].id.toString(),
          ),
        ),
      );
    }

    return listRender;
  }
}
