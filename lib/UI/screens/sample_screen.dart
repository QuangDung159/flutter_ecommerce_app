// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:get/get.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SizedBox(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).padding.top,
            ),
            MyAppBar(
              hasBackButton: true,
              title: 'My cart',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 12),
                      height: 120,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Text('asd'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimension.contentPadding,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('asd'),
                      Text('asd'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('asd'),
                      Text('asd'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimension.contentPadding,
                vertical: AppDimension.contentPadding,
              ),
              child: Column(
                children: [
                  LoadingButtonWidget(
                    label: 'Payment',
                    backgroundColor: getxAppController.listCartItem.isEmpty
                        ? AppColors.greyMid
                        : AppColors.primary,
                    onTap: () {
                      if (getxAppController.listCartItem.isNotEmpty) {
                        Get.to(() => SampleScreen());
                      }
                    },
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
