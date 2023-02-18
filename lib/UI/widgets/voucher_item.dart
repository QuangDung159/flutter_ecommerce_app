// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({
    Key? key,
    required this.promotionUserModel,
  }) : super(key: key);

  final PromotionUserModel promotionUserModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetHelper.imageVoucherActive,
            ),
            fit: BoxFit.fill,
          ),
        ),
        height: 86,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 263,
              child: Container(
                padding: EdgeInsets.only(
                  left: 22,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${promotionUserModel.promotion.code} - ${promotionUserModel.promotion.title}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Redeem by 24/02/2022',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.greyScale,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 80,
              child: Center(
                child: Text(
                  'Use',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.orangeSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
