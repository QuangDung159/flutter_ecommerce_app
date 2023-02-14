// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/more_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:get/get.dart';

class MainBottomBarProfileWidget extends StatefulWidget {
  const MainBottomBarProfileWidget({super.key});

  @override
  State<MainBottomBarProfileWidget> createState() =>
      _MainBottomBarProfileWidgetState();
}

class _MainBottomBarProfileWidgetState
    extends State<MainBottomBarProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              title: 'Profile',
              action: GestureDetector(
                onTap: () => Get.to(() => MoreScreen()),
                child: Image.asset(
                  AssetHelper.iconMore,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
