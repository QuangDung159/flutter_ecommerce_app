import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:get/get.dart';

class ProductService {
  static GetxAppController getxApp = Get.find<GetxAppController>();
  static String uri = '$baseUrl/product';

  static Future<List<ProductModel>> fetchListProductHome({
    int? page,
    int? limit,
    String? category,
    String? sortValue,
    List<String>? listFilterId,
  }) async {
    try {
      Map<String, dynamic> reqBody = {
        'page': page ?? 1,
        'limit': limit ?? 10,
        'category': category ?? '',
        'sort': sortValue ?? 'latest',
        'listFilterId': listFilterId,
      };

      final res =
          await httpPost(uri: '$baseUrl/product/getAll', reqBody: reqBody);

      if (isRequestSuccess(res)) {
        Iterable list = json.decode(res.body)['data']['listProduct'];

        List<ProductModel> listProduct = List<ProductModel>.from(
          list.map(
            (item) => ProductModel.fromJson(item),
          ),
        );

        updateListProduct(category ?? '', listProduct);

        return listProduct;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  static void updateListProduct(
      String category, List<ProductModel> listProduct) {
    switch (category) {
      case 'New Arrivals':
        getxApp.setData(listArrivals: listProduct);
        break;
      case 'Sale':
        getxApp.setData(listSaleItems: listProduct);
        break;
      default:
        break;
    }
  }

  static Future<ProductModel?> getProductById(String productId) async {
    final res = await httpGet(uri: '$uri/$productId');

    if (isRequestSuccess(res)) {
      ProductModel? product = ProductModel.fromJson(
        jsonDecode(res.body)['data']['product'],
      );

      return product;
    }

    return null;
  }

  static Future<List<ProductModel>> onSearch(String queryString) async {
    try {
      final res = await httpGet(uri: '$uri/search/$queryString');

      if (!isRequestSuccess(res)) {
        return [];
      }

      Iterable listJson = jsonDecode(res.body)['data']['listProduct'];
      List<ProductModel> listProduct = List<ProductModel>.from(
        listJson.map(
          (e) => ProductModel.fromJson(e),
        ),
      );

      return listProduct;
    } catch (e) {
      throw Exception(e);
    }
  }
}
