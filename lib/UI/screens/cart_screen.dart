// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_info_row_text.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_item.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/filter_item_level_1.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/filter_item_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: Column(
                    children: [
                      CartItem(cartItem: listCartItemDummy[1]),
                      CartItem(cartItem: listCartItemDummy[0]),
                      CartItem(cartItem: listCartItemDummy[2]),
                      CartItem(cartItem: listCartItemDummy[3]),
                      CartItem(cartItem: listCartItemDummy[4]),
                      
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimension.contentPadding,
                vertical: AppDimension.contentPadding,
              ),
              child: Column(
                children: [
                  CartInfoRowText(
                    title: 'Subtotal',
                    value: '244',
                  ),
                  CartInfoRowText(
                    title: 'Delivery',
                    value: '244',
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
                        '12312',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimension.contentPadding,
                  ),
                  ButtonWidget(
                    title: 'Checkout',
                    opTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
