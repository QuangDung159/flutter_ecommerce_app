// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/product_item_horizontal.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';

class ListProductHorizontal extends StatefulWidget {
  const ListProductHorizontal({super.key});

  @override
  State<ListProductHorizontal> createState() => _ListProductHorizontalState();
}

class _ListProductHorizontalState extends State<ListProductHorizontal> {
  List<Widget> renderListChild() {
    List<Widget> list = [];

    for (var i = 0; i < listProductDummy.length; i++) {
      EdgeInsets padding = EdgeInsets.only(right: 13);

      if (i == 0) {
        padding = EdgeInsets.only(right: 13, left: AppDimension.contentPadding);
      }

      if (i == listProductDummy.length - 1) {
        padding = EdgeInsets.only(right: AppDimension.contentPadding);
      }

      list.add(
        Container(
          padding: padding,
          child: ProductItemHorizontal(
            productItem: listProductDummy[i],
          ),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimension.contentPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Arrivals',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'See all',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 21,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 18,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: renderListChild(),
          ),
        ),
      ],
    );
  }
}
