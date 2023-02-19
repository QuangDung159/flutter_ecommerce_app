import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';

class AddressModel {
  final String addressLine;
  final int id;
  final CityModel city;
  final DistrictModel district;
  final WardModel ward;

  AddressModel({
    required this.addressLine,
    required this.city,
    required this.district,
    required this.ward,
    required this.id,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    {
      return AddressModel(
        addressLine: json['address_line'],
        city: CityModel.fromJson(json['city']),
        district: DistrictModel.fromJson(json['district']),
        ward: WardModel.fromJson(json['ward']),
        id: json['id'],
      );
    }
  }
}
