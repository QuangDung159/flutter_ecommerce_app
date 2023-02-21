// ignore_for_file: prefer_const_constructors

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';

class DynamicLinkServices {
  static Future<void> initDynamicLinks({
    required FirebaseDynamicLinks dynamicLinks,
    required BuildContext context,
  }) async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      // Navigator.pushNamed(context, dynamicLinkData.link.path);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  static onReceiveDynamicLink() {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      printCustom(title: 'dynamicLinkData :>>', content: dynamicLinkData);
      handleDynamicUrl(dynamicLinkData.link.toString());
    }).onError((error) {
      throw Exception(error);
    });
  }

  static onReceiveTerminateAppDynamicLink() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      handleDynamicUrl(initialLink.link.toString());
    }
  }

  static handleDynamicUrl(String url) async {
    String? payload = getPayloadUrlFromLink(url);

    navigationByUrl(payload);
  }

  static String? getPayloadUrlFromLink(String deepLink) {
    List<String> listSegment = deepLink.split(deepLinkDomain);
    if (listSegment.length <= 1) {
      return null;
    }
    return listSegment[1];
  }

  static Future<String> buildDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'flutterecommerceapp.page.link',
      link: Uri.parse('https://flutter-ecommerce-app.page.link/product_detail_screen/1'),
      androidParameters: AndroidParameters(
        //Ở đây là tên package đã config trên Firebase.
        packageName: androidAppId,
        minimumVersion: 0,
      ),
      iosParameters: IOSParameters(
        //Ở đây là bundleId đã config trên Firebase.
        bundleId: iosBundleId,
        minimumVersion: '0',
      ),
      // socialMetaTagParameters: SocialMetaTagParameters(
      //   description: '',
      //   imageUrl:
      //       Uri.parse('https://flutter.dev/images/flutter-logo-sharing.png'),
      //   title: '',
      // ),
    );

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);

    return dynamicLink.toString();
  }
}
