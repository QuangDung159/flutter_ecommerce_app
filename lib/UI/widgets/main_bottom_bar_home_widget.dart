// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar_store.dart';

class MainBottomBarHomeWidget extends StatefulWidget {
  const MainBottomBarHomeWidget({super.key});

  @override
  State<MainBottomBarHomeWidget> createState() =>
      _MainBottomBarHomeWidgetState();
}

class _MainBottomBarHomeWidgetState extends State<MainBottomBarHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBarStore(),
          Center(
            child: Text(
              'asd',
            ),
          )
        ],
      ),
    );
  }
}
