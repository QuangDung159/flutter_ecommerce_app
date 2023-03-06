import 'dart:convert';

import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> httpPost({
  required String uri,
  required Map<String, dynamic> reqBody,
}) async {
  final res = await http.post(
    parseUri(uri),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(reqBody),
  );

  return res;
}

Future<Response> httpPut({
  required String uri,
  required Map<String, dynamic> reqBody,
}) async {
  final res = await http.put(
    parseUri(uri),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(reqBody),
  );

  return res;
}

Future<Response> httpGet({required String uri}) async {
  final res = await http.get(
    parseUri(uri),
  );

  return res;
}

Future<Response> httpDelete({required String uri}) async {
  final res = await http.delete(
    parseUri(uri),
  );

  return res;
}
