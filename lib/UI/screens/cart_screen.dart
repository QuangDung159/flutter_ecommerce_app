// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/bottom_button.dart';
import 'package:flutter_ecommerce_app/UI/widgets/filter_item_level_1.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();
  List<Widget> renderListFilterLevel1() {
    List<Widget> listFilterLevel1Render = [];

    List listFilterLevel1 = getxAppController.listFilterLevel1;

    for (FilterItemModel item in listFilterLevel1) {
      listFilterLevel1Render.add(
        FilterItemLevel1(
          filterItemLevel1: item,
        ),
      );
    }

    return listFilterLevel1Render;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).padding.top,
            ),
            MyAppBar(
              hasBackButton: true,
              title: 'My cart',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 12),
                      padding: EdgeInsets.only(
                        right: AppDimension.contentPadding,
                        left: AppDimension.contentPadding / 2,
                        top: 12,
                        bottom: 12,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              Image.asset(
                                AssetHelper.iconUncheck,
                                width: 18,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: AppDimension.contentPadding / 2,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              listCartItemDummy[1].product.thumbnail,
                              width: 90,
                              height: 90,
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  listCartItemDummy[1].product.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimension.contentPadding,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('asd'),
                      Text('asd'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('asd'),
                      Text('asd'),
                    ],
                  ),
                ],
              ),
            ),
            BottomButton(
              title: 'Checkout',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
