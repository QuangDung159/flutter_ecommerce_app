// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/card_form.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/config.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NoWebhookPaymentCardFormScreen extends StatefulWidget {
  const NoWebhookPaymentCardFormScreen({super.key});

  @override
  State<NoWebhookPaymentCardFormScreen> createState() =>
      _NoWebhookPaymentCardFormScreenState();
}

class _NoWebhookPaymentCardFormScreenState
    extends State<NoWebhookPaymentCardFormScreen> {
  String cardHolderName = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CardDetails cardDetail = CardDetails();
  final GetxAppController getxApp = Get.find<GetxAppController>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 1.0,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
            ),
            MyAppBar(
              title: 'Add card',
              hasBackButton: true,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppDimension.contentPadding,
                right: AppDimension.contentPadding,
                top: AppDimension.contentPadding,
              ),
              child: CreditCardWidget(
                padding: 0,
                frontCardBorder: Border.all(color: AppColors.border),
                backCardBorder: Border.all(color: AppColors.border),
                cardNumber: cardDetail.number ?? '',
                expiryDate: cardDetail.expirationYear.toString(),
                cardHolderName: cardHolderName,
                cvvCode: cardDetail.cvc ?? '',
                bankName: ' ',
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                // cardBgColor: AppColors.bgPrimary,
                backgroundImage: AssetHelper.imageCardBackground,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (
                  CreditCardBrand creditCardBrand,
                ) {},
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    renderCardForm(),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimension.contentPadding,
              ),
              child: LoadingButtonWidget(
                text: 'Payment',
                onPressed: () => handlePayPress(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget renderCardForm() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9,
      ),
      child: CardForm(
        formKey: formKey,
        obscureCvv: true,
        obscureNumber: true,
        cardNumber: cardDetail.number ?? '',
        cvvCode: cardDetail.cvc ?? '',
        isHolderNameVisible: true,
        isCardNumberVisible: true,
        isExpiryDateVisible: true,
        cardHolderName: cardHolderName,
        expiryDate:
            '${cardDetail.expirationMonth.toString()}/${cardDetail.expirationYear.toString()}',
        themeColor: AppColors.primary,
        textColor: AppColors.blackPrimary,
        cardNumberDecoration: InputDecoration(
          labelText: 'Number',
          hintText: 'XXXX XXXX XXXX XXXX',
          hintStyle: TextStyle(color: AppColors.greyScale),
          labelStyle: TextStyle(
            color: AppColors.blackPrimary,
          ),
          focusedBorder: border,
          enabledBorder: border,
        ),
        expiryDateDecoration: InputDecoration(
          hintStyle: TextStyle(
            color: AppColors.blackPrimary,
          ),
          labelStyle: TextStyle(
            color: AppColors.blackPrimary,
          ),
          focusedBorder: border,
          enabledBorder: border,
          labelText: 'Expired Date',
          hintText: 'XX/XX',
        ),
        cvvCodeDecoration: InputDecoration(
          hintStyle: TextStyle(
            color: AppColors.blackPrimary,
          ),
          labelStyle: TextStyle(
            color: AppColors.blackPrimary,
          ),
          focusedBorder: border,
          enabledBorder: border,
          labelText: 'CVV',
          hintText: 'XXX',
        ),
        cardHolderDecoration: InputDecoration(
          hintStyle: TextStyle(
            color: AppColors.blackPrimary,
          ),
          labelStyle: TextStyle(
            color: AppColors.blackPrimary,
          ),
          focusedBorder: border,
          enabledBorder: border,
          labelText: 'Card Holder',
        ),
        onCreditCardModelChange: onCreditCardModelChange,
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    // check card valid

    setState(() {
      cardDetail = cardDetail.copyWith(
        cvc: creditCardModel!.cvvCode,
        number: creditCardModel.cardNumber,
        expirationMonth: 12,
        expirationYear: 24,
      );
    });
  }

  Future<void> handlePayPress() async {
    try {
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
        items: ['id-1'],
      );

      print(paymentIntentResult);

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

        showSnackBar(
          content: 'Success!: The payment was confirmed successfully!',
        );
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
        } else {
          // Payment succeed
          showSnackBar(
            content: 'Error: ${paymentIntentResult['error']}',
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      showSnackBar(
        content: 'Error: $e',
        isSuccess: false,
      );
      return;
    }
  }

  Future<void> confirmIntent(String paymentIntentId) async {
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

  Future<Map<String, dynamic>> callNoWebhookPayEndpointIntentId({
    required String paymentIntentId,
  }) async {
    final url = Uri.parse('$kApiUrl/charge-card-off-session');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'paymentIntentId': paymentIntentId}),
    );
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> callNoWebhookPayEndpointMethodId({
    required bool useStripeSdk,
    required String paymentMethodId,
    required String currency,
    List<String>? items,
  }) async {
    final url = Uri.parse('$kApiUrl/pay-without-webhooks');
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
        'total': 3000,
      }),
    );
    return json.decode(response.body);
  }
}
