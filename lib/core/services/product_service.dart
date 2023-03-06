import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<ProductModel>> fetchListProductHome() async {
    try {
      final res = await http.get(parseUri('$baseUrl/product/100/1'));
      printCustom(title: 'res :>>', content: res);

      if (isRequestSuccess(res)) {
        Iterable list = json.decode(res.body)['data']['listProduct'];
        printCustom(title: 'list :>>', content: list);

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
