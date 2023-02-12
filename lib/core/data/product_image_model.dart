class ProductImageModel {
  final String url;

  ProductImageModel({
    required this.url,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    {
      return ProductImageModel(
        url: json['url'],
      );
    }
  }
}
