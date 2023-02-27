import 'dart:convert';

import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/payment_method_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:get/get.dart';

class PaymentService {
  static GetxAppController getxApp = Get.find<GetxAppController>();

  static void getListCardPaymentFromLocalStore() {
    String listPaymentCardJson =
        LocalStorageHelper.getValue('LIST_CARD_PAYMENT') ?? '[]';

    var json = jsonDecode(listPaymentCardJson);
    List<PaymentMethodModel> listCardPayment = getxApp.listCardPayment;

    for (var element in json) {
      PaymentMethodModel cardPayment = PaymentMethodModel.fromJson(element);
      listCardPayment.add(cardPayment);
    }
  }
}
