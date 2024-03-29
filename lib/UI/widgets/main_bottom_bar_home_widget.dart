// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar_store.dart';
import 'package:flutter_ecommerce_app/UI/widgets/featured_main_content.dart';

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
        Expanded(
          child: FeaturedMainContent(),
        ),
      ],
    );
  }
}
