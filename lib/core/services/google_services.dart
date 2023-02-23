// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/textfield_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_signin_method.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_google_info_controller.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GoogleServices {
  static String clientId = Platform.isIOS
      ? '721966385478-sv49lrmg59rktbt7kejvcb81f2e1nab5.apps.googleusercontent.com'
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

      showSnackBar(content: 'Welcome ${res!.displayName}');
      return res;
    } catch (e) {
      showSnackBar(
        content: e.toString(),
        isSuccess: false,
      );
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

  static void showReferCodeInputBottomSheet(BuildContext context) {
    final referCodeInputController = TextEditingController();
    GetxAppController getx = Get.find<GetxAppController>();
    referCodeInputController.text = getx.referCodeReceived.value ?? '';

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: MediaQuery.of(context).viewInsets,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Container(
          color: Colors.white,
          height: 200,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                AssetHelper.iconBottomSheet,
                width: 40,
                height: 4,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Refer code'),
                    SizedBox(
                      height: 8,
                    ),
                    TextFieldWidget(
                      controller: referCodeInputController,
                      hintText: 'Enter refer code',
                      // autofocus: true,
                    ),
                    SizedBox(
                      height: AppDimension.contentPadding,
                    ),
                    ButtonWidget(
                      title: 'Submit',
                      opTap: () {
                        getx.setReferCodeReceived(null);
                        showSnackBar(
                          content: 'Using refer code success. Thank you.',
                          duration: Duration(
                            seconds: 3,
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<GoogleSignInAccount?> handleGoogleSignIn(
    BuildContext context,
    Function()? onSignInSuccess,
  ) async {
    try {
      final res = await GoogleServices.login();

      if (res != null) {
        // success
        if (onSignInSuccess != null) {
          onSignInSuccess();
        }
      }

      return res;
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

  static void showSigninBottomSheet(
    BuildContext context, {
    Function()? onSignInSuccess,
  }) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Container(
          color: Colors.white,
          height: 220,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                AssetHelper.iconBottomSheet,
                width: 40,
                height: 4,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please sign in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.contentPadding,
                ),
                child: ListSigninMethod(
                  onSignInSuccess: () {
                    if (onSignInSuccess != null) {
                      onSignInSuccess();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
