// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

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
    return Container(
      color: Colors.green,
      constraints: BoxConstraints.expand(),
    );
  }
}
