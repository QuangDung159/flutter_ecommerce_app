class WardModel {
  final int id;
  final String name;

  WardModel({
    required this.id,
    required this.name,
  });

  factory WardModel.fromJson(Map<String, dynamic> json) {
    {
      return WardModel(
        id: json['id'],
        name: json['name'],
      );
    }
  }
}
