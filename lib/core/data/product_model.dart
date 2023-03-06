import 'package:flutter_ecommerce_app/core/data/product_image_model.dart';

class ProductModel {
  final String originalPrice;
  final String price;
  final int id;
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
        originalPrice: json['default_variant']['original_price'],
        quantity: json['default_variant']['quantity'],
        id: json['id'],
        price: json['default_variant']['price'],
        name: json['name'],
        productInfo: json['product_info'],
        description: json['description'],
        shippingInfo: json['shipping_info'],
        thumbnail: json['thumbnail']['url'],
        productImages: List<dynamic>.from(json['product_images'])
            .map(
              (e) => ProductImageModel.fromJson(e),
            )
            .toList(),
      );
    }
  }
}
