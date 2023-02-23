// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/textfield_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_signin_method.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileService {
  static final GetxAppController getxApp = Get.find<GetxAppController>();

  static String clientId = Platform.isIOS
      ? '721966385478-sv49lrmg59rktbt7kejvcb81f2e1nab5.apps.googleusercontent.com'
      : '';

  // google signin
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: clientId,
  );

  static void getInitAccountLogged() {
    var displayName = LocalStorageHelper.getValue('DISPLAY_NAME');

    if (displayName != null && displayName != '') {
      getxApp.setUserLogged(
        UserModel(
          email: LocalStorageHelper.getValue('EMAIL'),
          displayName: displayName ?? 'No name',
          photoUrl: LocalStorageHelper.getValue('PHOTO_URL'),
          id: LocalStorageHelper.getValue('OPEN_ID'),
        ),
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

  static storeUserLogged({
    required String photoUrl,
    required String email,
    required String displayName,
    required String id,
  }) {
    LocalStorageHelper.setValue('PHOTO_URL', photoUrl);
    LocalStorageHelper.setValue('EMAIL', email);
    LocalStorageHelper.setValue('DISPLAY_NAME', displayName);
    LocalStorageHelper.setValue('OPEN_ID', id);

    getxApp.setUserLogged(
      UserModel(
        email: email,
        displayName: displayName,
        photoUrl: photoUrl,
        id: id,
      ),
    );

    showSnackBar(content: 'Welcome $displayName');
  }

  static facebookLogin() async {
    final result = await FacebookAuth.i.login(
      permissions: [
        'email',
        'public_profile',
        'user_birthday',
        'user_friends',
        'user_gender',
        'user_link'
      ],
    );
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData(
        fields: "name,email,picture.width(200),birthday,friends,gender,link",
      );

      String photoUrl = userData['picture']['data']['url'];
      String email = 'email';
      String displayName = userData['name'];
      String id = userData['id'];

      storeUserLogged(
        photoUrl: photoUrl,
        email: email,
        displayName: displayName,
        id: id,
      );
    } else {
      print(result.status);
      print(result.message);
      showSnackBar(
        content: result.message ?? 'Something went wrong.',
        isSuccess: false,
      );
    }
  }

  static Future<GoogleSignInAccount?> googleLogin() async {
    try {
      var res = await _googleSignIn.signIn();
      if (res != null) {
        storeUserLogged(
          photoUrl: res.photoUrl ?? '',
          email: res.email,
          displayName: res.displayName ?? '',
          id: res.id,
        );
      }
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
      getxApp.setUserLogged(null);

      LocalStorageHelper.setValue('PHOTO_URL', '');
      LocalStorageHelper.setValue('EMAIL', '');
      LocalStorageHelper.setValue('DISPLAY_NAME', '');
      LocalStorageHelper.setValue('OPEN_ID', '');

      _googleSignIn.disconnect();
      await FacebookAuth.instance.logOut();
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
      final res = await googleLogin();

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
}
