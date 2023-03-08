// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar_store.dart';
import 'package:flutter_ecommerce_app/UI/widgets/benefit_banner.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_horizontal.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:get/get.dart';

import '../screens/list_product_screen.dart';

class MainBottomBarDealsWidget extends StatefulWidget {
  const MainBottomBarDealsWidget({super.key});

  @override
  State<MainBottomBarDealsWidget> createState() =>
      _MainBottomBarDealsWidgetState();
}

class _MainBottomBarDealsWidgetState extends State<MainBottomBarDealsWidget> {
  final GetxAppController getxApp = Get.find<GetxAppController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).padding.top,
        ),
        AppBarStore(
          title: 'Deals',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppColors.blackPrimary,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Summer Sale',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Up to 50% off with code: SS50',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimension.contentPadding,
                  ),
                  child: ListProductHorizontal(
                    title: 'Fitness Products',
                    listProduct: listProductDummy,
                    isShowSeeAll: true,
                    onTapSeeAll: () => Get.to(
                      () => ListProductScreen(title: 'Fitness Products'),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimension.contentPadding,
                  ),
                  child: ListProductHorizontal(
                    title: 'Fitness Classes',
                    listProduct: listProductDummy,
                    isShowSeeAll: true,
                    onTapSeeAll: () => Get.to(
                      () => ListProductScreen(title: 'Fitness Classes'),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimension.contentPadding,
                  ),
                  child: ListProductHorizontal(
                    title: 'Virtual Runs',
                    listProduct: listProductDummy,
                    isShowSeeAll: true,
                    onTapSeeAll: () => Get.to(
                      () => ListProductScreen(title: 'Virtual Runs'),
                    ),
                  ),
                ),
                // if (getxApp.listRecentlyViewed.isNotEmpty)
                //   Obx(
                //     () => renderListRecentlyViewed(getxApp.listRecentlyViewed),
                //   ),
                Container(
                  height: 30,
                  color: Colors.white,
                ),
                Container(
                  color: Colors.white,
                  child: BenefitBanner(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget renderListRecentlyViewed(List<ProductModel> listRecentlyViewed) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: AppDimension.contentPadding,
      ),
      child: ListProductHorizontal(
        title: 'Recently Viewed',
        listProduct: listRecentlyViewed,
        isShowSeeAll: true,
        onTapSeeAll: () => Get.to(
          () => ListProductScreen(title: 'Recently Viewed'),
        ),
      ),
    );
  }
}
