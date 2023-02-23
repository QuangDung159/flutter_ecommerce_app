// ignore_for_file: prefer_const_constructors

import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class FacebookServices {
  static GetxAppController getxApp = Get.find<GetxAppController>();

  static login() async {
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

  static logout() async {
    await FacebookAuth.instance.logOut();
  }
}
