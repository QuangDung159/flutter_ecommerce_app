// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/address_item.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/textfield_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/address_model.dart';
import 'package:flutter_ecommerce_app/core/data/city_model.dart';
import 'package:flutter_ecommerce_app/core/data/district_model.dart';
import 'package:flutter_ecommerce_app/core/data/ward_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/address_service.dart';
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

  Future<void> onSubmitAddress() async {
    await AddressService.submitCreateAddress(
      addressLine: addressLineInputController.text,
      phone: phoneInputController.text,
      receiverName: receiverNameInputController.text,
    );

    addressLineInputController.text = '';
    receiverNameInputController.text = '';
    phoneInputController.text = '';
  }

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
    List<AddressModel> listAddress = getxAppController.listAddress;
    AddressModel? addressSelected = getxAppController.addressSelected.value;

    for (var i = 0; i < listAddress.length; i++) {
      listRendered.add(
        AddressItem(
          isSelected: addressSelected == null
              ? false
              : addressSelected.id == listAddress[i].id,
          addressModel: listAddress[i],
        ),
      );
    }

    if (listRendered.isEmpty) {
      return [
        Center(
          child: Text('Address book empty'),
        ),
      ];
    }

    return listRendered;
  }

  Widget renderAddressInputSection() {
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
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 12,
            ),
            renderDropdownButton(
              getxAppController.citySelected.value.name,
              'city',
              getxAppController.citySelected.value.id,
            ),
            renderDropdownButton(getxAppController.districtSelected.value.name,
                'district', getxAppController.districtSelected.value.id),
            renderDropdownButton(getxAppController.wardSelected.value.name,
                'ward', getxAppController.wardSelected.value.id),
            LoadingButtonWidget(
                label: 'Add',
                onTap: () async {
                  if (addressLineInputController.text == '' ||
                      receiverNameInputController.text == '' ||
                      phoneInputController.text == '') {
                    showSnackBar(
                      title: 'Warning!',
                      content: 'Please fill all data',
                      isSuccess: false,
                    );
                    return;
                  }

                  return onSubmitAddress();

                  // AddressModel address = AddressModel(
                  //   addressLine: addressLineInputController.text,
                  //   city: getxAppController.citySelected.value,
                  //   district: getxAppController.districtSelected.value,
                  //   ward: getxAppController.wardSelected.value,
                  //   id: listAddress.length,
                  //   receiverName: receiverNameInputController.text,
                  //   phone: phoneInputController.text,
                  // );

                  // listAddress.add(address);
                  // getxAppController.setAddressSelected(address);

                  // addressLineInputController.text = '';
                  // receiverNameInputController.text = '';
                  // phoneInputController.text = '';
                }),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget renderDropdownButton(
    String title,
    String locationType,
    String itemId,
  ) {
    return GestureDetector(
      onTap: () {
        if (itemId == '1') {
          return;
        }

        FocusManager.instance.primaryFocus?.unfocus();
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

    List<DistrictModel> listDistrict = citySelected.listDistrict;
    List<WardModel> listWard = districtSelected.listWard;

    switch (locationType) {
      case 'city':
        for (var cityItem in getx.listCity) {
          listRender.add(
            GestureDetector(
              onTap: () {
                DistrictModel district =
                    AddressService.getDistrictDefault(cityItem);
                WardModel ward = AddressService.getWardDefault(district);

                if (cityItem.id == citySelected.id) {
                  return;
                }

                getx.setData(
                  citySelected: cityItem,
                  districtSelected: district,
                  wardSelected: ward,
                );
                Navigator.of(context).pop();
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
        for (var districtItem in listDistrict) {
          listRender.add(
            GestureDetector(
              onTap: () {
                WardModel ward = AddressService.getWardDefault(districtItem);

                if (districtItem.id == districtSelected.id) {
                  return;
                }

                getx.setData(
                  districtSelected: districtItem,
                  wardSelected: ward,
                );
                Navigator.of(context).pop();
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
        for (var wardItem in listWard) {
          listRender.add(
            GestureDetector(
              onTap: () {
                if (wardItem.id == wardSelected.id) {
                  return;
                }

                getx.setData(
                  wardSelected: wardItem,
                );
                Navigator.of(context).pop();
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
