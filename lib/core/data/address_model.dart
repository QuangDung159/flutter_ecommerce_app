import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';

class AddressModel {
  final String addressLine;
  final String id;
  final CityModel city;
  final DistrictModel district;
  final WardModel ward;
  final String receiverName;
  final String phone;

  AddressModel({
    required this.addressLine,
    required this.city,
    required this.district,
    required this.ward,
    required this.id,
    required this.receiverName,
    required this.phone,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    {
      return AddressModel(
        addressLine: json['address_line'],
        city: CityModel.fromJson(json['city_id']),
        district: DistrictModel.fromJson(json['district_id']),
        ward: WardModel.fromJson(json['ward_id']),
        id: json['_id'],
        receiverName: json['receiver_name'],
        phone: json['phone'],
      );
    }
  }
}
