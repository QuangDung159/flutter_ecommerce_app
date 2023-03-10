// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/payment_card_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/payment_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class PaymentCardItem extends StatefulWidget {
  const PaymentCardItem({
    Key? key,
    required this.paymentCardModel,
    required this.isLastItem,
  }) : super(key: key);

  final PaymentCardModel paymentCardModel;
  final bool isLastItem;

  @override
  State<PaymentCardItem> createState() => _PaymentCardItemState();
}

class _PaymentCardItemState extends State<PaymentCardItem> {
  final GetxAppController getxApp = Get.find<GetxAppController>();

  @override
  Widget build(BuildContext context) {
    PaymentCardModel paymentCardModel = widget.paymentCardModel;

    return Container(
      margin: EdgeInsets.only(
        top: 6,
        bottom: widget.isLastItem ? 6 : 0,
      ),
      color: Colors.white,
      child: Slidable(
        // Specify a key if the Slidable is dismissible.
        key: ValueKey(paymentCardModel.id),
        endActionPane: ActionPane(
          extentRatio: 64 / MediaQuery.of(context).size.width,
          openThreshold: 0.1,
          closeThreshold: 0.8,
          dismissible: DismissiblePane(
            onDismissed: () {
              PaymentService.removeCard(paymentCardModel.id);
            },
          ),
          motion: BehindMotion(),
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  PaymentService.removeCard(paymentCardModel.id);
                },
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
        child: Obx(() => renderCardInfo(paymentCardModel)),
      ),
    );
  }

  Widget renderCardInfo(PaymentCardModel paymentCardModel) {
    bool isDefaultCard = getxApp.paymentCardDefault.value == null
        ? false
        : getxApp.paymentCardDefault.value!.id == paymentCardModel.id;

    return GestureDetector(
      onTap: () {
        getxApp.setPaymentCardDefault(paymentCardModel);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimension.contentPadding,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  getCardLogo(paymentCardModel.cardNumber),
                  width: 35,
                  height: 35,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '**** **** **** ${getLast4(paymentCardModel.cardNumber)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        // color: AppColors.greyDisable
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              'Primary',
              style: TextStyle(
                color:
                    isDefaultCard ? AppColors.primary : AppColors.greyDisable,
                fontWeight: FontWeight.bold,
              ),
            ),
            // if (isDefaultCard)
            //   Text(
            //     'Default',
            //     style: TextStyle(
            //       color: AppColors.primary,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
