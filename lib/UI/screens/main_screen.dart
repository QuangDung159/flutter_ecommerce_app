// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/main_bottom_bar_deals_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/main_bottom_bar_home_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/main_bottom_bar_notification_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/main_bottom_bar_profile_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/notification_modal.dart';
import 'package:flutter_ecommerce_app/core/services/address_service.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:flutter_ecommerce_app/core/services/dynamic_link_services.dart';
import 'package:flutter_ecommerce_app/core/services/notification_services.dart';
import 'package:flutter_ecommerce_app/core/services/order_service.dart';
import 'package:flutter_ecommerce_app/core/services/promo_code_service.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    this.initialIndex,
  });

  static String routeName = '/main_screen';
  final int? initialIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;
  GetxAppController getxApp = Get.find<GetxAppController>();

  @override
  void initState() {
    super.initState();

    if (widget.initialIndex != null) {
      setState(() {
        _currentIndex = widget.initialIndex!;
      });
    }

    Future.delayed(Duration(seconds: 2), () {
      DynamicLinkServices.onReceiveTerminateAppDynamicLink();
    });

    if (getxApp.userLogged.value != null) {
      CartServices.fetchListCart();
      AddressService.fetchListCity();
      AddressService.fetchListAddress();
      OrderService.countOrder();
      PromoCodeService.fetchListPromoCodeUser();
      NotificationServices.fetchListNotificationByUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => renderIndexStackBottomTab()),
      bottomNavigationBar: renderBottomTab(),
    );
  }

  Widget renderIndexStackBottomTab() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        MainBottomBarDealsWidget(),
        MainBottomBarHomeWidget(),
        MainBottomBarProfileWidget(),
        if (getxApp.userLogged.value != null) MainBottomBarNotificationWidget(),
      ],
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
        child: Obx(() => renderBottomTabIcon()),
      ),
    );
  }

  SalomonBottomBar renderBottomTabIcon() {
    return SalomonBottomBar(
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
        if (getxApp.userLogged.value != null)
          SalomonBottomBarItem(
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  size: 20,
                ),
                Obx(() => renderNotiDot()),
              ],
            ),
            title: Text('Notification'),
          ),
      ],
    );
  }

  Widget renderNotiDot() {
    GetxAppController getxApp = Get.find<GetxAppController>();

    List<NotificationModel> listNoti = getxApp.listNoti;
    int countUnread = 0;
    for (var element in listNoti) {
      if (!element.isRead) {
        countUnread += 1;
      }
    }

    return Positioned(
      right: 0,
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: countUnread > 0 ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
