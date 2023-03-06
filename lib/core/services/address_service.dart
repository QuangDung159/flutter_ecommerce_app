import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:get/get.dart';

class AddressService {
  static String uri = '$baseUrl/city';
  static GetxAppController getxApp = Get.find<GetxAppController>();

  static DistrictModel districtDefault = listCityDummy[0].listDistrict[0];
  static WardModel wardDefault = listCityDummy[0].listDistrict[0].listWard[0];

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

        if (listCity.isNotEmpty) {
          getxApp.setData(
            citySelected: listCity[0],
          );

          if (listCity[0].listDistrict.isNotEmpty) {
            getxApp.setData(
              districtSelected: listCity[0].listDistrict[0],
            );
          }

          if (listCity[0].listDistrict[0].listWard.isNotEmpty) {
            getxApp.setData(
              wardSelected: listCity[0].listDistrict[0].listWard[0],
            );
          }
        }

        return listCity;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  static DistrictModel getDistrictDefault(CityModel city) {
    return city.listDistrict.isNotEmpty
        ? city.listDistrict[0]
        : districtDefault;
  }

  static WardModel getWardDefault(DistrictModel district) {
    return district.listWard.isNotEmpty ? district.listWard[0] : wardDefault;
  }
}
