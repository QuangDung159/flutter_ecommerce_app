// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/voucher_detail_screen.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:get/get.dart';

class VoucherItem extends StatelessWidget {
  const VoucherItem({
    Key? key,
    required this.promotionUserModel,
    required this.isLastItem,
    required this.showUseButton,
  }) : super(key: key);

  final PromotionUserModel promotionUserModel;
  final bool isLastItem;
  final bool showUseButton;

  @override
  Widget build(BuildContext context) {
    GetxAppController getxAppController = Get.find<GetxAppController>();
    bool isUsed = false;

    if (getxAppController.promotionSelected.value != null) {
      isUsed = getxAppController.promotionSelected.value!.id ==
          promotionUserModel.id;
    }

    return Container(
      margin: EdgeInsets.only(
        top: 12,
        bottom: isLastItem ? AppDimension.contentPadding : 0,
      ),
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
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => VoucherDetailScreen(
                      promotionUserModel: promotionUserModel,
                      showUseButton: showUseButton,
                    ),
                  );
                },
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
                        RichText(
                          text: TextSpan(
                            text: '${promotionUserModel.promotion.code} ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                            children: [
                              TextSpan(
                                text: '- ${promotionUserModel.promotion.title}',
                                style: TextStyle(
                                  color: AppColors.blackPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Expiry date: ',
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
            ),
            Flexible(
              flex: 80,
              child: GestureDetector(
                onTap: () {
                  if (showUseButton) {
                    getxAppController.setPromotionSelected(promotionUserModel);
                    Get.back();
                  } else {
                    Get.to(
                      () => VoucherDetailScreen(
                        promotionUserModel: promotionUserModel,
                        showUseButton: showUseButton,
                      ),
                    );
                  }
                },
                child: Center(
                  child: Text(
                    showUseButton
                        ? isUsed
                            ? 'Used'
                            : 'Use'
                        : 'Detail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.orangeSecondary,
                    ),
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
