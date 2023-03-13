import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';

class ProductService {
  static String uri = '$baseUrl/product';

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
}
