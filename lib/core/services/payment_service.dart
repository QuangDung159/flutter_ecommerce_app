import 'dart:convert';

import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/payment_card_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:get/get.dart';

class PaymentService {
  static final GetxAppController getxApp = Get.find<GetxAppController>();

  static void getListCardPaymentFromLocalStore() {
    // updateListCardLocal([]);
    List<String> listPaymentCardJson =
        LocalStorageHelper.getValue('LIST_PAYMENT_CARD') ?? [];

    List<PaymentCardModel> listPayment = [];

    for (var item in listPaymentCardJson) {
      listPayment.add(
        PaymentCardModel.fromJson(
          jsonDecode(item),
        ),
      );
    }

    getxApp.setData(
      listPaymentCard: listPayment,
    );
  }

  static void updateListCardLocal(List<PaymentCardModel> listPaymentCard) {
    List<String> list = [];

    for (var item in listPaymentCard) {
      list.add(jsonEncode(item));
    }

    LocalStorageHelper.setValue(
      'LIST_PAYMENT_CARD',
      list,
    );
  }
}
