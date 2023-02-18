import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_image_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';

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
    displayFee: 'FREE',
    fee: '0.0',
    orderAmountFrom: '90.0',
    orderAmountTo: '9999999999.0',
    valid: true,
    orderAmountInfo: 'Above \$90',
  ),
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
    id: 1,
    promotion: listPromotionDummy[0],
  ),
  PromotionUserModel(
    id: 2,
    promotion: listPromotionDummy[1],
  ),
  PromotionUserModel(
    id: 3,
    promotion: listPromotionDummy[2],
  ),
  PromotionUserModel(
    id: 4,
    promotion: listPromotionDummy[3],
  ),
  PromotionUserModel(
    id: 5,
    promotion: listPromotionDummy[4],
  ),
  PromotionUserModel(
    id: 6,
    promotion: listPromotionDummy[5],
  ),
  PromotionUserModel(
    id: 7,
    promotion: listPromotionDummy[6],
  ),
];
