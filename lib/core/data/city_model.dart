import 'package:flutter_ecommerce_app/core/data/district_model.dart';

class CityModel {
  final String id;
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
        id: json['_id'],
        name: json['city_name'],
        listDistrict: List.from(json['list_district'] ?? [])
            .map((e) => DistrictModel.fromJson(e))
            .toList(),
      );
    }
  }
}
