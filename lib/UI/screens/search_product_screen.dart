// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/product_detail_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/textfield_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/voucher_item.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:get/get.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({
    super.key,
    this.navigationFrom,
  });

  final String? navigationFrom;

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();
  String promoCodeInput = '';

  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProductModel product = listProductDummy[2];
    bool hasOriginalPrice = product.originalPrice != '';

    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).padding.top,
          ),
          MyAppBar(
            hasBackButton: true,
            title: 'Search',
          ),
          renderInputPromoCode(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimension.contentPadding / 2,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                product.thumbnail,
                                width: 60,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => ProductDetailScreen(
                                      product: product,
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        if (hasOriginalPrice)
                                          Text(
                                            '${formatPrice(product.originalPrice)} ',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        Text(
                                          formatPrice(product.price),
                                          style: TextStyle(
                                            color: hasOriginalPrice
                                                ? AppColors.primary
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                CartServices.addCart(
                                  product: product,
                                  quantity: 1,
                                );
                              },
                              child: Icon(
                                Icons.add_shopping_cart_outlined,
                                color: AppColors.primary,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderInputPromoCode() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextFieldWidget(
              controller: textFieldController,
              hintText: 'Enter product name',
              onChanged: (value) {
                setState(() {
                  promoCodeInput = value;
                });
              },
            ),
          ),
          SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Search',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> renderListVoucherItem() {
    List<Widget> listRender = [];

    String? navigationFrom = widget.navigationFrom;
    bool showUseButton =
        navigationFrom == null ? false : navigationFrom == 'delivery_screen';

    for (var i = 0; i < listPromotionUserDummy.length; i++) {
      listRender.add(
        VoucherItem(
          promotionUserModel: listPromotionUserDummy[i],
          isLastItem: i == listPromotionUserDummy.length - 1,
          showUseButton: showUseButton,
        ),
      );
    }

    return listRender;
  }
}
