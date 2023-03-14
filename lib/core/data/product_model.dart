import 'package:flutter_ecommerce_app/core/data/product_image_model.dart';

class ProductModel {
  final String originalPrice;
  final String price;
  final String id;
  final String name;
  final String productInfo;
  final String description;
  final String shippingInfo;
  final String thumbnail;
  final List<ProductImageModel> productImages;
  final int quantity;
  final bool? active;

  ProductModel({
    required this.originalPrice,
    required this.quantity,
    required this.id,
    required this.price,
    required this.name,
    required this.productInfo,
    required this.description,
    required this.shippingInfo,
    required this.thumbnail,
    required this.productImages,
    this.active,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    {
      return ProductModel(
        originalPrice: json['original_price'].toString(),
        quantity: json['quantity'] ?? '',
        id: json['_id'] ?? '',
        price: json['price'].toString(),
        name: json['name'] ?? '',
        productInfo: json['product_info'] ?? '',
        description: json['description'] ?? '',
        shippingInfo: json['shipping_info'] ?? '',
        thumbnail: json['thumbnail'],
        productImages: List<dynamic>.from(json['list_product_image'])
            .map(
              (e) => ProductImageModel.fromJson(e),
            )
            .toList(),
      );
    }
  }
}
