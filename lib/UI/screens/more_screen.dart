// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/delivery_address_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/profile_menu_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:get/get.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              hasBackButton: true,
              title: 'More',
              action: GestureDetector(
                onTap: () {
                  getxAppController.setData(listFilterSelected: []);
                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.orangeSecondary,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 34,
                    ),
                    ProfileMenuItem(
                      title: 'My purchase',
                    ),
                    ProfileMenuItem(
                      title: 'Address book',
                      onTap: () => Get.to(() => DeliveryAddressScreen()),
                    ),
                    ProfileMenuItem(
                      title: 'Payment methods',
                    ),
                    ProfileMenuItem(
                      title: 'Settings',
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
