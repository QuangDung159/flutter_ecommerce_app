// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar_store.dart';
import 'package:flutter_ecommerce_app/UI/widgets/benefit_banner.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_horizontal.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/services/product_service.dart';
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
  List<ProductModel> listFitnessProducts = [];
  List<ProductModel> listFitnessClasses = [];
  List<ProductModel> listVirtualRuns = [];

  onFetch() async {
    await Future.wait([
      fetchListListProduct('Fitness Products'),
      fetchListListProduct('Fitness Classes'),
      fetchListListProduct('Virtual Runs'),
    ]);
  }

  Future<void> fetchListListProduct(String category) async {
    List<ProductModel> list = await ProductService.fetchListProductHome(
      category: category,
      limit: 5,
      page: 1,
    );

    switch (category) {
      case 'Fitness Products':
        setState(() {
          listFitnessProducts = list;
        });
        break;
      case 'Fitness Classes':
        setState(() {
          listFitnessClasses = list;
        });
        break;
      default:
        {
          setState(() {
            listVirtualRuns = list;
          });
        }
    }
  }

  @override
  void initState() {
    super.initState();

    onFetch();
  }

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
                    listProduct: listFitnessProducts,
                    isShowSeeAll: true,
                    onTapSeeAll: () => Get.to(
                      () => ListProductScreen(
                        title: 'Fitness Products',
                        category: 'Fitness Products',
                      ),
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
                    listProduct: listFitnessClasses,
                    isShowSeeAll: true,
                    onTapSeeAll: () => Get.to(
                      () => ListProductScreen(
                        title: 'Fitness Classes',
                        category: 'Fitness Classes',
                      ),
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
                    listProduct: listVirtualRuns,
                    isShowSeeAll: true,
                    onTapSeeAll: () => Get.to(
                      () => ListProductScreen(
                        title: 'Virtual Runs',
                        category: 'Virtual Runs',
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => renderListRecentlyViewed(),
                ),
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

  Widget renderListRecentlyViewed() {
    List<ProductModel> listRecentlyViewed = getxApp.listRecentlyViewed;

    if (listRecentlyViewed.isEmpty) {
      return Container();
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: AppDimension.contentPadding,
      ),
      child: ListProductHorizontal(
        title: 'Recently Viewed',
        listProduct: listRecentlyViewed,
      ),
    );
  }
}
