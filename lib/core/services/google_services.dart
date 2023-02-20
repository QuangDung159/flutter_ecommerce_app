import 'dart:io';

import 'package:flutter_ecommerce_app/core/controllers/getx_google_info_controller.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleServices {
  static String clientId = Platform.isIOS
      ? '1012509086997-5595hcq0p2gnmi5m5bqoqjrictle7bef.apps.googleusercontent.com'
      : '';

  static final googleInfo = Get.find<GetxGoogleInfoController>();

  // google signin
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: clientId,
  );

  static Future<GoogleSignInAccount?> login() async {
    try {
      var res = await _googleSignIn.signIn();
      if (res != null) {
        googleInfo.setData(
          photoUrl: res.photoUrl,
          email: res.email,
          openid: res.id,
          displayName: res.displayName,
        );

        LocalStorageHelper.setValue('PHOTO_URL', res.photoUrl);
        LocalStorageHelper.setValue('EMAIL', res.email);
        LocalStorageHelper.setValue('DISPLAY_NAME', res.displayName);
        LocalStorageHelper.setValue('OPEN_ID', res.id);
      }
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future logout() async {
    try {
      googleInfo.setData(
        photoUrl: '',
        email: '',
        openid: '',
        displayName: '',
      );

      LocalStorageHelper.setValue('PHOTO_URL', '');
      LocalStorageHelper.setValue('EMAIL', '');
      LocalStorageHelper.setValue('DISPLAY_NAME', '');
      LocalStorageHelper.setValue('OPEN_ID', '');
      _googleSignIn.disconnect();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> handleGoogleSignIn() async {
    try {
      final res = await GoogleServices.login();
      if (res != null) {
        // Navigator.of(context).pushNamed(MainScreen.routerName);

        // NotificationServices.showNotification(
        //   title: 'Hi ${res.displayName}',
        //   body: 'Welcome back!',
        //   usingCustomSound: true,
        //   payload: HotelBookingScreen.routerName,
        // );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static void getInitGoogleAccountSigned() {
    var displayName = LocalStorageHelper.getValue('DISPLAY_NAME');

    if (displayName != null && displayName != '') {
      googleInfo.setData(
        displayName: displayName,
        photoUrl: LocalStorageHelper.getValue('PHOTO_URL'),
        openid: LocalStorageHelper.getValue('OPEN_ID'),
        email: LocalStorageHelper.getValue('EMAIL'),
      );
    }
  }
}
