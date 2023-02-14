// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/splash_screen.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/services/sort_filter_services.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Get.put(GetxAppController());

    SortFilterServices.initListFilter();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarBrightness: Brightness.dark,
    // ));
    return GetMaterialApp(
      title: 'Flutter E-Commerce App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        backgroundColor: AppColors.scaffoldBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
