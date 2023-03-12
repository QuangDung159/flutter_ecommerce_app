import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:get/get.dart';

class PromoCodeService {
  static final GetxAppController getxApp = Get.find<GetxAppController>();
  static String uri = '$baseUrl/promoCode';

  static Future<List<PromotionUserModel>> fetchListPromoCodeUser() async {
    try {
      UserModel? user = getxApp.userLogged.value;
      List<PromotionUserModel> listPromoCodeUser = [];

      final res = await httpGet(uri: '$uri/${user!.id}');
      Iterable listJson = jsonDecode(res.body)['data']['listPromoCodeByUser'];

      listPromoCodeUser = List<PromotionUserModel>.from(
        listJson.map(
          (e) => PromotionUserModel.fromJson(e),
        ),
      );

      getxApp.setData(listPromoCode: listPromoCodeUser);

      return listPromoCodeUser;
    } catch (e) {
      throw Exception(e);
    }
  }
}
