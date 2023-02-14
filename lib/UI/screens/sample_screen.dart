// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
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
                    Container(
                      height: 200,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
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
