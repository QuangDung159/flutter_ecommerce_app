// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_2_col.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';

class TabNewArrivalsWidget extends StatefulWidget {
  const TabNewArrivalsWidget({super.key});

  @override
  State<TabNewArrivalsWidget> createState() => _TabNewArrivalsWidgetState();
}

class _TabNewArrivalsWidgetState extends State<TabNewArrivalsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListProduct2Col(
        listProduct: listProductDummy,
      ),
    );
  }
}
