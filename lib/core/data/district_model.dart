import 'package:flutter_ecommerce_app/core/data/ward_model.dart';

class DistrictModel {
  final String name;
  final String id;
  final List<WardModel> listWard;

  DistrictModel({
    required this.name,
    required this.id,
    required this.listWard,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    {
      return DistrictModel(
        name: json['district_name'],
        id: json['_id'],
        listWard: List<dynamic>.from(json['list_ward'] ?? [])
            .map((e) => WardModel.fromJson(e))
            .toList(),
      );
    }
  }
}
