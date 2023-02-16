// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_icon.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  Widget renderDotIndicator(BuildContext context) {
    return Positioned(
      bottom: 7,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotWidth: 4,
                dotHeight: 4,
                activeDotColor: AppColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderTopBar(double statusBarHeight) {
    return Positioned(
      top: statusBarHeight,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimension.contentPadding,
        ),
        // color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.greyDark.withOpacity(0.6),
                ),
                child: Image.asset(
                  AssetHelper.iconChevronLeft,
                  width: 8,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.greyDark.withOpacity(0.6),
                  ),
                  child: Image.asset(
                    AssetHelper.iconSearch,
                    width: 14,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.greyDark.withOpacity(0.6),
                  ),
                  child: CartIcon(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    ProductModel product = widget.product;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: PageView(
                  controller: _pageController,
                  children: [
                    Image.network(
                      product.productImages[0].url,
                    ),
                    Image.network(
                      product.productImages[1].url,
                    ),
                    Image.network(
                      product.productImages[2].url,
                    ),
                  ],
                ),
              ),
              renderDotIndicator(context),
              renderTopBar(statusBarHeight)
            ],
          )
        ],
      ),
    );
  }
}
