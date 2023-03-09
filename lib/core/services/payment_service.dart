// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/payment_card_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  static final GetxAppController getxApp = Get.find<GetxAppController>();
  static String uri = '$baseUrl/payment';

  static void getListCardPaymentFromLocalStore() {
    // updateListCardLocal([]);
    // return;
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

  static Future<List<PaymentCardModel>> fetchListPaymentCard() async {
    try {
      List<PaymentCardModel> listPaymentCard = [];

      final res = await httpGet(uri: '$uri/${getxApp.userLogged.value!.id}');

      if (isRequestSuccess(res)) {
        Iterable listJson = jsonDecode(res.body)['data']['listPaymentCard'];
        listPaymentCard = List<PaymentCardModel>.from(
          listJson.map(
            (e) => PaymentCardModel.fromJson(e),
          ),
        );

        getxApp.setData(listPaymentCard: listPaymentCard);
      }

      return listPaymentCard;
    } catch (e) {
      throw Exception(e);
    }
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

  static bool isCardValid({
    required String cardNumber,
    required cvvCode,
    required expiryDate,
  }) {
    if (cardNumber == '' || cvvCode == '' || expiryDate == '') {
      return false;
    }

    return true;
  }

  static void addCard({
    required String cardNumber,
    required String cvvCode,
    required String expiryDate,
  }) {
    List<PaymentCardModel> listCardPayment = getxApp.listPaymentCard;

    // PaymentCardModel cardPayment = PaymentCardModel(
    //   id: listCardPayment.length,
    //   cardNumber: cardNumber.replaceAll(' ', ''),
    //   cardType: getCardType(cardNumber),
    //   clientSecret: 'clientSecret',
    //   cvvCode: cvvCode,
    //   expiryDate: expiryDate,
    // );

    // listCardPayment.add(cardPayment);
    // PaymentService.updateListCardLocal(listCardPayment);
    // getxApp.setPaymentCardDefault(cardPayment);

    showSnackBar(
      content: 'Add payment card success',
      duration: Duration(
        milliseconds: 1200,
      ),
    );
  }

  static void removeCard(PaymentCardModel paymentCardModel) {
    List<PaymentCardModel> listPaymentCard = getxApp.listPaymentCard;
    listPaymentCard.remove(paymentCardModel);
    PaymentService.updateListCardLocal(listPaymentCard);
  }

  static Future<void> handlePayment({
    required String cardNumber,
    required String cvvCode,
    required Function() onPaymentSuccess,
    required String expiryDate,
  }) async {
    try {
      int expiryMonth = int.parse(expiryDate.split('/')[0]);
      int expiryYear = int.parse(expiryDate.split('/')[1]);

      CardDetails cardDetail = CardDetails(
        number: cardNumber,
        cvc: cvvCode,
        expirationMonth: expiryMonth,
        expirationYear: expiryYear,
      );

      await Stripe.instance.dangerouslyUpdateCardDetails(cardDetail);
      // 1. Gather customer billing information (ex. email)

      final billingDetails = BillingDetails(
        email: getxApp.userLogged.value!.email,
      ); // mocked data for tests

      // 2. Create payment method
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: billingDetails,
          ),
        ),
      );

      // 3. call API to create PaymentIntent
      final paymentIntentResult = await callNoWebhookPayEndpointMethodId(
        useStripeSdk: true,
        paymentMethodId: paymentMethod.id,
        currency: 'usd', // mocked data
        total: (CartServices.calTotal() * 100).round(),
      );

      if (paymentIntentResult['error'] != null) {
        // Error during creating or confirming Intent
        showSnackBar(
          content: 'Error: ${paymentIntentResult['error']}',
          isSuccess: false,
        );
        return;
      }

      if (paymentIntentResult['clientSecret'] != null &&
          paymentIntentResult['requiresAction'] == null) {
        // Payment succeed
        onPaymentSuccess();
        return;
      }

      if (paymentIntentResult['clientSecret'] != null &&
          paymentIntentResult['requiresAction'] == true) {
        // 4. if payment requires action calling handleNextAction
        final paymentIntent = await Stripe.instance
            .handleNextAction(paymentIntentResult['clientSecret']);

        // todo handle error
        /*if (cardActionError) {
        Alert.alert(
        `Error code: ${cardActionError.code}`,
        cardActionError.message
        );
      } else*/

        if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
          // 5. Call API to confirm intent
          await confirmIntent(paymentIntent.id);
          onPaymentSuccess();
        } else {
          showSnackBar(
            content: 'Error: ${paymentIntentResult['error']}',
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      var error = jsonDecode(jsonEncode(e));

      showSnackBar(
        content: 'Error: ${error['error']['message']}',
        isSuccess: false,
        duration: Duration(seconds: 3),
      );
      log('Error: $e');
      return;
    }
  }

  static Future<Map<String, dynamic>> callNoWebhookPayEndpointMethodId({
    required bool useStripeSdk,
    required String paymentMethodId,
    required String currency,
    List<String>? items,
    required int total,
  }) async {
    final url = Uri.parse('$stripeBaseUrl/pay-without-webhooks');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'useStripeSdk': useStripeSdk,
        'paymentMethodId': paymentMethodId,
        'currency': currency,
        'items': items,
        'total': total,
      }),
    );
    return json.decode(response.body);
  }

  static Future<void> confirmIntent(String paymentIntentId) async {
    final result = await callNoWebhookPayEndpointIntentId(
        paymentIntentId: paymentIntentId);
    if (result['error'] != null) {
      showSnackBar(
        content: 'Error: ${result['error']}',
        isSuccess: false,
      );
    } else {
      showSnackBar(
        content: 'Success! The payment was confirmed successfully!',
        isSuccess: false,
      );
    }
  }

  static Future<Map<String, dynamic>> callNoWebhookPayEndpointIntentId({
    required String paymentIntentId,
  }) async {
    final url = Uri.parse('$stripeBaseUrl/charge-card-off-session');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'paymentIntentId': paymentIntentId}),
    );
    return json.decode(response.body);
  }
}
