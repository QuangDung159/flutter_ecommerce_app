// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/list_product_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/benefit_banner.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/smart_refresher_custom.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_category.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_horizontal.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/services/product_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabFeaturedWidget extends StatefulWidget {
  const TabFeaturedWidget({super.key});

  @override
  State<TabFeaturedWidget> createState() => _TabFeaturedWidgetState();
}

class _TabFeaturedWidgetState extends State<TabFeaturedWidget>
    with AutomaticKeepAliveClientMixin {
  List<ProductModel> listArrivalsFetched = [];
  List<ProductModel> listSaleItemsFetched = [];

  final GetxAppController getxApp = Get.find<GetxAppController>();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    // listArrivalsFetched = ProductService.fetchListProductHome();
    onFetch();
  }

  onFetch() async {
    await Future.wait([
      fetchListListProduct('Sale'),
      fetchListListProduct('New Arrivals'),
    ]);
  }

  Future<void> fetchListListProduct(String category) async {
    List<ProductModel> list = await ProductService.fetchListProductHome(
      category: category,
      limit: 5,
      page: 1,
    );

    if (category == 'Sale') {
      setState(() {
        listSaleItemsFetched = list;
      });
    } else {
      setState(() {
        listArrivalsFetched = list;
      });
    }
  }

  void _onRefresh() async {
    // monitor network fetch
    await onFetch();
    // if failed, use refreshFailed()
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    // monitor network fetch
    await onFetch();
    // if failed, use loadFailed(),if no data return,use LoadNoData()
    // items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresherCustom(
      enablePullDown: true,
      refreshController: _refreshController,
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 44,
                color: AppColors.blackPrimary,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimension.contentPadding,
                    ),
                    child: Text(
                      'End of Season Sale: Up to 50% off + Low in Stock',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              renderTopPanel(
                'Hot Deals',
                AssetHelper.panelHome1,
                onTapShopNow: () => Get.to(
                  () => ListProductScreen(
                    title: 'Hot Deals',
                    category: 'Sale',
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Summer Sale',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Up to 50% off with code: SS50',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Selected marked products excluded from promo',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              ListCategory(),
              SizedBox(
                height: 30,
              ),
              // FutureBuilder(
              //   future: listArrivalsFetched,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       final data = snapshot.data;
              //       return ListProductHorizontal(
              //         title: 'New Arrivals',
              //         listProduct: data!,
              //         isShowSeeAll: true,
              //         onTapSeeAll: () => Get.to(
              //           () => ListProductScreen(title: 'New Arrivals'),
              //         ),
              //       );
              //     } else {
              //       if (snapshot.hasData) {
              //         return const Center(
              //           child: Text(
              //             'Fail',
              //           ),
              //         );
              //       }
              //       return const Center(
              //         child: SizedBox(
              //           width: 30,
              //           height: 30,
              //           child: CircularProgressIndicator(),
              //         ),
              //       );
              //     }
              //   },
              // ),
              ListProductHorizontal(
                title: 'New Arrivals',
                listProduct: listArrivalsFetched,
                isShowSeeAll: true,
                onTapSeeAll: () => Get.to(
                  () => ListProductScreen(
                    title: 'New Arrivals',
                    category: 'New Arrivals',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListProductHorizontal(
                title: 'Sale Items',
                listProduct: listSaleItemsFetched,
                isShowSeeAll: true,
                onTapSeeAll: () => Get.to(
                  () => ListProductScreen(
                    title: 'Sale Items',
                    category: 'Sale',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.contentPadding,
                ),
                child: renderTopPanel(
                  'New Arrivals',
                  AssetHelper.panelHome2,
                  hasBorderRadius: true,
                  titlePadding: 16,
                  onTapShopNow: () => Get.to(
                    () => ListProductScreen(
                      title: 'New Arrivals',
                      category: 'New Arrivals',
                    ),
                  ),
                ),
              ),
              Obx(
                () => renderListRecentlyViewed(),
              ),
              SizedBox(
                height: 30,
              ),
              BenefitBanner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderListRecentlyViewed() {
    List<ProductModel> listRecentlyViewed = getxApp.listRecentlyViewed;

    if (listRecentlyViewed.isEmpty) {
      return Container();
    }

    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        ListProductHorizontal(
          title: 'Recently Viewed',
          listProduct: listRecentlyViewed,
        ),
      ],
    );
  }

  Widget renderTopPanel(
    String leftText,
    String imagePath, {
    bool? hasBorderRadius,
    double? titlePadding,
    Function()? onTapShopNow,
  }) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: hasBorderRadius ?? false
              ? BorderRadius.circular(12)
              : BorderRadius.zero,
          child: Image.asset(imagePath),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            // Clip it cleanly.
            borderRadius: hasBorderRadius ?? false
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )
                : BorderRadius.zero,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                alignment: Alignment.center,
                height: 50,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: titlePadding ?? AppDimension.contentPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        leftText,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onTapShopNow != null) {
                            onTapShopNow();
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Shop now',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: 21,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
