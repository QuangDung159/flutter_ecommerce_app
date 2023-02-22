import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:flutter_ecommerce_app/core/data/order_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/order_model.dart';
import 'package:flutter_ecommerce_app/core/data/payment_method_model.dart';
import 'package:flutter_ecommerce_app/core/data/payment_transaction.dart';
import 'package:flutter_ecommerce_app/core/data/product_image_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';

List<ProductModel> listProductDummy = [
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 1,
    price: '99',
    name: 'Matador',
    productInfo: '',
    description:
        '<p>INTRODUCING THE ADVANCED SERIES from Matador 1231</p><p>INTRODUCING THE ADVANCED SERIES from Matador INTRODUCING THE ADVANCED SERIES from Mat123ador INTRODUCING THE ADVANCED SERIES from Matador INTRODUCING THE ADVANCED SERIES from Matador INTRODUCING THE ADVANCED SERIES from Matador</p>',
    shippingInfo:
        '<p>The Nike Air Mock is a cropped fleece style that sits at your hips for a comfortable feel and easy styling.Its roomy fit features a mock-neck design and curved blocking inspired by movement.The blocking details and Air graphic are accented with a printed outline.</p><p>· Colour Shown: Pink Oxford/Rust Pink/White</p><p>· Style: DD5434-601</p>',
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
  ProductModel(
    originalPrice: '',
    quantity: 100,
    id: 2,
    price: '95',
    name:
        'Matador FreeRain24 2.0 Packable Backpack (Advanced Series) (Coyote Brown)',
    productInfo: '',
    description: '<p>INTRODUCING THE ADVANCED SERIES from Matador</p>',
    shippingInfo: '',
    thumbnail:
        'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/image_upload/image/2829/MATFR242001BN_1.jpg',
    productImages: [
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1604/MATFR242001BN_1.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1604/MATFR242001BN_2.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1604/MATFR242001BN_3.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1604/MATFR242001BN_5.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1604/MATFR242001BN_6.jpg',
      ),
    ],
  ),
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 3,
    price: '99',
    name: 'Matador FreeFly16 Packable Backpack (Advanced Series) (Charcoal)',
    productInfo: '',
    description: '<p>INTRODUCING THE ADVANCED SERIES from Matador</p>',
    shippingInfo: '',
    thumbnail:
        'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/image_upload/image/2830/MATFF16001BK_1.jpg',
    productImages: [
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1603/MATFF16001BK_1.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1603/MATFF16001BK_2.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1603/MATFF16001BK_3.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1603/MATFF16001BK_5.jpg',
      ),
      ProductImageModel(
        url:
            'https://levelup-stag.s3.ap-southeast-1.amazonaws.com/uploads/product/product_images/1603/MATFF16001BK_6.jpg',
      ),
    ],
  ),
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 4,
    price: '99',
    name:
        'Matador FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal)',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 5,
    price: '99',
    name:
        'Matador FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal)',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 6,
    price: '99',
    name:
        'Matador FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal)',
    productInfo: '',
    description:
        '<p>INTRODUCING THE ADVANCED SERIES from Matador INTRODUCING THE ADVANCED SERIES from Matador INTRODUCING THE ADVANCED SERIES from Matador INTRODUCING THE ADVANCED SERIES from Matador</p>',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 7,
    price: '99',
    name:
        'Matador FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal)',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 8,
    price: '99',
    name:
        'Matador FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal)',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 9,
    price: '99',
    name: 'FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal)',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 10,
    price: '99',
    name: 'FreeRain24 2.0 Packable Backpack (Advanced Series)',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 11,
    price: '99',
    name: 'FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal) 12f4',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 12,
    price: '99',
    name:
        'FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal) 43df23',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 13,
    price: '99',
    name: 'FreeRain24 2.0 Packable Backpack (Advanced Series) (Charcoal) 234',
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
  ProductModel(
    originalPrice: '119',
    quantity: 100,
    id: 14,
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
  SortItemModel(title: 'Recommended', value: 'recommended'),
  SortItemModel(title: 'Latest', value: 'latest'),
  SortItemModel(title: 'Price (high)', value: 'price_high'),
  SortItemModel(title: 'Price (low)', value: 'price_low'),
  SortItemModel(title: 'Sale', value: 'sale'),
];

List<FilterItemModel> listFilterDummy = [
  FilterItemModel(id: 1, name: 'Sport', slug: 'sport', parentId: null),
  FilterItemModel(id: 2, name: 'Gender', slug: 'gender', parentId: null),
  FilterItemModel(id: 3, name: 'Brand', slug: 'brand', parentId: null),
  FilterItemModel(id: 4, name: 'Category', slug: 'category', parentId: null),
  FilterItemModel(
      id: 5, name: 'Product type', slug: 'product_type', parentId: null),
  FilterItemModel(id: 6, name: 'Bike', slug: 'bike', parentId: 1),
  FilterItemModel(id: 7, name: 'Fitness', slug: 'fitness', parentId: 1),
  FilterItemModel(id: 8, name: 'Run', slug: 'run', parentId: 1),
  FilterItemModel(id: 9, name: 'Swim', slug: 'swim', parentId: 1),
  FilterItemModel(id: 10, name: 'Men', slug: 'men', parentId: 2),
  FilterItemModel(id: 11, name: 'Women', slug: 'women', parentId: 2),
  FilterItemModel(id: 12, name: 'Unisex', slug: 'unisex', parentId: 2),
  FilterItemModel(id: 13, name: '2XU', slug: '2xu', parentId: 3),
  FilterItemModel(id: 14, name: 'Adidas', slug: 'adidas', parentId: 3),
  FilterItemModel(id: 15, name: 'Brooks', slug: 'brooks', parentId: 3),
  FilterItemModel(id: 16, name: 'Nike', slug: 'nike', parentId: 3),
  FilterItemModel(id: 17, name: 'Gear', slug: 'gear', parentId: 4),
  FilterItemModel(id: 18, name: 'Tech', slug: 'tech', parentId: 4),
  FilterItemModel(id: 19, name: 'Short', slug: 'short', parentId: 4),
  FilterItemModel(id: 20, name: 'Bags', slug: 'bags', parentId: 5),
  FilterItemModel(id: 21, name: 'Tanks', slug: 'tanks', parentId: 5),
  FilterItemModel(id: 22, name: 'Bags', slug: 'bags', parentId: 5),
  FilterItemModel(id: 23, name: 'Tanks', slug: 'tanks', parentId: 5),
  FilterItemModel(id: 24, name: 'Bags', slug: 'bags', parentId: 5),
  FilterItemModel(id: 25, name: 'Tanks', slug: 'tanks', parentId: 5),
  FilterItemModel(id: 26, name: 'Bags', slug: 'bags', parentId: 5),
  FilterItemModel(id: 27, name: 'Tanks', slug: 'tanks', parentId: 5),
];

List<CartItemModel> listCartItemDummy = [
  CartItemModel(
      id: 1,
      product: listProductDummy[0],
      quantity: 120,
      variant:
          '{"id": 5334,"price": "55.0","original_price": "69.0","quantity": 0,"variant_options": [{"title": "Title","value": "Default Title"}],"thumbnail": null}'),
  CartItemModel(
      id: 2,
      product: listProductDummy[1],
      quantity: 120,
      variant:
          '{"id": 5334,"price": "55.0","original_price": "69.0","quantity": 0,"variant_options": [{"title": "Title","value": "Default Title"}],"thumbnail": null}'),
  CartItemModel(
      id: 3,
      product: listProductDummy[2],
      quantity: 120,
      variant:
          '{"id": 5334,"price": "55.0","original_price": "69.0","quantity": 0,"variant_options": [{"title": "Title","value": "Default Title"}],"thumbnail": null}'),
  CartItemModel(
      id: 4,
      product: listProductDummy[3],
      quantity: 120,
      variant:
          '{"id": 5334,"price": "55.0","original_price": "69.0","quantity": 0,"variant_options": [{"title": "Title","value": "Default Title"}],"thumbnail": null}'),
  CartItemModel(
      id: 5,
      product: listProductDummy[4],
      quantity: 120,
      variant:
          '{"id": 5334,"price": "55.0","original_price": "69.0","quantity": 0,"variant_options": [{"title": "Title","value": "Default Title"}],"thumbnail": null}'),
  CartItemModel(
      id: 6,
      product: listProductDummy[5],
      quantity: 120,
      variant:
          '{"id": 5334,"price": "55.0","original_price": "69.0","quantity": 0,"variant_options": [{"title": "Title","value": "Default Title"}],"thumbnail": null}'),
  CartItemModel(
      id: 7,
      product: listProductDummy[6],
      quantity: 120,
      variant:
          '{"id": 5334,"price": "55.0","original_price": "69.0","quantity": 0,"variant_options": [{"title": "Title","value": "Default Title"}],"thumbnail": null}'),
  CartItemModel(
      id: 8,
      product: listProductDummy[7],
      quantity: 120,
      variant:
          '{"id": 5334,"price": "55.0","original_price": "69.0","quantity": 0,"variant_options": [{"title": "Title","value": "Default Title"}],"thumbnail": null}'),
  CartItemModel(
      id: 9,
      product: listProductDummy[8],
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

List<PromotionModel> listPromotionDummy = [
  PromotionModel(
    id: 1,
    qty: 100,
    isClaimed: true,
    isValid: true,
    code: 'code1',
    discountType: 'special_value',
    endDate: '2023-09-15T21:39:00.000Z',
    sourceType: 'products',
    startDate: '2023-01-30T21:39:00.000Z',
    title: 'Discount \$10 next order',
    value: '10.0',
  ),
  PromotionModel(
    id: 1,
    qty: 100,
    isClaimed: true,
    isValid: true,
    code: 'code1',
    discountType: 'special_value',
    endDate: '2023-09-15T21:39:00.000Z',
    sourceType: 'products',
    startDate: '2023-01-30T21:39:00.000Z',
    title: 'Discount \$10 next order',
    value: '10.0',
  ),
  PromotionModel(
    id: 2,
    qty: 100,
    isClaimed: true,
    isValid: true,
    code: 'code2',
    discountType: 'special_value',
    endDate: '2023-09-15T21:39:00.000Z',
    sourceType: 'products',
    startDate: '2023-01-30T21:39:00.000Z',
    title: 'Discount \$12 next order',
    value: '12.0',
  ),
  PromotionModel(
    id: 3,
    qty: 100,
    isClaimed: true,
    isValid: true,
    code: 'code3',
    discountType: 'special_value',
    endDate: '2023-09-15T21:39:00.000Z',
    sourceType: 'products',
    startDate: '2023-01-30T21:39:00.000Z',
    title: 'Discount \$13 next order',
    value: '13.0',
  ),
  PromotionModel(
    id: 4,
    qty: 100,
    isClaimed: true,
    isValid: true,
    code: 'code4',
    discountType: 'special_value',
    endDate: '2023-09-15T21:39:00.000Z',
    sourceType: 'products',
    startDate: '2023-01-30T21:39:00.000Z',
    title: 'Discount \$14 next order',
    value: '14.0',
  ),
  PromotionModel(
    id: 5,
    qty: 100,
    isClaimed: true,
    isValid: true,
    code: 'code5',
    discountType: 'special_value',
    endDate: '2023-09-15T21:39:00.000Z',
    sourceType: 'products',
    startDate: '2023-01-30T21:39:00.000Z',
    title: 'Discount \$15 next order',
    value: '15.0',
  ),
  PromotionModel(
    id: 6,
    qty: 100,
    isClaimed: true,
    isValid: true,
    code: 'code6',
    discountType: 'special_value',
    endDate: '2023-09-15T21:39:00.000Z',
    sourceType: 'products',
    startDate: '2023-01-30T21:39:00.000Z',
    title: 'Discount \$16 next order',
    value: '16.0',
  ),
  PromotionModel(
    id: 7,
    qty: 100,
    isClaimed: true,
    isValid: true,
    code: 'code7',
    discountType: 'special_value',
    endDate: '2023-09-15T21:39:00.000Z',
    sourceType: 'products',
    startDate: '2023-01-30T21:39:00.000Z',
    title: 'Discount \$17 next order',
    value: '17.0',
  ),
];

List<PromotionUserModel> listPromotionUserDummy = [
  PromotionUserModel(
      id: 1, promotion: listPromotionDummy[0], redeemAt: '2023-01-30'),
  PromotionUserModel(
      id: 2, promotion: listPromotionDummy[1], redeemAt: '2023-01-30'),
  PromotionUserModel(
      id: 3, promotion: listPromotionDummy[2], redeemAt: '2023-01-30'),
  PromotionUserModel(
      id: 4, promotion: listPromotionDummy[3], redeemAt: '2023-01-30'),
  PromotionUserModel(
      id: 5, promotion: listPromotionDummy[4], redeemAt: '2023-01-30'),
  PromotionUserModel(
      id: 6, promotion: listPromotionDummy[5], redeemAt: '2023-01-30'),
  PromotionUserModel(
      id: 7, promotion: listPromotionDummy[6], redeemAt: '2023-01-30'),
];

List<PaymentMethodModel> listPaymentMethodDummy = [
  PaymentMethodModel(id: 1, title: 'Cash', type: 'cash'),
  PaymentMethodModel(id: 2, title: 'Flutter E-Wallet App', type: 'e_wallet'),
];

List<CityModel> listCityDummy = [
  CityModel(id: 1, name: 'Ha Noi City', listDistrict: [
    DistrictModel(name: 'Dong Da District', id: 1, listWard: [
      WardModel(id: 1, name: 'Cat Linh Ward'),
      WardModel(id: 2, name: 'Hang Bot Ward'),
      WardModel(id: 3, name: 'Kham Thien Ward'),
    ]),
    DistrictModel(name: 'Hoan Kiem District', id: 2, listWard: [
      WardModel(id: 4, name: 'Chuong Duong Ward'),
      WardModel(id: 5, name: 'Cua Dong Ward'),
      WardModel(id: 6, name: 'Cua Nam Ward'),
    ]),
    DistrictModel(name: 'Ba Dinh District', id: 3, listWard: [
      WardModel(id: 7, name: 'Cau Giay Ward'),
      WardModel(id: 8, name: 'Doi Can Ward'),
      WardModel(id: 9, name: 'Dien Bien Ward'),
    ]),
  ]),
  CityModel(id: 2, name: 'Ho Chi Minh City', listDistrict: [
    DistrictModel(
      name: 'District 1',
      id: 4,
      listWard: [
        WardModel(id: 10, name: 'Ben Nghe Ward'),
        WardModel(id: 11, name: 'Ben Thanh Ward'),
        WardModel(id: 12, name: 'Co Giang Ward'),
      ],
    ),
    DistrictModel(
      name: 'Binh Thanh District',
      id: 5,
      listWard: [
        WardModel(id: 13, name: 'Ward 1'),
        WardModel(id: 14, name: 'Ward 2'),
        WardModel(id: 15, name: 'Ward 3'),
      ],
    ),
    DistrictModel(
      name: 'Tan Phu District',
      id: 6,
      listWard: [
        WardModel(id: 16, name: 'Hiep Tan Ward'),
        WardModel(id: 17, name: 'Tay Thanh Ward'),
        WardModel(id: 18, name: 'Phu Thanh Ward'),
      ],
    ),
  ]),
];

List<OrderModel> listOrderDummy = [
  OrderModel(
    id: 1,
    subTotalAmount: '99.0',
    totalAmount: '586.0',
    createdAt: '2023-02-20',
    promotionAmount: '10.0',
    orderItems: [
      OrderItemModel(
        id: 1,
        quantity: 2,
        price: listProductDummy[0].price,
        product: listProductDummy[0],
      ),
      OrderItemModel(
        id: 2,
        quantity: 2,
        price: listProductDummy[1].price,
        product: listProductDummy[1],
      ),
      OrderItemModel(
        id: 3,
        quantity: 2,
        price: listProductDummy[2].price,
        product: listProductDummy[2],
      ),
    ],
    paymentTransaction: PaymentTransaction(
      id: 1,
      amountRequest: '99.0',
      amountCaptured: '99.0',
      cardLast4: '4242',
      cardBrand: 'visa',
      description: '',
      userId: 1,
      createdAt: '2023-02-20',
      updatedAt: '2023-02-20',
      sourceableType: 'order',
      sourceableId: 1,
    ),
    deliveryAt: '2023-02-20',
    description: '',
    promotionCode: 'code1',
  ),
  OrderModel(
    id: 2,
    subTotalAmount: '99.0',
    totalAmount: '594.0',
    createdAt: '2023-02-20',
    promotionAmount: '10.0',
    orderItems: [
      OrderItemModel(
        id: 4,
        quantity: 2,
        price: listProductDummy[4].price,
        product: listProductDummy[4],
      ),
      OrderItemModel(
        id: 5,
        quantity: 2,
        price: listProductDummy[5].price,
        product: listProductDummy[5],
      ),
      OrderItemModel(
        id: 6,
        quantity: 2,
        price: listProductDummy[6].price,
        product: listProductDummy[6],
      ),
    ],
    paymentTransaction: PaymentTransaction(
      id: 2,
      amountRequest: '99.0',
      amountCaptured: '99.0',
      cardLast4: '4242',
      cardBrand: 'visa',
      description: '',
      userId: 1,
      createdAt: '2023-02-20',
      updatedAt: '2023-02-20',
      sourceableType: 'order',
      sourceableId: 1,
    ),
    deliveryAt: '2023-02-20',
    description: '',
    promotionCode: 'code1',
  ),
  OrderModel(
    id: 3,
    subTotalAmount: '99.0',
    totalAmount: '594.0',
    createdAt: '2023-02-20',
    promotionAmount: '10.0',
    orderItems: [
      OrderItemModel(
        id: 7,
        quantity: 2,
        price: listProductDummy[7].price,
        product: listProductDummy[7],
      ),
      OrderItemModel(
        id: 8,
        quantity: 2,
        price: listProductDummy[8].price,
        product: listProductDummy[8],
      ),
      OrderItemModel(
        id: 9,
        quantity: 2,
        price: listProductDummy[9].price,
        product: listProductDummy[9],
      ),
    ],
    paymentTransaction: PaymentTransaction(
      id: 3,
      amountRequest: '99.0',
      amountCaptured: '99.0',
      cardLast4: '4242',
      cardBrand: 'visa',
      description: '',
      userId: 1,
      createdAt: '2023-02-20',
      updatedAt: '2023-02-20',
      sourceableType: 'order',
      sourceableId: 1,
    ),
    description: '',
    promotionCode: 'code1',
  ),
  OrderModel(
    id: 4,
    subTotalAmount: '99.0',
    totalAmount: '594.0',
    createdAt: '2023-02-20',
    promotionAmount: '10.0',
    orderItems: [
      OrderItemModel(
        id: 10,
        quantity: 2,
        price: listProductDummy[10].price,
        product: listProductDummy[10],
      ),
      OrderItemModel(
        id: 11,
        quantity: 2,
        price: listProductDummy[11].price,
        product: listProductDummy[11],
      ),
      OrderItemModel(
        id: 12,
        quantity: 2,
        price: listProductDummy[12].price,
        product: listProductDummy[12],
      ),
    ],
    paymentTransaction: PaymentTransaction(
      id: 4,
      amountRequest: '99.0',
      amountCaptured: '99.0',
      cardLast4: '4242',
      cardBrand: 'visa',
      description: '',
      userId: 1,
      createdAt: '2023-02-20',
      updatedAt: '2023-02-20',
      sourceableType: 'order',
      sourceableId: 1,
    ),
    description: '',
    promotionCode: 'code1',
  ),
];

List<OrderModel> listOrderDeliveredDummy = [
  OrderModel(
    id: 1,
    subTotalAmount: '99.0',
    totalAmount: '586.0',
    createdAt: '2023-02-20',
    promotionAmount: '10.0',
    orderItems: [
      OrderItemModel(
        id: 1,
        quantity: 2,
        price: listProductDummy[0].price,
        product: listProductDummy[0],
      ),
      OrderItemModel(
        id: 2,
        quantity: 2,
        price: listProductDummy[1].price,
        product: listProductDummy[1],
      ),
      OrderItemModel(
        id: 3,
        quantity: 2,
        price: listProductDummy[2].price,
        product: listProductDummy[2],
      ),
    ],
    paymentTransaction: PaymentTransaction(
      id: 1,
      amountRequest: '99.0',
      amountCaptured: '99.0',
      cardLast4: '4242',
      cardBrand: 'visa',
      description: '',
      userId: 1,
      createdAt: '2023-02-20',
      updatedAt: '2023-02-20',
      sourceableType: 'order',
      sourceableId: 1,
    ),
    deliveryAt: '2023-02-20',
    description: '',
    promotionCode: 'code1',
  ),
  OrderModel(
    id: 2,
    subTotalAmount: '99.0',
    totalAmount: '594.0',
    createdAt: '2023-02-20',
    promotionAmount: '10.0',
    orderItems: [
      OrderItemModel(
        id: 4,
        quantity: 2,
        price: listProductDummy[4].price,
        product: listProductDummy[4],
      ),
      OrderItemModel(
        id: 5,
        quantity: 2,
        price: listProductDummy[5].price,
        product: listProductDummy[5],
      ),
      OrderItemModel(
        id: 6,
        quantity: 2,
        price: listProductDummy[6].price,
        product: listProductDummy[6],
      ),
    ],
    paymentTransaction: PaymentTransaction(
      id: 2,
      amountRequest: '99.0',
      amountCaptured: '99.0',
      cardLast4: '4242',
      cardBrand: 'visa',
      description: '',
      userId: 1,
      createdAt: '2023-02-20',
      updatedAt: '2023-02-20',
      sourceableType: 'order',
      sourceableId: 1,
    ),
    deliveryAt: '2023-02-20',
    description: '',
    promotionCode: 'code1',
  ),
];

List<OrderModel> listOrderShippingDummy = [
  OrderModel(
    id: 3,
    subTotalAmount: '99.0',
    totalAmount: '594.0',
    createdAt: '2023-02-20',
    promotionAmount: '10.0',
    orderItems: [
      OrderItemModel(
        id: 7,
        quantity: 2,
        price: listProductDummy[7].price,
        product: listProductDummy[7],
      ),
      OrderItemModel(
        id: 8,
        quantity: 2,
        price: listProductDummy[8].price,
        product: listProductDummy[8],
      ),
      OrderItemModel(
        id: 9,
        quantity: 2,
        price: listProductDummy[9].price,
        product: listProductDummy[9],
      ),
    ],
    paymentTransaction: PaymentTransaction(
      id: 3,
      amountRequest: '99.0',
      amountCaptured: '99.0',
      cardLast4: '4242',
      cardBrand: 'visa',
      description: '',
      userId: 1,
      createdAt: '2023-02-20',
      updatedAt: '2023-02-20',
      sourceableType: 'order',
      sourceableId: 1,
    ),
    description: '',
    promotionCode: 'code1',
  ),
  OrderModel(
    id: 4,
    subTotalAmount: '99.0',
    totalAmount: '594.0',
    createdAt: '2023-02-20',
    promotionAmount: '10.0',
    orderItems: [
      OrderItemModel(
        id: 10,
        quantity: 2,
        price: listProductDummy[10].price,
        product: listProductDummy[10],
      ),
      OrderItemModel(
        id: 11,
        quantity: 2,
        price: listProductDummy[11].price,
        product: listProductDummy[11],
      ),
      OrderItemModel(
        id: 12,
        quantity: 2,
        price: listProductDummy[12].price,
        product: listProductDummy[12],
      ),
    ],
    paymentTransaction: PaymentTransaction(
      id: 4,
      amountRequest: '99.0',
      amountCaptured: '99.0',
      cardLast4: '4242',
      cardBrand: 'visa',
      description: '',
      userId: 1,
      createdAt: '2023-02-20',
      updatedAt: '2023-02-20',
      sourceableType: 'order',
      sourceableId: 1,
    ),
    description: '',
    promotionCode: 'code1',
  ),
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
    id: 1,
  ),
  NotificationModel(
    isRead: true,
    type: 'Update',
    title: 'So happy, new update has been installed',
    subTitle: 'New update has been installed',
    content:
        '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
    sendAt: '2023-02-21 12:32:40',
    id: 2,
  ),
  NotificationModel(
    isRead: true,
    type: 'Promotion',
    title: 'We send you a promo code',
    subTitle: 'We send you a promo code',
    content: '<p>We send you a promo code</p>',
    sendAt: '2023-02-20 12:32:16',
    id: 3,
  ),
  NotificationModel(
    isRead: false,
    type: 'Notification',
    title: 'Common notification',
    subTitle: 'Common notification',
    content: 'Lu CTO used your refer code',
    sendAt: '2023-02-20 12:32:16',
    id: 4,
  ),
  NotificationModel(
    isRead: true,
    type: 'Order',
    title: 'Your order\'s status changed',
    subTitle: 'Your order\'s status changed',
    content: '<p>Your order\'s status changed</p>',
    sendAt: '2023-02-20 12:32:16',
    id: 5,
  ),
  NotificationModel(
    isRead: true,
    type: 'Update',
    title: 'So happy, new update has been installed',
    subTitle: 'New update has been installed',
    content:
        '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
    sendAt: '2023-02-21 12:32:40',
    id: 6,
  ),
  NotificationModel(
    isRead: false,
    type: 'Promotion',
    title: 'We send you a promo code',
    subTitle: 'We send you a promo code',
    content: '<p>We send you a promo code</p>',
    sendAt: '2023-02-20 12:32:16',
    id: 7,
  ),
  NotificationModel(
    isRead: true,
    type: 'Notification',
    title: 'Common notification',
    subTitle: 'Common notification',
    content: 'Lu CTO used your refer code',
    sendAt: '2023-02-20 12:32:16',
    id: 8,
  ),
  NotificationModel(
    isRead: true,
    type: 'Order',
    title: 'Your order\'s status changed',
    subTitle: 'Your order\'s status changed',
    content: '<p>Your order\'s status changed</p>',
    sendAt: '2023-02-20 12:32:16',
    id: 9,
  ),
  NotificationModel(
    isRead: true,
    type: 'Update',
    title: 'So happy, new update has been installed',
    subTitle: 'New update has been installed',
    content:
        '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
    sendAt: '2023-02-21 12:32:40',
    id: 10,
  ),
  NotificationModel(
    isRead: true,
    type: 'Promotion',
    title: 'We send you a promo code',
    subTitle: 'We send you a promo code',
    content: '<p>We send you a promo code</p>',
    sendAt: '2023-02-20 12:32:16',
    id: 11,
  ),
  NotificationModel(
    isRead: true,
    type: 'Notification',
    title: 'Common notification',
    subTitle: 'Common notification',
    content: 'Lu CTO used your refer code',
    sendAt: '2023-02-20 12:32:16',
    id: 12,
  ),
  NotificationModel(
    isRead: true,
    type: 'Order',
    title: 'Your order\'s status changed',
    subTitle: 'Your order\'s status changed',
    content: '<p>Your order\'s status changed</p>',
    sendAt: '2023-02-20 12:32:16',
    id: 13,
  ),
  NotificationModel(
    isRead: true,
    type: 'Update',
    title: 'So happy, new update has been installed',
    subTitle: 'New update has been installed',
    content:
        '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
    sendAt: '2023-02-21 12:32:40',
    id: 14,
  ),
  NotificationModel(
    isRead: true,
    type: 'Promotion',
    title: 'We send you a promo code',
    subTitle: 'We send you a promo code',
    content: '<p>We send you a promo code</p>',
    sendAt: '2023-02-20 12:32:16',
    id: 15,
  ),
  NotificationModel(
    isRead: true,
    type: 'Notification',
    title: 'Common notification',
    subTitle: 'Common notification',
    content: 'Lu CTO used your refer code',
    sendAt: '2023-02-20 12:32:16',
    id: 16,
  ),
  NotificationModel(
    isRead: true,
    type: 'Order',
    title: 'Your order\'s status changed',
    subTitle: 'Your order\'s status changed',
    content: '<p>Your order\'s status changed</p>',
    sendAt: '2023-02-20 12:32:16',
    id: 17,
  ),
  NotificationModel(
    isRead: true,
    type: 'Update',
    title: 'So happy, new update has been installed',
    subTitle: 'New update has been installed',
    content:
        '<p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p><p>So happy, new update has been installed</p>',
    sendAt: '2023-02-21 12:32:40',
    id: 18,
  ),
  NotificationModel(
    isRead: true,
    type: 'Promotion',
    title: 'We send you a promo code',
    subTitle: 'We send you a promo code',
    content: '<p>We send you a promo code</p>',
    sendAt: '2023-02-20 12:32:16',
    id: 19,
  ),
  NotificationModel(
    isRead: true,
    type: 'Notification',
    title: 'Common notification',
    subTitle: 'Common notification',
    content: 'Lu CTO used your refer code',
    sendAt: '2023-02-20 12:32:16',
    id: 20,
  ),
];
