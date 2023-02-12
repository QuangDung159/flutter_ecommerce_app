// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class TabFeaturedWidget extends StatefulWidget {
  const TabFeaturedWidget({super.key});

  @override
  State<TabFeaturedWidget> createState() => _TabFeaturedWidgetState();
}

class _TabFeaturedWidgetState extends State<TabFeaturedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Featured'),
    );
  }
}
