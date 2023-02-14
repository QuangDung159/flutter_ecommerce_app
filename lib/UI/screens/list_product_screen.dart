// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_2_col.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              hasBackButton: true,
              title: widget.title,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListProduct2Col(
                      listProduct: listProductDummy,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
