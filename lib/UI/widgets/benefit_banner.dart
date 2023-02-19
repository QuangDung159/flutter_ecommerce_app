// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class BenefitBanner extends StatelessWidget {
  const BenefitBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}