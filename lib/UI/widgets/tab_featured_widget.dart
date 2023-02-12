// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class TabFeaturedWidget extends StatefulWidget {
  const TabFeaturedWidget({super.key});

  @override
  State<TabFeaturedWidget> createState() => _TabFeaturedWidgetState();
}

class _TabFeaturedWidgetState extends State<TabFeaturedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Stack(
          children: [
            Image.asset(AssetHelper.panelHome1),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                // Clip it cleanly.
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    color: Colors.grey.withOpacity(0.1),
                    alignment: Alignment.center,
                    height: 50,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Under Amour',
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
        )
      ],
    );
  }
}
