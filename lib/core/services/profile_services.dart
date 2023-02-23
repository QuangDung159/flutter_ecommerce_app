// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_signin_method.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileService {
  static final GetxAppController getxApp = Get.find<GetxAppController>();

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

      print(userData);

      String photoUrl = userData['picture']['data']['url'];
      String email = 'email';
      String displayName = userData['name'];
      String id = userData['id'];

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
    } else {
      print(result.status);
      print(result.message);
      showSnackBar(
        content: result.message ?? 'Something went wrong.',
        isSuccess: false,
      );
    }
  }

  static facebookLogout() async {
    await FacebookAuth.instance.logOut();
  }
}
