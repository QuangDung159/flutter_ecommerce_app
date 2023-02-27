import 'dart:convert';

import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/payment_method_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:get/get.dart';

class PaymentService {
  static final GetxAppController getxApp = Get.find<GetxAppController>();

  static void getListCardPaymentFromLocalStore() {
    List<String> listPaymentCardJson =
        LocalStorageHelper.getValue('LIST_CARD_PAYMENT') ?? '[]';

    List<PaymentMethodModel> listPayment = [];

    for (var item in listPaymentCardJson) {
      listPayment.add(
        PaymentMethodModel.fromJson(
          jsonDecode(item),
        ),
      );
    }

    getxApp.setData(
      listCardPayment: listPayment,
    );
  }

  static void updateListCardLocal(List<PaymentMethodModel> listPayment) {
    List<String> list = [];

    for (var item in listPayment) {
      list.add(jsonEncode(item));
    }

    LocalStorageHelper.setValue(
      'LIST_CARD_PAYMENT',
      list,
    );
  }

  static void handleStoreCardToLocal({
    required String last4,
    required String cardType,
    required String clientSecret,
  }) {
    List<PaymentMethodModel> listCardPayment = getxApp.listCardPayment;

    PaymentMethodModel cardPayment = PaymentMethodModel(
      id: listCardPayment.length,
      title: last4,
      type: cardType,
      stripeClientKey: clientSecret,
    );

    Map<String, dynamic> json = {
      'id': cardPayment.id,
      'title': cardPayment.title,
      'type': cardPayment.type,
      'stripeClientKey': cardPayment.stripeClientKey,
    };

    listCardPayment.add(cardPayment);
    getxApp.setData(paymentMethodSelected: cardPayment);

    LocalStorageHelper.setValue(
      'LIST_CARD_PAYMENT',
      jsonEncode([json]),
    );
  }
}
