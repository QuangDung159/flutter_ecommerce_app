// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/address_item.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/textfield_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();

  final addressLineInputController = TextEditingController();
  final receiverNameInputController = TextEditingController();
  final phoneInputController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    addressLineInputController.dispose();
    receiverNameInputController.dispose();
    phoneInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).padding.top,
            ),
            MyAppBar(
              hasBackButton: true,
              title: 'Delivery address',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.only(bottom: 12),
                  child: Obx(
                    () => Column(
                      children: renderListAddress(),
                    ),
                  ),
                ),
              ),
            ),
            renderAddressInputSection(),
          ],
        ),
      ),
    );
  }

  List<Widget> renderListAddress() {
    List<Widget> listRendered = [];
    GetxAppController getxApp = Get.find<GetxAppController>();

    for (var i = 0; i < listAddressDummy.length; i++) {
      listRendered.add(
        AddressItem(
          isSelected: getxApp.addressSelected.value == null
              ? false
              : getxApp.addressSelected.value!.id == listAddressDummy[i].id,
          addressModel: listAddressDummy[i],
        ),
      );
    }

    return listRendered;
  }

  Widget renderAddressInputSection() {
    GetxAppController getx = Get.find<GetxAppController>();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      color: Colors.white,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              'Add new address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextFieldWidget(
              controller: addressLineInputController,
              hintText: 'Enter your address',
            ),
            SizedBox(
              height: 12,
            ),
            TextFieldWidget(
              controller: receiverNameInputController,
              hintText: 'Enter receiver name',
            ),
            SizedBox(
              height: 12,
            ),
            TextFieldWidget(
              controller: phoneInputController,
              hintText: 'Enter receiver phone',
            ),
            SizedBox(
              height: 12,
            ),
            renderDropdownButton(
              getx.citySelected.value.name,
              'city',
            ),
            renderDropdownButton(
              getx.districtSelected.value.name,
              'district',
            ),
            renderDropdownButton(
              getx.wardSelected.value.name,
              'ward',
            ),
            ButtonWidget(title: 'Add', opTap: () {}),
            SizedBox(
              height: AppDimension.contentPadding,
            ),
          ],
        ),
      ),
    );
  }

  Widget renderDropdownButton(String title, String locationType) {
    return GestureDetector(
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Container(
              color: Colors.white,
              height: 200,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    AssetHelper.iconBottomSheet,
                    width: 40,
                    height: 4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView(
                        children: renderListLocation(
                          getxAppController,
                          locationType,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
        ),
        margin: EdgeInsets.only(bottom: 12),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Image.asset(
                AssetHelper.iconChevronDown,
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderLocationItem(dynamic locationItem, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(bottom: 12),
      alignment: Alignment.center,
      child: Text(
        locationItem.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: isSelected ? AppColors.primary : AppColors.greyDark,
        ),
      ),
    );
  }

  List<Widget> renderListLocation(GetxAppController getx, String locationType) {
    List<Widget> listRender = [];
    CityModel citySelected = getx.citySelected.value;
    DistrictModel districtSelected = getx.districtSelected.value;
    WardModel wardSelected = getx.wardSelected.value;

    switch (locationType) {
      case 'city':
        for (var cityItem in listCityDummy) {
          listRender.add(
            GestureDetector(
              onTap: () {
                getx.setData(
                  citySelected: cityItem,
                );
              },
              child: renderLocationItem(
                cityItem,
                cityItem.id == citySelected.id,
              ),
            ),
          );
        }
        break;
      case 'district':
        for (var districtItem in listCityDummy[1].listDistrict!) {
          listRender.add(
            GestureDetector(
              onTap: () {
                getx.setData(
                  districtSelected: districtItem,
                );
              },
              child: renderLocationItem(
                districtItem,
                districtItem.id == districtSelected.id,
              ),
            ),
          );
        }
        break;
      default:
        for (var wardItem in listCityDummy[1].listDistrict![0].listWard!) {
          listRender.add(
            GestureDetector(
              onTap: () {
                getx.setData(
                  wardSelected: wardItem,
                );
              },
              child: renderLocationItem(
                wardItem,
                wardItem.id == wardSelected.id,
              ),
            ),
          );
        }
        break;
    }

    return listRender;
  }
}
