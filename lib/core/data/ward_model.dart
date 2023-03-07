class WardModel {
  final String id;
  final String name;

  WardModel({
    required this.id,
    required this.name,
  });

  factory WardModel.fromJson(Map<String, dynamic> json) {
    {
      return WardModel(
        id: json['_id'],
        name: json['ward_name'],
      );
    }
  }
}
