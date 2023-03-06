import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';

class ProductService {
  static Future<List<ProductModel>> fetchListProductHome({
    int? page,
    int? limit,
    String? category,
  }) async {
    try {
      Map<String, dynamic> reqBody = {
        'page': page ?? 1,
        'limit': limit ?? 10,
        'category': category ?? '',
      };

      final res =
          await httpPost(uri: '$baseUrl/product/getAll', reqBody: reqBody);

      if (isRequestSuccess(res)) {
        Iterable list = json.decode(res.body)['data']['listProduct'];

        List<ProductModel> listPhoto = List<ProductModel>.from(
          list.map(
            (item) => ProductModel.fromJson(item),
          ),
        );
        return listPhoto;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
