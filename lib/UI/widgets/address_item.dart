// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/address_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:get/get.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    Key? key,
    this.isSelected,
    required this.addressModel,
  }) : super(key: key);

  final bool? isSelected;
  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    String fullAddress =
        '${addressModel.addressLine}, ${addressModel.ward.name}, ${addressModel.district.name}, ${addressModel.city.name}';
    GetxAppController getx = Get.find<GetxAppController>();

    return GestureDetector(
      onTap: () {
        getx.setAddressSelected(addressModel);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected ?? false ? AppColors.blackPrimary : Colors.white,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetHelper.iconMap,
              width: 24,
            ),
            SizedBox(
              width: 12,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          addressModel.receiverName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(addressModel.phone),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    fullAddress,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.greyMid,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
