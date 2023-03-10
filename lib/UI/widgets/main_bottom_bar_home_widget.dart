// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar_store.dart';
import 'package:flutter_ecommerce_app/UI/widgets/tab_featured_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/tab_new_arrivals_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/tab_sale_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class MainBottomBarHomeWidget extends StatefulWidget {
  const MainBottomBarHomeWidget({super.key});

  @override
  State<MainBottomBarHomeWidget> createState() =>
      _MainBottomBarHomeWidgetState();
}

class _MainBottomBarHomeWidgetState extends State<MainBottomBarHomeWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).padding.top,
        ),
        AppBarStore(),
        Container(
          color: Colors.white,
          child: TabBar(
            unselectedLabelColor: AppColors.greyScale,
            labelColor: AppColors.primary,
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                text: 'Featured',
              ),
              Tab(
                text: 'New Arrivals',
              ),
              Tab(
                text: 'Sale',
              )
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.primary,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              TabFeaturedWidget(),
              TabNewArrivalsWidget(),
              TabSaleWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
