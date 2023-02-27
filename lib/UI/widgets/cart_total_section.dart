// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/voucher_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_info_row_text.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/data/shipping_policy_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:get/get.dart';

class CartTotalSection extends StatefulWidget {
  const CartTotalSection({
    super.key,
    required this.buttonTitle,
    required this.onTapButton,
  });

  final String buttonTitle;
  final Function() onTapButton;

  @override
  State<CartTotalSection> createState() => _CartTotalSectionState();
}

class _CartTotalSectionState extends State<CartTotalSection> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => renderTotalSection());
  }

  Widget renderTotalSection() {
    GetxAppController getxAppController = Get.find<GetxAppController>();
    List listCartItemCheckout = getxAppController.listCartItemCheckout;
    ShippingPolicyModel shippingSelected =
        getxAppController.shippingPolicySelected.value;

    PromotionUserModel? promotionSelected =
        getxAppController.promotionSelected.value;

    bool hasSelectedPromotion = promotionSelected != null;

    double discount = hasSelectedPromotion
        ? double.parse(promotionSelected.promotion.value)
        : 0.0;
    double subtotal = CartServices.calSubtotal(listCartItemCheckout);
    double total = CartServices.calTotal();

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
        vertical: AppDimension.contentPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.to(
                  () => VoucherScreen(),
                ),
                child: Text(
                  promotionSelected?.promotion.code ?? 'Choose promo code',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (!hasSelectedPromotion) {
                    Get.to(
                      () => VoucherScreen(
                        navigationFrom: 'delivery_screen',
                      ),
                    );
                  } else {
                    getxAppController.setPromotionSelected(null);
                  }
                },
                child: Image.asset(
                  hasSelectedPromotion
                      ? AssetHelper.iconCancel
                      : AssetHelper.iconChevronRight,
                  width: hasSelectedPromotion ? 15 : 6,
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          CartInfoRowText(
            title: 'Subtotal',
            value: formatPrice(
              subtotal.toString(),
            ),
          ),
          CartInfoRowText(
            title: 'Delivery',
            value: formatPrice(
              shippingSelected.fee,
            ).toString(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.orangeSecondary,
                ),
              ),
              Text(
                '- ${formatPrice(discount.toString())}',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.orangeSecondary,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 12,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: AppColors.border,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                formatPrice(
                  total.toString(),
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.orangeSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppDimension.contentPadding,
          ),
          ButtonWidget(
            label: widget.buttonTitle,
            backgroundColor: getxAppController.listCartItemCheckout.isEmpty
                ? AppColors.greyMid
                : AppColors.primary,
            onTap: () {
              widget.onTapButton();
            },
          ),
        ],
      ),
    );
  }
}
