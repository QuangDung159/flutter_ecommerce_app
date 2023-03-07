import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/order_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:get/get.dart';

class OrderService {
  static GetxAppController getxApp = Get.find<GetxAppController>();
  static String uri = '$baseUrl/order';

  static Future<List<OrderModel>> fetchListOrder({
    required String orderStatus,
    int? limit,
    int? page,
  }) async {
    Map<String, dynamic> reqBody = {
      'orderStatus': orderStatus,
      'limit': limit ?? 10,
      'page': page ?? 1,
    };

    final res = await httpPost(
      uri: '$uri/${getxApp.userLogged.value!.id}',
      reqBody: reqBody,
    );

    if (isRequestSuccess(res)) {
      Iterable listJson = jsonDecode(res.body)['data']['listOrder'];
      List<OrderModel> listOrder = List<OrderModel>.from(
        listJson.map(
          (e) => OrderModel.fromJson(e),
        ),
      );
      return listOrder;
    }

    return [];
  }

  static void createOrder({
    Function()? onSuccess,
  }) async {
    try {
      List<Map<String, dynamic>> listCartItem = [];
      List<CartItemModel> listCartItemCheckout = getxApp.listCartItemCheckout;

      for (var i = 0; i < listCartItemCheckout.length; i++) {
        CartItemModel cartItem = listCartItemCheckout[i];
        listCartItem.add({
          'quantity': cartItem.quantity,
          'product': {
            'price': cartItem.product.price,
            'id': cartItem.product.id,
          },
          'cartItem': cartItem.id,
        });
      }

      Map<String, dynamic> reqBody = {
        'listCartItem': listCartItem,
        'userId': getxApp.userLogged.value!.id,
        'promoCode': '123',
        'subTotal': CartServices.calSubtotal(listCartItemCheckout),
        'total': CartServices.calTotal(),
        'description': 'Order',
        'shippingFee': 5,
      };

      final res = await httpPost(uri: uri, reqBody: reqBody);

      if (isRequestSuccess(res)) {
        if (onSuccess != null) {
          onSuccess();
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
