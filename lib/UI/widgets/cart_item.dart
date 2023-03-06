// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/product_detail_screen.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/cart_item_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItemModel cartItem;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Slidable(
          // Specify a key if the Slidable is dismissible.
          key: ValueKey(widget.cartItem.id),
          endActionPane: ActionPane(
            extentRatio: 64 / MediaQuery.of(context).size.width,
            openThreshold: 0.1,
            closeThreshold: 0.8,
            // dismissible: DismissiblePane(onDismissed: () {}),
            motion: BehindMotion(),
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    CartServices.removeCart(
                      product: widget.cartItem.product,
                      quantity: 1,
                      removeAll: true,
                    );
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
          child: Obx(() => renderItemCartInfo()),
        ),
      ],
    );
  }

  Widget renderItemCartInfo() {
    GetxAppController getxApp = Get.find<GetxAppController>();
    List<CartItemModel> listCartItemCheckout = getxApp.listCartItemCheckout;

    int index = findCartInListCart(listCartItemCheckout, widget.cartItem.id);
    bool isChecked = false;

    if (index != -1) {
      isChecked = true;
    }

    return Container(
      color: Colors.white,
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
              GestureDetector(
                onTap: () {
                  CartServices.updateCartCheckout(cartItem: widget.cartItem);
                },
                child: Image.asset(
                  isChecked ? AssetHelper.iconCheck : AssetHelper.iconUncheck,
                  width: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            width: AppDimension.contentPadding / 2,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              widget.cartItem.product.thumbnail,
              width: 90,
              height: 90,
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.to(
                    () => ProductDetailScreen(
                      product: widget.cartItem.product,
                    ),
                    preventDuplicates: false,
                  ),
                  child: Text(
                    widget.cartItem.product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 12,
                // ),
                // Container(
                //   height: 24,
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 10,
                //   ),
                //   decoration: BoxDecoration(
                //     color: AppColors.greyDisable,
                //     borderRadius: BorderRadius.circular(4),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Green, Size 7',
                //         style: TextStyle(
                //           color: AppColors.grey,
                //           fontSize: 12,
                //         ),
                //       ),
                //       Image.asset(
                //         AssetHelper.iconChevronDown,
                //         width: 10,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatPrice(widget.cartItem.product.price),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          if (widget.cartItem.product.originalPrice != '')
                            Text(
                              formatPrice(
                                widget.cartItem.product.originalPrice,
                              ),
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.greyMid,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (widget.cartItem.quantity == 1) {
                                return;
                              }

                              CartServices.removeCart(
                                product: widget.cartItem.product,
                                quantity: 1,
                                isShowSnackBar: false,
                              );
                            },
                            child: Image.asset(
                              AssetHelper.iconDecreaseCart,
                              width: 30,
                            ),
                          ),
                          Text(
                            widget.cartItem.quantity.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              CartServices.addToCart(
                                product: widget.cartItem.product,
                                quantity: 1,
                                isShowSnackBar: false,
                              );
                            },
                            child: Image.asset(
                              AssetHelper.iconIncreaseCart,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
