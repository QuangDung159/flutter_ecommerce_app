// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PaymentCardItem extends StatefulWidget {
  const PaymentCardItem({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentCardItem> createState() => _PaymentCardItemState();
}

class _PaymentCardItemState extends State<PaymentCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      color: Colors.white,
      child: Slidable(
        // Specify a key if the Slidable is dismissible.
        // key: ValueKey(widget.cartItem.id),
        endActionPane: ActionPane(
          extentRatio: 64 / MediaQuery.of(context).size.width,
          openThreshold: 0.1,
          closeThreshold: 0.8,
          // dismissible: DismissiblePane(onDismissed: () {}),
          motion: BehindMotion(),
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  color: AppColors.orangeSecondary,
                  child: Image.asset(
                    AssetHelper.iconTrash,
                    width: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimension.contentPadding,
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetHelper.iconVisa,
                    width: 48,
                    height: 48,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '**** **** **** 4242',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Visa',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                'Default',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
