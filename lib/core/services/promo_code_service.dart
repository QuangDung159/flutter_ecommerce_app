import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:get/get.dart';

class PromoCodeService {
  static final GetxAppController getxApp = Get.find<GetxAppController>();
  static String uri = '$baseUrl/promoCode';

  static List<PromotionUserModel> getListPromoCodeUserFromRes(res) {
    List<PromotionUserModel> listPromoCodeUser = [];
    Iterable listJson = jsonDecode(res.body)['data']['listPromoCodeByUser'];

    listPromoCodeUser = List<PromotionUserModel>.from(
      listJson.map(
        (e) => PromotionUserModel.fromJson(e),
      ),
    );

    return listPromoCodeUser;
  }

  static Future<List<PromotionUserModel>> fetchListPromoCodeUser() async {
    try {
      UserModel? user = getxApp.userLogged.value;
      List<PromotionUserModel> listPromoCodeUser = [];

      final res = await httpGet(uri: '$uri/${user!.id}');
      listPromoCodeUser = getListPromoCodeUserFromRes(res);

      getxApp.setData(listPromoCode: listPromoCodeUser);

      return listPromoCodeUser;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> collectPromoCode({
    required String promoCodeString,
    Function(List<PromotionUserModel>? listPromoCode)? onSuccess,
    Function(String? error)? onFail,
  }) async {
    try {
      List<PromotionUserModel> listPromoCode = [];
      UserModel? user = getxApp.userLogged.value;
      Map<String, dynamic> reqBody = {'promoCodeString': promoCodeString};

      final res = await httpPost(uri: '$uri/${user!.id}', reqBody: reqBody);

      if (isRequestSuccess(res)) {
        listPromoCode = getListPromoCodeUserFromRes(res);
        getxApp.setData(listPromoCode: listPromoCode);

        if (onSuccess != null) {
          onSuccess(listPromoCode);
        }
      } else {
        String error = jsonDecode(res.body)['error'];
        showSnackBar(content: error, isSuccess: false);

        if (onFail != null) {
          onFail(error);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
