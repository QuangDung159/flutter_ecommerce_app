// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/textfield_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/voucher_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:get/get.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();
  String promoCodeInput = '';

  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).padding.top,
          ),
          MyAppBar(
            hasBackButton: true,
            title: 'My voucher',
          ),
          renderInputPromoCode(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimension.contentPadding / 2,
                  ),
                  Column(
                    children: renderListVoucherItem(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderInputPromoCode() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextFieldWidget(
              controller: textFieldController,
              hintText: 'Enter a promo code',
              onChanged: (value) {
                setState(() {
                  promoCodeInput = value;
                });
              },
            ),
          ),
          SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                promoCodeInput = '';
              });

              textFieldController.text = '';
            },
            child: Text(
              'Add',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> renderListVoucherItem() {
    List<Widget> listRender = [];

    for (var i = 0; i < listPromotionUserDummy.length; i++) {
      listRender.add(
        VoucherItem(
          promotionUserModel: listPromotionUserDummy[i],
          isLastItem: i == listPromotionUserDummy.length - 1,
        ),
      );
    }

    return listRender;
  }
}