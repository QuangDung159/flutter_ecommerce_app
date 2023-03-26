// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/cart_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/main_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/product_detail_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/voucher_screen.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/datetime_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

String formatPrice(String price) {
  return '\$${double.parse(price)}';
}

void showSnackBar({
  String? title,
  required String content,
  bool? isSuccess,
  Duration? duration,
}) {
  Get.snackbar(
    title ?? 'Flutter E-Commerce App',
    content,
    duration: duration ?? Duration(seconds: 2),
    borderColor: isSuccess ?? true ? Colors.green : Colors.red,
    borderWidth: 1,
    margin:
        EdgeInsets.only(left: 12, right: 12, top: Platform.isAndroid ? 12 : 0),
    barBlur: 30,
  );
}

void printCustom({String? title, content}) {
  if (title != null && title != '') {
    print('$title $content');
  } else {
    print('$content');
  }
}

String getIdFromUrl(String? payloadUrl) {
  if (payloadUrl != null) {
    List<String> listSegment = payloadUrl.split('/');

    if (listSegment.length >= 3) {
      return listSegment[2];
    }
  }

  return '';
}

String getReferCodeFromUrl(String? payloadUrl) {
  if (payloadUrl != null) {
    List<String> listSegment = payloadUrl.split('/');

    if (listSegment.length >= 3) {
      return listSegment[2];
    }
  }

  return '';
}

String getScreenFromUrl(String? payloadUrl) {
  if (payloadUrl != null) {
    List<String> listSegment = payloadUrl.split('/');
    if (listSegment.length >= 2) {
      return listSegment[1];
    }
  }
  return '';
}

Widget? getScreen(
  String? screenName, {
  String? payload,
}) {
  GetxAppController getx = Get.find<GetxAppController>();

  switch (screenName) {
    case 'voucher_screen':
      String voucherCode = getIdFromUrl(payload);
      printCustom(content: voucherCode);
      return VoucherScreen(
        voucherCode: voucherCode,
      );
    case 'cart_screen':
      return CartScreen();
    case 'product_detail_screen':
      String id = getIdFromUrl(payload);

      return ProductDetailScreen(
        product: null,
        productId: id,
      );
    case 'profile_screen':
      String referCode = getReferCodeFromUrl(payload);
      if (referCode == '') {}

      String title = 'Please go to account screen and use your refer code';

      if (getx.userLogged.value == null) {
        title = 'Please signin to use refer code';
      }

      Future.delayed(
        Duration(seconds: 1),
        () => showSnackBar(
          content: 'Your received refer code: $referCode',
          title: title,
          duration: Duration(
            seconds: 4,
          ),
        ),
      );

      getx.setReferCodeReceived(referCode);
      return MainScreen();
    default:
      return null;
  }
}

void navigationByUrl(String? payload) {
  if (payload == '') {
    return;
  }

  String screenName = getScreenFromUrl(payload);
  Widget? screen = getScreen(
    screenName,
    payload: payload,
  );

  if (screen == null) {
    showSnackBar(
      content: 'No screen has been navigator!',
      isSuccess: false,
      duration: Duration(
        seconds: 3,
      ),
    );
  } else {
    Get.to(
      () => screen,
      preventDuplicates: screenName != 'product_detail_screen',
    );
  }
}

Future<void> share({
  required String text,
  required String title,
  required String linkUrl,
}) async {
  await FlutterShare.share(
    title: title,
    text: text,
    linkUrl: linkUrl,
  );
}

// Future<void> shareFile() async {
//   List<dynamic> docs = await DocumentsPicker.pickDocuments;
//   if (docs == null || docs.isEmpty) return null;

//   await FlutterShare.shareFile(
//     title: 'Example share',
//     text: 'Example share text',
//     filePath: docs[0] as String,
//   );
// }

Map<String, String> getMonthString(String monthNumber) {
  switch (monthNumber) {
    case '01':
      return {'long': 'January', 'short': 'Jan'};
    case '02':
      return {'long': 'February', 'short': 'Feb'};
    case '03':
      return {'long': 'March', 'short': 'Mar'};
    case '04':
      return {'long': 'April', 'short': 'Apr'};
    case '05':
      return {'long': 'May', 'short': 'May'};
    case '06':
      return {'long': 'June', 'short': 'Jun'};
    case '07':
      return {'long': 'July', 'short': 'Jul'};
    case '08':
      return {'long': 'August', 'short': 'Aug'};
    case '09':
      return {'long': 'September', 'short': 'Sep'};
    case '10':
      return {'long': 'October', 'short': 'Oct'};
    case '11':
      return {'long': 'November', 'short': 'Nov'};
    default:
      return {'long': 'December', 'short': 'Dec'};
  }
}

DateTimeModel getDateTimeFromString(String dateTime) {
  String date = dateTime.split(' ')[0];
  String time = dateTime.split(' ')[1];

  String year = date.split('-')[0];
  String month = date.split('-')[1];
  String day = date.split('-')[2];

  String hour = time.split(':')[0];
  String minute = time.split(':')[1];
  String second = time.split(':')[2];

  Map monthString = getMonthString(month);

  return DateTimeModel(
    year: year,
    month: month,
    day: day,
    hour: hour,
    minute: minute,
    second: second,
    monthLong: monthString['long'],
    monthShort: monthString['short'],
  );
}

int findCartInListCart(List<CartItemModel> listCartItem, String cartId) {
  return listCartItem.indexWhere((element) => element.id == cartId);
}

String toPrettyString(Map<String, dynamic> json) {
  var encoder = JsonEncoder.withIndent("     ");
  return encoder.convert(json);
}

String getLast4(String cardNumber) {
  String newString = cardNumber.substring(cardNumber.length - 4);
  return newString;
}

String getCardType(String cardNumber) {
  switch (detectCCType(cardNumber)) {
    case CreditCardType.visa:
      return 'Visa';
    case CreditCardType.mastercard:
      return 'Mastercard';
    case CreditCardType.dinersclub:
      return 'Dinersclub';
    case CreditCardType.amex:
      return 'Amex';
    case CreditCardType.discover:
      return 'Discover';
    case CreditCardType.jcb:
      return 'jcb';
    default:
      return 'Unknown card';
  }
}

String getCardLogo(String cardNumber) {
  switch (detectCCType(cardNumber)) {
    case CreditCardType.visa:
      return AssetHelper.iconVisa;
    case CreditCardType.mastercard:
      return AssetHelper.iconMastercard;
    default:
      return AssetHelper.iconCardDefault;
  }
}

Uri parseUri(String url) {
  return Uri.parse(url);
}

bool isRequestSuccess(res) {
  return res.statusCode == 200 || res.statusCode == 201;
}

Future<void> triggerLaunchUrl(Uri url, LaunchMode mode) async {
  if (!await launchUrl(url, mode: mode)) {
    throw Exception('Could not launch $url');
  }
}
