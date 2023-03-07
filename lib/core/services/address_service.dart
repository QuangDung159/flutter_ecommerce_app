import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/address_model.dart';
import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:get/get.dart';

class AddressService {
  static GetxAppController getxApp = Get.find<GetxAppController>();

  static DistrictModel districtDefault = listCityDummy[0].listDistrict[0];
  static WardModel wardDefault = listCityDummy[0].listDistrict[0].listWard[0];

  static void getListAddressFromResponse(res) async {
    Iterable listJson = jsonDecode(res.body)['data']['listAddress'];
    List<AddressModel> listAddress = List<AddressModel>.from(
      listJson.map(
        (e) => AddressModel.fromJson(e),
      ),
    );

    getxApp.setData(listAddress: listAddress);

    if (listAddress.isNotEmpty) {
      getxApp.setAddressSelected(listAddress[listAddress.length - 1]);
    }
  }

  static Future<List<CityModel>> fetchListCity() async {
    try {
      final res = await httpGet(uri: '$baseUrl/city');

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

  static void fetchListAddress() async {
    try {
      final res = await httpGet(uri: '$baseUrl/address');
      if (isRequestSuccess(res)) {
        getListAddressFromResponse(res);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> submitCreateAddress({
    required String receiverName,
    required String phone,
    required String addressLine,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        'city_id': getxApp.citySelected.value.id,
        'district_id': getxApp.districtSelected.value.id,
        'ward_id': getxApp.wardSelected.value.id,
        'receiver_name': receiverName,
        'phone': phone,
        'address_line': addressLine,
        'user_id': getxApp.userLogged.value!.id,
      };

      final res = await httpPost(uri: '$baseUrl/address', reqBody: requestBody);

      if (isRequestSuccess(res)) {
        getListAddressFromResponse(res);
        showSnackBar(content: 'Submit address success');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}