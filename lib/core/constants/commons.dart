import 'dart:io';

import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_level_1_model.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:flutter_ecommerce_app/core/data/payment_method_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_image_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';

List<ProductModel> listProductDummy = [
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: '14',
    price: '99',
    name: 'FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal) 123',
    productInfo: '',
    description: '<p>INTRODUCING THE ADVANCED SERIES from Matador</p>',
    shippingInfo: '',
    thumbnail:
        'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/image_upload/image/2831/MATFR242001BK_1.jpg',
    productImages: [
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1605/MATFR242001BK_1.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1605/MATFR242001BK_2.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1605/MATFR242001BK_3.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1605/MATFR242001BK_5.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1605/MATFR242001BK_6.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1605/MATFR242001BK_7.jpg',
      ),
    ],
  ),
];

List<SortItemModel> listSortDummy = [
  SortItemModel(title: 'Latest', value: 'latest'),
  SortItemModel(title: 'Price (high)', value: 'price_high'),
  SortItemModel(title: 'Price (low)', value: 'price_low'),
];

List<FilterItemLevel1Model> listFilterDummy = [
  FilterItemLevel1Model(id: '1', name: 'Sport'),
];

List<CartItemModel> listCartItemDummy = [
  CartItemModel(
      id: '1',
      product: listProductDummy[0],
      quantity: 120,
      variant:
          '{"id": 5334,"price": "55.0","original_price": "69.0","quantity": 0,"variant_options": [{"title": "Title","value": "Default Title"}],"thumbnail": null}'),
];

List<ShippingPolicyModel> listShippingPolicyDummy = [
  ShippingPolicyModel(
    deliveryInfo: 'Normal (3 - 5 Working Days)',
    displayFee: '\$5.00',
    fee: '5.0',
    orderAmountFrom: '0.0',
    orderAmountTo: '90.0',
    valid: true,
    orderAmountInfo: '\$90 & Below',
  ),
  ShippingPolicyModel(
    deliveryInfo: 'Self-Pickup',
    displayFee: 'FREE',
    fee: '0.0',
    orderAmountFrom: '0.0',
    orderAmountTo: '9999999999.0',
    valid: true,
    orderAmountInfo: 'All',
  ),
];

List<PaymentMethodModel> listPaymentMethodDummy = [
  PaymentMethodModel(id: 1, title: 'Cash/COD', type: 'cash'),
  PaymentMethodModel(id: 2, title: 'Payment Card', type: 'payment_card'),
];

List<CityModel> listCityDummy = [
  CityModel(id: '1', name: 'No city available', listDistrict: [
    DistrictModel(name: 'No district available', id: '1', listWard: [
      WardModel(id: '1', name: 'No ward available'),
    ]),
  ]),
];

String deepLinkDomain = 'https://flutter-ecommerce-app.page.link';

String androidAppId = 'com.lqd.flutter_ecommerce_app';

String iosBundleId = 'com.lqd.flutterEcommerceApp';

String uriPrefix = 'https://flutterecommerceapp.page.link';

List<NotificationModel> listNotificationDummy = [
  NotificationModel(
    isRead: false,
    type: 'Order',
    title: 'Your order\'s status changed',
    subTitle: 'Your order\'s status changed',
    content: '<p>Your order\'s status changed</p>',
    sendAt: '2023-02-20 12:32:16',
    id: '1',
    payloadUrl: '',
  ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Update',
  //   title: 'So happy, new update has been installed',
  //   subTitle: 'New update has been installed',
  //   content:
  //       '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
  //   sendAt: '2023-02-21 12:32:40',
  //   id: 2,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Promotion',
  //   title: 'We send you a promo code',
  //   subTitle: 'We send you a promo code',
  //   content: '<p>We send you a promo code</p>',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 3,
  // ),
  // NotificationModel(
  //   isRead: false,
  //   type: 'Notification',
  //   title: 'Common notification',
  //   subTitle: 'Common notification',
  //   content: 'Lu CTO used your refer code',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 4,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Order',
  //   title: 'Your order\'s status changed',
  //   subTitle: 'Your order\'s status changed',
  //   content: '<p>Your order\'s status changed</p>',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 5,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Update',
  //   title: 'So happy, new update has been installed',
  //   subTitle: 'New update has been installed',
  //   content:
  //       '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
  //   sendAt: '2023-02-21 12:32:40',
  //   id: 6,
  // ),
  // NotificationModel(
  //   isRead: false,
  //   type: 'Promotion',
  //   title: 'We send you a promo code',
  //   subTitle: 'We send you a promo code',
  //   content: '<p>We send you a promo code</p>',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 7,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Notification',
  //   title: 'Common notification',
  //   subTitle: 'Common notification',
  //   content: 'Lu CTO used your refer code',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 8,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Order',
  //   title: 'Your order\'s status changed',
  //   subTitle: 'Your order\'s status changed',
  //   content: '<p>Your order\'s status changed</p>',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 9,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Update',
  //   title: 'So happy, new update has been installed',
  //   subTitle: 'New update has been installed',
  //   content:
  //       '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
  //   sendAt: '2023-02-21 12:32:40',
  //   id: 10,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Promotion',
  //   title: 'We send you a promo code',
  //   subTitle: 'We send you a promo code',
  //   content: '<p>We send you a promo code</p>',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 11,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Notification',
  //   title: 'Common notification',
  //   subTitle: 'Common notification',
  //   content: 'Lu CTO used your refer code',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 12,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Order',
  //   title: 'Your order\'s status changed',
  //   subTitle: 'Your order\'s status changed',
  //   content: '<p>Your order\'s status changed</p>',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 13,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Update',
  //   title: 'So happy, new update has been installed',
  //   subTitle: 'New update has been installed',
  //   content:
  //       '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
  //   sendAt: '2023-02-21 12:32:40',
  //   id: 14,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Promotion',
  //   title: 'We send you a promo code',
  //   subTitle: 'We send you a promo code',
  //   content: '<p>We send you a promo code</p>',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 15,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Notification',
  //   title: 'Common notification',
  //   subTitle: 'Common notification',
  //   content: 'Lu CTO used your refer code',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 16,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Order',
  //   title: 'Your order\'s status changed',
  //   subTitle: 'Your order\'s status changed',
  //   content: '<p>Your order\'s status changed</p>',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 17,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Update',
  //   title: 'So happy, new update has been installed',
  //   subTitle: 'New update has been installed',
  //   content:
  //       '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
  //   sendAt: '2023-02-21 12:32:40',
  //   id: 18,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Promotion',
  //   title: 'We send you a promo code',
  //   subTitle: 'We send you a promo code',
  //   content: '<p>We send you a promo code</p>',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 19,
  // ),
  // NotificationModel(
  //   isRead: true,
  //   type: 'Notification',
  //   title: 'Common notification',
  //   subTitle: 'Common notification',
  //   content: 'Lu CTO used your refer code',
  //   sendAt: '2023-02-20 12:32:16',
  //   id: 20,
  // ),
];

String stripePublishableKey =
    'pk_test_51JmJfZAuFtBplfKrgE6iUmueVzqWbiTosG1kDBZ4SwX3XRaGpqGPDHXtOsVz1LH3y1OgArtVlYzhg6PE6JJGf6xj00HzAHLgRp';

bool isAndroid = Platform.isAndroid;

const String baseUrl = 'https://nodejs-e-commerce-dev.onrender.com/api/v1';
// const String baseUrl = 'https://nodejs-e-commerce.onrender.com/api/v1';
// const String baseUrl = 'http://localhost:5004/api/v1';

const String stripeBaseUrl = 'https://nodejs-stripe.onrender.com';
// String stripeBaseUrl =
//     isAndroid ? 'http://10.0.2.2:4242' : 'http://localhost:4242';

int dateStringToTimestamp(String dateString) {
  DateTime date = DateTime.parse(dateString);
  return date.microsecondsSinceEpoch;
}
