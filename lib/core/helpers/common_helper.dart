// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/cart_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/main_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/product_detail_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/voucher_screen.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_google_info_controller.dart';
import 'package:flutter_ecommerce_app/core/data/datetime_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';

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
    margin: EdgeInsets.all(12),
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

int getIdFromUrl(String? payloadUrl) {
  if (payloadUrl != null) {
    List<String> listSegment = payloadUrl.split('/');

    if (listSegment.length >= 3) {
      return int.parse(listSegment[2]);
    }
  }

  return -1;
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
  GetxGoogleInfoController getxGoogle = Get.find<GetxGoogleInfoController>();

  switch (screenName) {
    case 'voucher_screen':
      return VoucherScreen();
    case 'cart_screen':
      return CartScreen();
    case 'product_detail_screen':
      int id = getIdFromUrl(payload);

      ProductModel? product = CartServices.getProductById(id);
      if (product == null) {
        return null;
      }

      return ProductDetailScreen(
        product: product,
      );
    case 'profile_screen':
      String referCode = getReferCodeFromUrl(payload);
      if (referCode == '') {}

      String title = 'Please go to account screen and use your refer code';

      if (getxGoogle.displayName.value == '') {
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
  String screenName = getScreenFromUrl(payload);
  Widget? screen = getScreen(
    screenName,
    payload: payload,
  );

  if (screen == null) {
    showSnackBar(
      content: 'No screen has been navigator!',
      duration: Duration(
        seconds: 3,
      ),
    );
  } else {
    Get.to(() => screen);
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
