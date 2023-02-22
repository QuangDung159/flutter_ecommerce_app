// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/datetime_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_model.dart';
import 'package:flutter_ecommerce_app/core/data/promotion_user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class VoucherDetailScreen extends StatefulWidget {
  const VoucherDetailScreen({
    super.key,
    required this.showUseButton,
    required this.promotionUserModel,
  });

  final bool showUseButton;
  final PromotionUserModel promotionUserModel;

  @override
  State<VoucherDetailScreen> createState() => _VoucherDetailScreenState();
}

class _VoucherDetailScreenState extends State<VoucherDetailScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();

  @override
  Widget build(BuildContext context) {
    PromotionModel promotionModel = widget.promotionUserModel.promotion;
    DateTimeModel dateTimeModel = getDateTimeFromString(
      promotionModel.endDate,
    );

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SizedBox(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).padding.top,
            ),
            MyAppBar(
              hasBackButton: true,
              title: 'My voucher',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.contentPadding,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 49,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text(
                                        widget.promotionUserModel.promotion.code,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.greyScale,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        widget.promotionUserModel.promotion.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                AssetHelper.iconCalendar,
                                                width: 15,
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${dateTimeModel.year}/${dateTimeModel.month}/${dateTimeModel.day}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.greyScale,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: AppDimension.contentPadding,
                                      ),
                                      renderHtml(
                                        widget.promotionUserModel.promotion.desc,
                                      ),
                                      if (widget.showUseButton)
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 16,
                                            ),
                                            ButtonWidget(
                                              title: 'Use',
                                              opTap: () {
                                                getxAppController
                                                    .setPromotionSelected(
                                                  widget.promotionUserModel,
                                                );
                                                Get.close(2);
                                              },
                                            ),
                                          ],
                                        ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 25,
                            child: renderIcon(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderHtml(String? content) {
    if (content == null || content == '') {
      return Text('No information');
    }

    Widget html = Html(
      data: content,
      style: {
        'body': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
        ),
        'p': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
        ),
      },
    );
    return html;
  }

  Widget renderIcon() {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Image.asset(
        AssetHelper.iconPromo,
        width: 30,
        height: 30,
        color: AppColors.primary,
      ),
    );
  }
}
