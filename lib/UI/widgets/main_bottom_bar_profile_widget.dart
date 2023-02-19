// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/more_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/version_text.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
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
                    renderAvatarSection(),
                    renderShoppingInfoSection(),
                    SizedBox(
                      height: AppDimension.contentPadding,
                    ),
                    renderReferCodeSection(),
                    SizedBox(
                      height: AppDimension.contentPadding,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.contentPadding,
                      ),
                      child: ButtonWidget(title: 'Logout', opTap: () {}),
                    ),
                    SizedBox(
                      height: AppDimension.contentPadding,
                    ),
                    VersionText(
                      textColor: AppColors.greyDark,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderReferCodeSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(AssetHelper.imageReferBackground),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(AssetHelper.imageGradientProfile),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppDimension.contentPadding,
                      ),
                      Text(
                        'Refer a friend and get reward.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Terms and conditions apply.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: renderReferCode(),
          )
        ],
      ),
    );
  }

  Widget renderShoppingInfoSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      child: Row(
        children: [
          renderAccountShoppingInfoItem(
            'Cart',
            '2',
            Image.asset(
              AssetHelper.iconCartBag,
              width: 20,
              height: 20,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          renderAccountShoppingInfoItem(
            'Orders',
            '2',
            Image.asset(
              AssetHelper.iconOrder,
              width: 20,
              height: 20,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          renderAccountShoppingInfoItem(
            'Vouchers',
            '2',
            Image.asset(
              AssetHelper.iconPromo,
              width: 20,
              height: 20,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderAccountShoppingInfoItem(
      String title, String value, Widget icon) {
    return Flexible(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.yellowLight.withOpacity(0.4),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(
                  ' $value',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget renderAvatarSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding * 2,
        vertical: AppDimension.contentPadding,
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(85),
            child: Image.asset(
              AssetHelper.imageAvatar,
              width: 85,
              height: 85,
            ),
          ),
          SizedBox(
            width: AppDimension.contentPadding,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lư Quảng Dũng',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'quangdunglu159@gmail.com',
                  style: TextStyle(color: AppColors.greyScale, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget renderReferCode() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetHelper.iconCopy,
            width: 24,
          ),
          Text(
            'asdasd',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            AssetHelper.iconShare,
            width: 24,
          ),
        ],
      ),
    );
  }
}
