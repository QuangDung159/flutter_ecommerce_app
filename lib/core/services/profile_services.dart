// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/textfield_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_signin_method.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:flutter_ecommerce_app/core/services/address_service.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:flutter_ecommerce_app/core/services/order_service.dart';
import 'package:flutter_ecommerce_app/core/services/promo_code_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileService {
  static final GetxAppController getxApp = Get.find<GetxAppController>();

  static String clientId = Platform.isIOS
      ? '721966385478-sv49lrmg59rktbt7kejvcb81f2e1nab5.apps.googleusercontent.com'
      : '';
  static String uri = '$baseUrl/user';

  static Future<UserModel?> getOneByEmailOrCreate({
    required String email,
    required String displayName,
    required String photoUrl,
    required String clientId,
    required String loginType,
  }) async {
    try {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      UserModel? user;

      Map<String, dynamic> reqBody = {
        'email': email,
        'display_name': displayName,
        'photo_url': photoUrl,
        'client_id': clientId,
        'login_type': loginType,
        'fcm_token': fcmToken,
      };

      final res = await httpPost(uri: uri, reqBody: reqBody);

      if (isRequestSuccess(res)) {
        user = UserModel.from(jsonDecode(res.body)['data']['user']);

        getxApp.setUserLogged(user);
        storeUserLogged(
          photoUrl: photoUrl,
          email: email,
          displayName: displayName,
          id: user.id,
          clientId: clientId,
        );

        CartServices.fetchListCart();
        AddressService.fetchListCity();
        AddressService.fetchListAddress();
        OrderService.countOrder();
        PromoCodeService.fetchListPromoCodeUser();
      }

      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  // google signin
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: clientId,
  );

  static void getInitAccountLogged() {
    var displayName = LocalStorageHelper.getValue('DISPLAY_NAME');

    if (displayName != null && displayName != '') {
      getxApp.setUserLogged(
        UserModel(
          email: LocalStorageHelper.getValue('EMAIL') ?? '',
          displayName: displayName ?? 'No name',
          photoUrl: LocalStorageHelper.getValue('PHOTO_URL') ?? '',
          id: LocalStorageHelper.getValue('ID') ?? '',
          clientId: LocalStorageHelper.getValue('OPEN_ID') ?? '',
          loginType: LocalStorageHelper.getValue('LOGIN_TYPE') ?? '',
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
    String? clientId,
    String? loginType,
  }) {
    LocalStorageHelper.setValue('PHOTO_URL', photoUrl);
    LocalStorageHelper.setValue('EMAIL', email);
    LocalStorageHelper.setValue('DISPLAY_NAME', displayName);
    LocalStorageHelper.setValue('OPEN_ID', clientId);
    LocalStorageHelper.setValue('ID', id);
    LocalStorageHelper.setValue('LOGIN_TYPE', loginType);

    getxApp.setUserLogged(
      UserModel(
        email: email,
        displayName: displayName,
        photoUrl: photoUrl,
        id: id,
        clientId: clientId,
        loginType: loginType,
      ),
    );

    showSnackBar(content: 'Welcome $displayName');
  }

  static Future<LoginResult> facebookLogin() async {
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

      getOneByEmailOrCreate(
        email: email,
        displayName: displayName,
        photoUrl: photoUrl,
        clientId: id,
        loginType: 'facebook',
      );
    } else {
      showSnackBar(
        content: result.message ?? 'Something went wrong.',
        isSuccess: false,
      );
    }
    return result;
  }

  static Future<GoogleSignInAccount?> googleLogin() async {
    try {
      var res = await _googleSignIn.signIn();
      if (res != null) {
        getOneByEmailOrCreate(
          email: res.email,
          displayName: res.displayName ?? 'N/a',
          photoUrl: res.photoUrl ?? '',
          clientId: res.id,
          loginType: 'google',
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
      LocalStorageHelper.setValue('PHOTO_URL', '');
      LocalStorageHelper.setValue('EMAIL', '');
      LocalStorageHelper.setValue('DISPLAY_NAME', '');
      LocalStorageHelper.setValue('OPEN_ID', '');

      _googleSignIn.disconnect();
      await FacebookAuth.instance.logOut();

      getxApp.setUserLogged(null);
      getxApp.setAddressSelected(null);
      getxApp.setPaymentCardDefault(null);
      getxApp.setPromotionSelected(null);
      getxApp.setReferCodeReceived(null);
      getxApp.setData(
        listAddress: [],
        listCartItem: [],
        listCartItemCheckout: [],
        listFilterSelected: [],
        listNoti: [],
        listPaymentCard: [],
        listPromoCode: [],
        listRecentlyViewed: [],
      );
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
                    LoadingButtonWidget(
                      label: 'Submit',
                      onTap: () {
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

  static Future<LoginResult?> handleFacebookLogin(
    BuildContext context,
    Function()? onSignInSuccess,
  ) async {
    try {
      final res = await facebookLogin();

      if (res.status == LoginStatus.success) {
        // success
        if (onSignInSuccess != null) {
          onSignInSuccess();
        }
      } else {
        return null;
      }

      return res;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<GoogleSignInAccount?> handleGoogleLogin(
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
