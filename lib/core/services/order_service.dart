import 'dart:convert';

import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/order_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/http_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:get/get.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_model.dart';

class OrderService {
  static GetxAppController getxApp = Get.find<GetxAppController>();
  static String uri = '$baseUrl/order';

  static UserModel userLogged = getxApp.userLogged.value!;

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
      uri: '$uri/${userLogged.id}',
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

  static Future<String?> createOrder({
    Function()? onSuccess,
  }) async {
    try {
      List<Map<String, dynamic>> listCartItem = [];
      List<CartItemModel> listCartItemCheckout = getxApp.listCartItemCheckout;
      PromotionModel? promotion = getxApp.promotionSelected.value?.promotion;

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
        'userId': userLogged.id,
        'promoCode': promotion?.code ?? '',
        'promotionAmount': promotion?.value ?? '0',
        'subTotal': CartServices.calSubtotal(listCartItemCheckout),
        'total': CartServices.calTotal(),
        'description': 'Order',
        'shippingFee': getxApp.shippingPolicySelected.value.fee,
      };

      final res = await httpPost(uri: uri, reqBody: reqBody);

      if (isRequestSuccess(res)) {
        String? orderCreatedId = jsonDecode(res.body)['data']['orderCreatedId'];

        if (onSuccess != null) {
          onSuccess();
        }

        return orderCreatedId;
      }

      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<int> countOrder() async {
    try {
      int count = 0;
      final res = await httpGet(uri: '$uri/${userLogged.id}');
      count = jsonDecode(res.body)['data']['result'];
      return count;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> updateOrder({
    required Map<String, dynamic> reqBody,
    required String orderId,
    Function()? onSuccess,
    Function()? onFail,
  }) async {
    try {
      final res = await httpPut(uri: '$uri/$orderId', reqBody: reqBody);

      if (isRequestSuccess(res)) {
        if (onSuccess != null) {
          onSuccess();
        }
      } else {
        if (onFail != null) {
          onFail();
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
