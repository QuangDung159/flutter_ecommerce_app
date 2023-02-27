// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/card_form.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() => runApp(CardFormScreen());

class CardFormScreen extends StatefulWidget {
  const CardFormScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CardFormScreenState();
  }
}

class CardFormScreenState extends State<CardFormScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CardDetails _card = CardDetails();
  bool? _saveCard = false;

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
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                bankName: ' ',
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                // cardBgColor: AppColors.bgPrimary,
                backgroundImage: AssetHelper.imageCardBackground,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
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
              child: ButtonWidget(
                label: 'Add card',
                onTap: () {
                  // _onValidate();
                  _handlePayPress();
                },
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
        cardNumber: cardNumber,
        cvvCode: '',
        isHolderNameVisible: true,
        isCardNumberVisible: true,
        isExpiryDateVisible: true,
        cardHolderName: cardHolderName,
        expiryDate: expiryDate,
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

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Future<void> _handlePayPress() async {}
}
