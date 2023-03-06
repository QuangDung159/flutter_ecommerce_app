// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_2_col.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/services/product_service.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({
    super.key,
    required this.title,
    this.category,
  });

  final String title;
  final String? category;

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  List<ProductModel> listProduct = [];

  @override
  void initState() {
    super.initState();

    fetchListListProduct(widget.category ?? '');
  }

  void fetchListListProduct(String category) async {
    List<ProductModel> list =
        await ProductService.fetchListProductHome(category: category);
    setState(() {
      listProduct = list;
    });
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
                      listProduct: listProduct,
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
