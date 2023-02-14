// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/main_bottom_bar_deals_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/main_bottom_bar_home_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/main_bottom_bar_profile_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static String routeName = '/main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          MainBottomBarDealsWidget(),
          MainBottomBarHomeWidget(),
          MainBottomBarProfileWidget(),
        ],
      ),
      bottomNavigationBar: renderBottomTab(),
    );
  }

  Widget renderBottomTab() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.greyScale.withOpacity(0.2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Container(
        color: Colors.white,
        child: SalomonBottomBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.greyScale,
          margin: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 10,
          ),
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                Icons.shopify_outlined,
                size: 20,
              ),
              title: Text('Deals'),
            ),
            SalomonBottomBarItem(
              icon: Icon(
                Icons.home_sharp,
                size: 20,
              ),
              title: Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 20,
              ),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
