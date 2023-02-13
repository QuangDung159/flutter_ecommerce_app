// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_horizontal.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_category.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class TabFeaturedWidget extends StatefulWidget {
  const TabFeaturedWidget({super.key});

  @override
  State<TabFeaturedWidget> createState() => _TabFeaturedWidgetState();
}

class _TabFeaturedWidgetState extends State<TabFeaturedWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 44,
              color: AppColors.blackPrimary,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.contentPadding,
                  ),
                  child: Text(
                    'End of Season Sale: Up to 50% off + Low in Stock',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            renderTopPanel('Under Amour', AssetHelper.panelHome1),
            SizedBox(
              height: 24,
            ),
            Text(
              'Summer Sale',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Up to 50% off with code: SS50',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Selected marked products excluded from promo',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ListCategory(),
            SizedBox(
              height: 30,
            ),
            ListProductHorizontal(
              title: 'New Arrivals',
              listProduct: listProductDummy,
              isShowSeeAll: true,
            ),
            SizedBox(
              height: 30,
            ),
            ListProductHorizontal(
              title: 'Sale Items',
              listProduct: listProductDummy,
              isShowSeeAll: true,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimension.contentPadding,
              ),
              child: renderTopPanel(
                'New Arrivals',
                AssetHelper.panelHome2,
                hasBorderRadius: true,
                titlePadding: 16,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListProductHorizontal(
              title: 'Recently Viewed',
              listProduct: listProductDummy,
              isShowSeeAll: true,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 30,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppDimension.contentPadding,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(AssetHelper.panelHome3),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(AssetHelper.gradientHome),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: AppDimension.contentPadding,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Stay active at home with videos and audio workouts, all free with your membership!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: Text(
                              'Explore LevelUP Benefits',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderTopPanel(String leftText, String imagePath,
      {bool? hasBorderRadius, double? titlePadding}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: hasBorderRadius ?? false
              ? BorderRadius.circular(12)
              : BorderRadius.zero,
          child: Image.asset(imagePath),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            // Clip it cleanly.
            borderRadius: hasBorderRadius ?? false
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )
                : BorderRadius.zero,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                // width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.1),
                alignment: Alignment.center,
                height: 50,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: titlePadding ?? AppDimension.contentPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        leftText,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Shop now',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: 21,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.amber,
          height: 12,
          width: 123,
        )
      ],
    );
  }
}
