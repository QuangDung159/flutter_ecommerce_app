import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:get/get.dart';

class AddressService {
  static String uri = '$baseUrl/city';
  static GetxAppController getxApp = Get.find<GetxAppController>();

  static Future<List<CityModel>> fetchListCity() async {
    try {
      final res = await httpGet(uri: uri);

      if (isRequestSuccess(res)) {
        Iterable listJson = jsonDecode(res.body)['data']['list_city'];

        List<CityModel> listCity =
            List<CityModel>.from(listJson.map((e) => CityModel.fromJson(e)));

        getxApp.setData(
          listCity: listCity,
        );

        return listCity;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
