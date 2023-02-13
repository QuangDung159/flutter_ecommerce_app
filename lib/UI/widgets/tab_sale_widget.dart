// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_2_col.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';

class TabSaleWidget extends StatefulWidget {
  const TabSaleWidget({super.key});

  @override
  State<TabSaleWidget> createState() => _TabSaleWidgetState();
}

class _TabSaleWidgetState extends State<TabSaleWidget> {
  @override
  void initState() {
    super.initState();
    print('asd');
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
