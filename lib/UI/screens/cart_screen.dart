// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_info_row_text.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_item.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/button_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();

  @override
  Widget build(BuildContext context) {
    GetxAppController getxAppController = Get.find<GetxAppController>();

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
                  child: Obx(
                    () => Column(
                      children: renderListCartItem(
                        getxAppController.listCartItem,
                      ),
                    ),
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

  List<Widget> renderListCartItem(List listCartItem) {
    List<Widget> listRender = [];

    for (var item in listCartItem) {
      listRender.add(
        CartItem(cartItem: item),
      );
    }
    return listRender;
  }
}
