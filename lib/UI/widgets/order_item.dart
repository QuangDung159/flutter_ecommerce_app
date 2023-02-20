// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/data/order_item_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    this.isEndItem,
    required this.orderItemModel,
  }) : super(key: key);

  final bool? isEndItem;
  final OrderItemModel orderItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: isEndItem ?? false ? Colors.white : AppColors.border,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  orderItemModel.product.thumbnail,
                  width: 60,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderItemModel.product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Black, Size S',
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text('x1'),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
