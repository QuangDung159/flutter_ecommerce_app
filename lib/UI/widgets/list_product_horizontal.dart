// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/product_item_horizontal.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';

class ListProductHorizontal extends StatefulWidget {
  const ListProductHorizontal({
    super.key,
    required this.title,
    this.isShowSeeAll,
    required this.listProduct,
    this.onTapSeeAll,
  });

  final String title;
  final bool? isShowSeeAll;
  final List<ProductModel> listProduct;
  final Function()? onTapSeeAll;

  @override
  State<ListProductHorizontal> createState() => _ListProductHorizontalState();
}

class _ListProductHorizontalState extends State<ListProductHorizontal> {
  List<Widget> renderListChild() {
    List<Widget> list = [];

    for (var i = 0; i < widget.listProduct.length; i++) {
      EdgeInsets padding = EdgeInsets.only(right: 13);

      if (i == 0) {
        padding = EdgeInsets.only(right: 13, left: AppDimension.contentPadding);
      }

      if (i == widget.listProduct.length - 1) {
        padding = EdgeInsets.only(right: AppDimension.contentPadding);
      }

      list.add(
        Container(
          padding: padding,
          child: ProductItemHorizontal(
            productItem: widget.listProduct[i],
            width: 130,
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
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.isShowSeeAll ?? false)
                GestureDetector(
                  onTap: () {
                    if (widget.onTapSeeAll != null) {
                      widget.onTapSeeAll!();
                    }
                  },
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
