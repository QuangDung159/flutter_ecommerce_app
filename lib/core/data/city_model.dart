import 'package:flutter_ecommerce_app/core/data/district_model.dart';

class CityModel {
  final int id;
  final String name;
  final List<DistrictModel> listDistrict;

  CityModel({
    required this.id,
    required this.name,
    required this.listDistrict,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    {
      return CityModel(
        id: json['id'],
        name: json['name'],
        listDistrict: List.from(json['list_district'])
            .map((e) => DistrictModel.fromJson(e))
            .toList(),
      );
    }
  }
}
