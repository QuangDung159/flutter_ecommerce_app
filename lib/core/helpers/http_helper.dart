import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> httpPost({
  required String uri,
  required Map<String, dynamic> reqBody,
}) async {
  final res = await http.post(
    parseUri('$baseUrl/product/getAll'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(reqBody),
  );

  return res;
}
