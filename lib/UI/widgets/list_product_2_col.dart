// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/product_item_horizontal.dart';
import 'package:flutter_ecommerce_app/UI/widgets/sort_filter_section_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';

class ListProduct2Col extends StatefulWidget {
  const ListProduct2Col({
    super.key,
    required this.listProduct,
    this.paddingBottom,
  });

  final List<ProductModel> listProduct;
  final double? paddingBottom;

  @override
  State<ListProduct2Col> createState() => _ListProduct2ColState();
}

class _ListProduct2ColState extends State<ListProduct2Col> {
  List<ProductModel> listLeft = [];
  List<ProductModel> listRight = [];

  @override
  void initState() {
    super.initState();
  }

  void generateList() {
    List<ProductModel> left = [];
    List<ProductModel> right = [];

    for (var i = 0; i < widget.listProduct.length; i++) {
      if (i % 2 != 0) {
        right.add(widget.listProduct[i]);
      } else {
        left.add(widget.listProduct[i]);
      }
    }

    setState(() {
      listLeft = left;
      listRight = right;
    });
  }

  List<Widget> listRow() {
    List<Widget> list = [];

    for (var i = 0; i < listRight.length; i++) {
      list.add(
        Container(
          padding: EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: ProductItemHorizontal(
                  productItem: listLeft[i],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Flexible(
                flex: 1,
                child: ProductItemHorizontal(
                  productItem: listRight[i],
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (listLeft.length > listRight.length) {
      list.add(
        Container(
          padding: EdgeInsets.only(
            bottom: AppDimension.contentPadding,
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: ProductItemHorizontal(
                  productItem: listLeft[listLeft.length - 1],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    generateList();
    return Container(
      padding: EdgeInsets.only(
        left: AppDimension.contentPadding,
        right: AppDimension.contentPadding,
        bottom: widget.paddingBottom ?? 0,
      ),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          SortFilterSectionWidget(),
          SizedBox(
            height: 18,
          ),
          if (widget.listProduct.isEmpty)
            Center(
              child: CupertinoActivityIndicator(),
            ),
          Column(
            children: listRow(),
          )
        ],
      ),
    );
  }
}
